import 'package:pet_adoption_app/domain/entities/pet.dart';

abstract interface class GetPetsUseCase {
  Future<List<Pet>> execute();
}
