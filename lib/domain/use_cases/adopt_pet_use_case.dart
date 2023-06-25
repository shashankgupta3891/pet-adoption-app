import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/repositories/pet_repository.dart';

class AdoptPetUseCase {
  final PetRepository repository;

  AdoptPetUseCase(this.repository);

  Future<void> execute(Pet pet) {
    return repository.adoptPet(pet);
  }
}
