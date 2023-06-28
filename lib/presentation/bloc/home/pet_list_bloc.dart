import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/entities/pet_type.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

sealed class PetEvent {}

class GetPetsEvent extends PetEvent {
  final PetType? type;

  GetPetsEvent(this.type);
}

abstract class PetState {}

class InitialDataLoadingPetState extends PetState {}

class InitialLoadedPetState extends PetState {
  final List<Pet> pets;

  InitialLoadedPetState(this.pets);
}

class InitialErrorPetState extends PetState {
  final String error;

  InitialErrorPetState(this.error);
}

class PetListBloc extends Bloc<PetEvent, PetState> {
  late final GetPetsUseCase getPetsUseCase = getIt.get();

  final PetType? type;

  void onInitialLoad() {
    add(GetPetsEvent(type));
  }

  PetListBloc(this.type) : super(InitialDataLoadingPetState()) {
    on<GetPetsEvent>(_mapGetPetsEventToState);
  }

  Future<void> _mapGetPetsEventToState(
      GetPetsEvent event, Emitter<PetState> emit) async {
    try {
      print("event.type");
      print(event.type);
      final pets = await getPetsUseCase.execute(event.type, 1);
      print("pets");
      print(pets);
      emit(InitialLoadedPetState(pets));
    } catch (e) {
      emit(InitialErrorPetState('Failed to fetch pets: $e'));
    }
  }

  Future<List<Pet>> getMorePage(int page) async {
    return await getPetsUseCase.execute(type, page);
  }
}
