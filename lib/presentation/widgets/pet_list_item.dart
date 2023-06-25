import 'package:flutter/material.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';

class PetListItem extends StatelessWidget {
  final Pet pet;
  final VoidCallback onAdopt;

  const PetListItem({super.key, required this.pet, required this.onAdopt});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(pet.imageUrl),
      title: Text(pet.name),
      subtitle:
          Text('Age: ${pet.age} - Price: \$${pet.price.toStringAsFixed(2)}'),
      trailing: ElevatedButton(
        onPressed: pet.isAdopted ? null : onAdopt,
        child: const Text('Adopt Me'),
      ),
    );
  }
}
