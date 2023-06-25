import 'package:get_it/get_it.dart';
import 'package:pet_adoption_app/data/api/api_client.dart';
import 'package:pet_adoption_app/data/repositories/api_repository.dart';
import 'package:pet_adoption_app/data/repositories/shared_local_storage_impl.dart';
import 'package:pet_adoption_app/domain/repositories/local_storage_repository.dart';
import 'package:pet_adoption_app/domain/repositories/pet_repository.dart';
import 'package:pet_adoption_app/domain/use_cases/adopt_pet_use_case.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

T get<T>() => GetIt.I<T>();

Future<void> setup() async {
  final sharedPref = await SharedPreferences.getInstance();
  configureDependencies(sharedPref);
}

void configureDependencies(SharedPreferences sharedPreferences) {
  GetIt.I.registerSingleton<LocalStorageRepository>(
      SharedPreferencesLocalStorageImpl(sharedPreferences));
  GetIt.I.registerSingleton<ApiClient>(ApiClient());
  setupRepository();
  setupUsecase();
}

void setupRepository() {
  GetIt.I.registerFactory<PetRepository>(() => ApiRepository(get()));
}

void setupUsecase() {
  GetIt.I.registerFactory<GetPetsUseCase>(() => GetPetsUseCase(get()));
  GetIt.I.registerFactory<AdoptPetUseCase>(() => AdoptPetUseCase(get()));
}
