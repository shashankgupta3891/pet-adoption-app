import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/entities/pet_type.dart';
import 'package:pet_adoption_app/domain/repositories/pet_repository.dart';
import 'package:pet_adoption_app/domain/use_cases/get_pets_use_case.dart';

class GetPetsUseCaseImpl implements GetPetsUseCase {
  final PetRepository repository;

  GetPetsUseCaseImpl(this.repository);

  @override
  Future<List<Pet>> execute(PetType? type, int? page) {
    return repository.getPets();
  }
}
