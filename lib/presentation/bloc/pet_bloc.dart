import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/adopt_pet_use_case.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

abstract class PetEvent {}

class GetPetsEvent extends PetEvent {}

class AdoptPetEvent extends PetEvent {
  final Pet pet;

  AdoptPetEvent(this.pet);
}

abstract class PetState {}

class LoadingPetState extends PetState {}

class LoadedPetState extends PetState {
  final List<Pet> pets;

  LoadedPetState(this.pets);
}

class ErrorPetState extends PetState {
  final String error;

  ErrorPetState(this.error);
}

class PetBloc extends Bloc<PetEvent, PetState> {
  final GetPetsUseCase getPetsUseCase;
  final AdoptPetUseCase adoptPetUseCase;

  PetBloc(this.getPetsUseCase, this.adoptPetUseCase)
      : super(LoadingPetState()) {
    on<GetPetsEvent>(_mapGetPetsEventToState);
    on<AdoptPetEvent>(_mapAdoptPetEventToState);
  }

  Future<void> _mapGetPetsEventToState(
      GetPetsEvent event, Emitter<PetState> emit) async {
    try {
      final pets = await getPetsUseCase.execute();
      emit(LoadedPetState(pets));
    } catch (e) {
      emit(ErrorPetState('Failed to fetch pets: $e'));
    }
  }

  Future<void> _mapAdoptPetEventToState(
      AdoptPetEvent event, Emitter<PetState> emit) async {
    try {
      await adoptPetUseCase.execute(event.pet);
      emit(state); // No state change required, as the pet has been adopted
    } catch (e) {
      emit(ErrorPetState('Failed to adopt pet: $e'));
    }
  }
}
