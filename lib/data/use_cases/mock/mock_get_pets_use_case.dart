import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

class MockGetPetsUseCase implements GetPetsUseCase {
  @override
  Future<List<Pet>> execute(String? type) async {
    final List<Pet> pets = getPetList();

    // Simulate an API delay
    await Future.delayed(const Duration(seconds: 2));

    return pets;
  }
}
