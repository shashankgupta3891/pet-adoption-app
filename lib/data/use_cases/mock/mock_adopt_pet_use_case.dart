import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/adopt_pet_use_case.dart';

class MockAdoptPetsUseCase implements AdoptPetUseCase {
  @override
  Future<void> execute(Pet pet) async {
    pet.isAdopted = true;
    // Simulate an API delay
    await Future.delayed(const Duration(seconds: 2));
  }
}
