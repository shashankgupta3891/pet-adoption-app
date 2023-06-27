import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

sealed class SearchPetEvent {}

class GetSearchPetEvent extends SearchPetEvent {
  final String query;

  GetSearchPetEvent(this.query);
}

abstract class SearchPetState {}

class LoadingSearchPetState extends SearchPetState {}

class LoadedSearchPetState extends SearchPetState {
  final List<Pet> pets;

  LoadedSearchPetState(this.pets);
}

class ErrorSearchPetState extends SearchPetState {
  final String error;

  ErrorSearchPetState(this.error);
}

class SearchPetBloc extends Bloc<SearchPetEvent, SearchPetState> {
  late final GetPetsUseCase getPetsUseCase = getIt.get();

  void onSearch(String query) {
    add(GetSearchPetEvent(query));
  }

  SearchPetBloc() : super(LoadingSearchPetState()) {
    on<GetSearchPetEvent>(_mapGetPetsEventToState);
  }

  Future<void> _mapGetPetsEventToState(
      GetSearchPetEvent event, Emitter<SearchPetState> emit) async {
    try {
      final pets = await getPetsUseCase.execute(null, null);
      final searchedList = pets
          .where(
            (element) =>
                element.name.toLowerCase().contains(event.query.toLowerCase()),
          )
          .toList();
      emit(LoadedSearchPetState(searchedList));
    } catch (e) {
      emit(ErrorSearchPetState('Failed to fetch pets: $e'));
    }
  }
}
