import 'package:pet_adoption_app/domain/repositories/pet_repository.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/data/api/api_client.dart';

class ApiRepository implements PetRepository {
  final ApiClient apiClient;

  ApiRepository(this.apiClient);

  @override
  Future<List<Pet>> getPets() async {
    // Make API call to fetch pets
    final petData = await apiClient.get("/get-pets");

    // Convert API response to List<Pet>
    final pets = petData.data.map((petJson) => Pet.fromJson(petJson)).toList();

    return pets;
  }

  @override
  Future<void> adoptPet(Pet pet) async {
    // Make API call to adopt a pet
    await apiClient.post("/adopt-pet", pet);
  }
}
