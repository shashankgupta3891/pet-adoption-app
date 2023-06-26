import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/adopt_pet_use_case.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pet_detail_use_case.dart';

sealed class PetDetailEvent {}

class FetchPetDetailEvent extends PetDetailEvent {
  final String id;

  FetchPetDetailEvent(this.id);
}

class AdoptPetEvent extends PetDetailEvent {
  final Pet pet;

  AdoptPetEvent(this.pet);
}

abstract class PetDetailState {}

class LoadingPetDetailState extends PetDetailState {}

class LoadedPetDetailState extends PetDetailState {
  final Pet pet;

  LoadedPetDetailState(this.pet);
}

class ErrorPetDetailState extends PetDetailState {
  final String error;

  ErrorPetDetailState(this.error);
}

class PetDetailsBloc extends Bloc<PetDetailEvent, PetDetailState> {
  late final GetPetDetailUseCase getPetDetailUseCase = getIt.get();
  late final AdoptPetUseCase adoptPetUseCase = getIt.get();

  void onInitialLoad(String id) {
    add(FetchPetDetailEvent(id));
  }

  PetDetailsBloc() : super(LoadingPetDetailState()) {
    on<FetchPetDetailEvent>(_mapFetchPetDetailEventToState);
    on<AdoptPetEvent>(_mapAdoptPetEventToState);
  }

  Future<void> _mapFetchPetDetailEventToState(
      FetchPetDetailEvent event, Emitter<PetDetailState> emit) async {
    try {
      final pets = await getPetDetailUseCase.execute(event.id);
      emit(LoadedPetDetailState(pets));
    } catch (e) {
      emit(ErrorPetDetailState('Failed to fetch pets: $e'));
    }
  }

  Future<void> _mapAdoptPetEventToState(
      AdoptPetEvent event, Emitter<PetDetailState> emit) async {
    try {
      await adoptPetUseCase.execute(event.pet);
      emit(state); // No state change required, as the pet has been adopted
    } catch (e) {
      emit(ErrorPetDetailState('Failed to adopt pet: $e'));
    }
  }
}
