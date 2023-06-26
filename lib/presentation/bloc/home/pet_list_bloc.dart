import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

sealed class PetEvent {}

class GetPetsEvent extends PetEvent {
  final String? type;

  GetPetsEvent(this.type);
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

class PetListBloc extends Bloc<PetEvent, PetState> {
  late final GetPetsUseCase getPetsUseCase = getIt.get();

  void onInitialLoad(String? type) {
    add(GetPetsEvent(type));
  }

  PetListBloc() : super(LoadingPetState()) {
    on<GetPetsEvent>(_mapGetPetsEventToState);
  }

  Future<void> _mapGetPetsEventToState(
      GetPetsEvent event, Emitter<PetState> emit) async {
    try {
      final pets = await getPetsUseCase.execute(event.type);
      emit(LoadedPetState(pets));
    } catch (e) {
      emit(ErrorPetState('Failed to fetch pets: $e'));
    }
  }
}
