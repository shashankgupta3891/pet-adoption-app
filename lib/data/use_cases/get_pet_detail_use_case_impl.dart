import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/repositories/pet_repository.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pet_detail_use_case.dart';

class GetPetDetailUseCaseImpl implements GetPetDetailUseCase {
  final PetRepository repository;

  GetPetDetailUseCaseImpl(this.repository);

  @override
  Future<Pet> execute(String id) {
    return repository.getPetDetail(id);
  }
}
