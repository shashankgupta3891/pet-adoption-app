import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/get_adopted_pet_list_use_case.dart';

sealed class HistoryPetEvent {}

class GetHistoryPetEvent extends HistoryPetEvent {
  GetHistoryPetEvent();
}

abstract class HistoryPetState {}

class LoadingHistoryPetState extends HistoryPetState {}

class InitialHistoryPetState extends HistoryPetState {
  InitialHistoryPetState();
}

class LoadedHistoryPetState extends HistoryPetState {
  final List<Pet> pets;

  LoadedHistoryPetState(this.pets);
}

class ErrorHistoryPetState extends HistoryPetState {
  final String error;

  ErrorHistoryPetState(this.error);
}

class HistoryPetBloc extends Bloc<HistoryPetEvent, HistoryPetState> {
  late final GetAdopterPetListUseCase _getAdopterPetListUseCase = getIt.get();

  void onInitialLoad() {
    add(GetHistoryPetEvent());
  }

  HistoryPetBloc() : super(InitialHistoryPetState()) {
    on<GetHistoryPetEvent>(_mapGetHistoryPetEventToState);
  }

  Future<void> _mapGetHistoryPetEventToState(
      GetHistoryPetEvent event, Emitter<HistoryPetState> emit) async {
    try {
      emit(LoadingHistoryPetState());
      final pets = await _getAdopterPetListUseCase.execute();

      emit(LoadedHistoryPetState(pets));
    } catch (e) {
      emit(ErrorHistoryPetState('Failed to fetch pets: $e'));
    }
  }
}
