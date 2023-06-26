import 'package:pet_adoption_app/domain/entities/pet.dart';

abstract interface class GetPetDetailUseCase {
  Future<Pet> execute(String id);
}
