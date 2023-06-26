import 'package:pet_adoption_app/domain/entities/pet.dart';

abstract interface class AdoptPetUseCase {
  Future<void> execute(Pet pet);
}
