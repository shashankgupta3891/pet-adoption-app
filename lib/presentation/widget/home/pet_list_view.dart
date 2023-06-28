import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/core/const/media_const.dart';
import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/domain/entities/pet_type.dart';
import 'package:pet_adoption_app/presentation/bloc/home/pet_list_bloc.dart';
import 'package:pet_adoption_app/presentation/common/pet_list_item.dart';
import 'package:pet_adoption_app/utils/paginated_list_view.dart';

import 'package:pet_adoption_app/presentation/common/loading_animation.dart';

class PetListView extends StatefulWidget {
  final PetType? type;
  const PetListView({super.key, required this.type});

  @override
  State<PetListView> createState() => _PetListViewState();
}

class _PetListViewState extends State<PetListView> {
  late PetListBloc bloc;

  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    bloc = PetListBloc(widget.type)..onInitialLoad();
  }

  @override
  void didUpdateWidget(covariant PetListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.type != oldWidget.type) {
      bloc = PetListBloc(widget.type)..onInitialLoad();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final PetListBloc bloc = PetListBloc(widget.type);
    return BlocBuilder<PetListBloc, PetState>(
      bloc: bloc,
      builder: (context, state) {
        if (state is InitialDataLoadingPetState) {
          return const LoadingAnimation();
          ;
        } else if (state is InitialLoadedPetState) {
          if (state.pets.isEmpty) {
            return Center(
              child: Lottie.asset(AnimationConst.noDataAnimation),
            );
          }

          return Column(
            children: [
              Expanded(
                child: PaginatedListView<Pet>(
                  onFetch: bloc.getMorePage,
                  initialData: state.pets,
                  itemBuilder: (pet) {
                    return PetListItem(animal: pet);
                  },
                  onLoadStart: () {
                    setState(() {
                      isLoadingMore = true;
                    });
                  },
                  onLoadEnd: () {
                    setState(() {
                      isLoadingMore = false;
                    });
                  },
                ),
              ),
              if (isLoadingMore)
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LoadingAnimation(widget: 60),
                ),
            ],
          );
        } else if (state is InitialErrorPetState) {
          return Center(
            child: Text('Error: ${state.error}'),
          );
        }
        return Container();
      },
    );
  }
}
