import 'package:pet_adoption_app/domain/entities/pet.dart';

abstract interface class CheckPetAdoptionUseCase {
  Future<bool> execute(Pet pet);
}
