import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/presentation/bloc/home/search_pet_bloc.dart';
import 'package:pet_adoption_app/presentation/widgets/pet_list_item.dart';

class PetSearchView extends StatelessWidget {
  final String query;

  const PetSearchView({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPetBloc, SearchPetState>(
      bloc: SearchPetBloc()..onSearch(query),
      builder: (context, state) {
        if (state is LoadingSearchPetState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedSearchPetState) {
          return ListView.builder(
            itemCount: state.pets.length,
            itemBuilder: (context, index) {
              final pet = state.pets[index];
              return PetListItem(animal: pet);
            },
          );
        } else if (state is ErrorSearchPetState) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }
        return Container();
      },
    );
  }
}
