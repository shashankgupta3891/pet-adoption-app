import 'dart:math';

import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

class MockGetPetsUseCase implements GetPetsUseCase {
  @override
  Future<List<Pet>> execute(String? type, int? page) async {
    final List<Pet> pets = getPetList();

    // Simulate an API delay
    await Future.delayed(const Duration(seconds: 2));

    if (page == null) {
      return pets;
    } else {
      try {
        final pageStartItem = page * 10;
        final pageEndItem = max((page + 1) * 10, pets.length);
        return pets.sublist(pageStartItem, pageEndItem);
      } catch (e) {
        return [];
      }
    }
  }
}
