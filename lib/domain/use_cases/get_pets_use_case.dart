import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/entities/pet_type.dart';
import 'package:pet_adoption_app/presentation/pages/home_screen.dart';

abstract interface class GetPetsUseCase {
  Future<List<Pet>> execute(PetType? type, int? page);
}
