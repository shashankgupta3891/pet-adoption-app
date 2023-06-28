import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/core/const/media_const.dart';
import 'package:pet_adoption_app/presentation/bloc/home/search_pet_bloc.dart';
import 'package:pet_adoption_app/presentation/common/pet_list_item.dart';

import '../../common/loading_animation.dart';

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
          return const LoadingAnimation();
          ;
        } else if (state is LoadedSearchPetState) {
          if (state.pets.isEmpty) {
            return Center(
              child: Lottie.asset(AnimationConst.noDataAnimation),
            );
          }

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
