import 'package:pet_adoption_app/domain/entities/pet.dart';

abstract interface class GetAdopterPetListUseCase {
  Future<List<Pet>> execute();
}
