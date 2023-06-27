import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/presentation/bloc/home/pet_list_bloc.dart';
import 'package:pet_adoption_app/presentation/common/pet_list_item.dart';

class PetListView extends StatefulWidget {
  final String? type;
  const PetListView({super.key, required this.type});

  @override
  State<PetListView> createState() => _PetListViewState();
}

class _PetListViewState extends State<PetListView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetListBloc, PetState>(
      bloc: PetListBloc()..onInitialLoad(widget.type),
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
              return PetListItem(animal: pet);
            },
          );
        } else if (state is ErrorPetState) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }
        return Container();
      },
    );
  }
}
