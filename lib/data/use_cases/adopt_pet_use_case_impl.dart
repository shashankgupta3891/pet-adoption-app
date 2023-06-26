import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/repositories/pet_repository.dart';
import 'package:pet_adoption_app/domain/use_cases/adopt_pet_use_case.dart';

class AdoptPetUseCaseImpl implements AdoptPetUseCase {
  final PetRepository repository;

  AdoptPetUseCaseImpl(this.repository);

  @override
  Future<void> execute(Pet pet) {
    return repository.adoptPet(pet);
  }
}
