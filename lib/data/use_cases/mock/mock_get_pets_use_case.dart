import 'dart:math';

import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/entities/pet_type.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

class MockGetPetsUseCase implements GetPetsUseCase {
  @override
  Future<List<Pet>> execute(PetType? type, int? page) async {
    const itemPerPage = 10;

    List<Pet> pets = getPetList();

    // Simulate an API delay
    await Future.delayed(const Duration(seconds: 2));

    if (type != null) {
      pets = pets.where((element) => element.type == type).toList();
    }

    if (page == null) {
      return pets;
    } else {
      try {
        final pageStartItem = (page - 1) * itemPerPage;
        final pageEndItem = max(page * itemPerPage, pets.length);
        return pets.sublist(pageStartItem, pageEndItem);
      } catch (e) {
        return [];
      }
    }
  }
}
