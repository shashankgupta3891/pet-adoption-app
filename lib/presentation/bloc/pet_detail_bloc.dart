// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/adopt_pet_use_case.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pet_detail_use_case.dart';

sealed class PetDetailEvent {}

class AdoptPetEvent extends PetDetailEvent {
  final Pet pet;

  AdoptPetEvent(this.pet);
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

class SuccessAdoptPetDetailState extends PetDetailState {
  SuccessAdoptPetDetailState(super.pet);
}

class ErrorPetDetailState extends PetDetailState {
  final String error;

  ErrorPetDetailState(super.pet, this.error);
}

class PetDetailsBloc extends Bloc<PetDetailEvent, PetDetailState> {
  late final GetPetDetailUseCase getPetDetailUseCase = getIt.get();
  late final AdoptPetUseCase adoptPetUseCase = getIt.get();

  // Pet _pet;

  void onAdopt() {
    print("AdoptPetEvent");
    add(AdoptPetEvent(state.pet));
  }

  PetDetailsBloc(Pet pet) : super(InitialPetDetailState(pet)) {
    on<AdoptPetEvent>(_mapAdoptPetEventToState);
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
    final tempState = state;
    if (tempState is SuccessAdoptPetDetailState) {
      return state.pet.isAdopted;
    }
    return false;
  }

  bool isDisabled() {
    return state is LoadingPetDetailState || isAdopted();
  }
}
