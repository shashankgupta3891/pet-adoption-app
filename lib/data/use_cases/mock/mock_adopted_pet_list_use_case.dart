// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/use_cases/check_pet_adoption_use_case.dart';
import 'package:pet_adoption_app/domain/use_cases/get_adopted_pet_list_use_case.dart';

class MockGetAdopterPetListUseCase implements GetAdopterPetListUseCase {
  final CheckPetAdoptionUseCase checkPetAdoptionUseCase;
  MockGetAdopterPetListUseCase(this.checkPetAdoptionUseCase);

  @override
  Future<List<Pet>> execute() async {
    final List<Pet> pets = getPetList();

    // Simulate an API delay
    await Future.delayed(const Duration(seconds: 2));

    final filteredList = <Pet>[];
    for (var element in pets) {
      final isAdopted = await checkPetAdoptionUseCase.execute(element);
      if (isAdopted) {
        //Make it manually Adopted
        element.isAdopted = true;
        filteredList.add(element);
      }
    }

    return filteredList.toList();
  }
}
