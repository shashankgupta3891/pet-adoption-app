// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/adopt_pet_use_case.dart';
import 'package:pet_adoption_app/domain/use_cases/check_pet_adoption_use_case.dart';

sealed class PetDetailEvent {}

class AdoptPetEvent extends PetDetailEvent {
  final Pet pet;

  AdoptPetEvent(this.pet);
}

class CheckForAdoptedPetEvent extends PetDetailEvent {
  final Pet pet;

  CheckForAdoptedPetEvent(this.pet);
}

sealed class PetDetailState {
  final Pet pet;
  PetDetailState(this.pet);
}

class InitialPetDetailState extends PetDetailState {
  InitialPetDetailState(super.pet);
}

class LoadingPetDetailState extends PetDetailState {
  LoadingPetDetailState(super.pet);
}

class SuccessPetDetailState extends PetDetailState {
  SuccessPetDetailState(super.pet);
}

class SuccessAdoptPetDetailState extends SuccessPetDetailState {
  SuccessAdoptPetDetailState(super.pet);
}

class SuccessAdoptionCheckPetDetailState extends SuccessPetDetailState {
  SuccessAdoptionCheckPetDetailState(super.pet);
}

class ErrorPetDetailState extends PetDetailState {
  final String error;

  ErrorPetDetailState(super.pet, this.error);
}

class PetDetailsBloc extends Bloc<PetDetailEvent, PetDetailState> {
  final CheckPetAdoptionUseCase checkPetAdoptionUseCase;
  final AdoptPetUseCase adoptPetUseCase;

  void onAdopt() {
    add(AdoptPetEvent(state.pet));
  }

  void onCheckOfAdoption() {
    add(CheckForAdoptedPetEvent(state.pet));
  }

  PetDetailsBloc(Pet pet, this.checkPetAdoptionUseCase, this.adoptPetUseCase)
      : super(InitialPetDetailState(pet)) {
    on<CheckForAdoptedPetEvent>(_mapCheckForAdoptionEventToState);
    on<AdoptPetEvent>(_mapAdoptPetEventToState);
  }

  Future<void> _mapCheckForAdoptionEventToState(
      CheckForAdoptedPetEvent event, Emitter<PetDetailState> emit) async {
    try {
      emit(LoadingPetDetailState(state.pet));
      final isAdopted = await checkPetAdoptionUseCase.execute(event.pet);

      final newPet = event.pet..isAdopted = isAdopted;

      emit(SuccessAdoptionCheckPetDetailState(newPet));
    } catch (e) {
      emit(ErrorPetDetailState(state.pet, 'Failed to adopt pet: $e'));
    }
  }

  Future<void> _mapAdoptPetEventToState(
      AdoptPetEvent event, Emitter<PetDetailState> emit) async {
    try {
      emit(LoadingPetDetailState(state.pet));
      await adoptPetUseCase.execute(event.pet);
      final newPet = event.pet..isAdopted = true;
      emit(SuccessAdoptPetDetailState(newPet));
    } catch (e) {
      emit(ErrorPetDetailState(state.pet, 'Failed to adopt pet: $e'));
    }
  }

  bool isAdopted() {
    return state.pet.isAdopted;
  }

  bool isDisabled() {
    return state is LoadingPetDetailState || isAdopted();
  }
}
