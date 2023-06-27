// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pet_adoption_app/di/locator.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/repositories/local_storage_repository.dart';
import 'package:pet_adoption_app/domain/use_cases/get_adopted_pet_list_use_case.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

class MockGetAdopterPetListUseCase implements GetAdopterPetListUseCase {
  final LocalStorageRepository localStorageRepository;
  MockGetAdopterPetListUseCase(this.localStorageRepository);

  final String adopterKey = "ADOPTED_PET";

  @override
  Future<List<Pet>> execute() async {
    final List<Pet> pets = getPetList();

    final adoptedData =
        AdoptedDataManager(await localStorageRepository.getString(adopterKey));

    final adoptedDataSet = adoptedData.set;

    pets.where((element) => adoptedDataSet.contains(element.id));
    // Simulate an API delay
    await Future.delayed(const Duration(seconds: 2));

    return pets
        .where((element) => adoptedDataSet.contains(element.id))
        .toList();
  }
}

class AdoptedDataManager {
  Set<String> _data = {};

  List<String> get list => _data.toList();

  Set<String> get set => _data;

  AdoptedDataManager(String? data) {
    if (data?.isNotEmpty ?? false) {
      _data = data!.split(",").toSet();
    }
  }

  void add(String id) {
    _data.add(id);
  }

  @override
  String toString() {
    return _data.toList().join(",");
  }
}
