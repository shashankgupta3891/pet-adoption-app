import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

class MockGetPetsUseCase implements GetPetsUseCase {
  @override
  Future<List<Pet>> execute() async {
    final List<Pet> pets = [];

    for (int i = 1; i <= 35; i++) {
      final pet = Pet(
        id: i.toString(),
        name: 'Pet $i',
        age: i % 10,
        price: 10.0 * i,
        breed: '',
        imageUrl: 'https://example.com/images/pet$i.jpg',
        isAdopted: false,
      );
      pets.add(pet);
    }

    // Simulate an API delay
    await Future.delayed(const Duration(seconds: 2));

    return pets;
  }
}
