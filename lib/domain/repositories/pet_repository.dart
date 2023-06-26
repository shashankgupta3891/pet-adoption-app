import 'package:pet_adoption_app/domain/entities/pet.dart';

abstract class PetRepository {
  Future<List<Pet>> getPets();
  Future<Pet> getPetDetail(String id);
  Future<void> adoptPet(Pet pet);
}
