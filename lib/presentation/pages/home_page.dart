import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/presentation/bloc/pet_bloc.dart';
import 'package:pet_adoption_app/presentation/widgets/pet_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PetBloc _petBloc;

  @override
  void initState() {
    super.initState();
    _petBloc = context.read<PetBloc>();
    _petBloc.add(GetPetsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Adoption'),
      ),
      body: BlocBuilder<PetBloc, PetState>(
        builder: (context, state) {
          if (state is LoadingPetState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedPetState) {
            return ListView.builder(
              itemCount: state.pets.length,
              itemBuilder: (context, index) {
                final pet = state.pets[index];
                return PetListItem(
                  pet: pet,
                  onAdopt: () => _adoptPet(pet),
                );
              },
            );
          } else if (state is ErrorPetState) {
            return Center(
              child: Text('Error: ${state.error}'),
            );
          }
          return Container();
        },
      ),
    );
  }

  void _adoptPet(Pet pet) {
    _petBloc.add(AdoptPetEvent(pet));
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Congratulations!'),
        content: Text('You\'ve now adopted ${pet.name}!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _petBloc.close();
    super.dispose();
  }
}
