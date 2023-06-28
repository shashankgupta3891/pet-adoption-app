import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/core/const/media_const.dart';
import 'package:pet_adoption_app/presentation/bloc/history_list_bloc.dart';
import 'package:pet_adoption_app/presentation/common/pet_list_item.dart';

import '../common/loading_animation.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  FocusNode focusNode = FocusNode();
  // List<String> animalTypes = [
  //   'Cats',
  //   'Dogs',
  //   'Parrots',
  //   'Fish',
  // ];

  // List<IconData> animalIcons = [
  //   FontAwesomeIcons.cat,
  //   FontAwesomeIcons.dog,
  //   FontAwesomeIcons.crow,
  //   FontAwesomeIcons.fish,
  //   FontAwesomeIcons.fish,
  // ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        InkWell(
                          child: const Icon(
                            FontAwesomeIcons.arrowLeft,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'History',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.0,
                                  color: Theme.of(context).primaryColor
                                  // .withOpacity(0.4),
                                  ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          radius: 20.0,
                          backgroundImage:
                              AssetImage(ImageConst.transparentCat),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).primaryColor.withOpacity(0.06),
                  ),
                  child: Column(
                    children: <Widget>[
                      // const SizedBox(height: 20),
                      Expanded(
                        child: BlocBuilder<HistoryPetBloc, HistoryPetState>(
                          bloc: HistoryPetBloc()..onInitialLoad(),
                          builder: (context, state) {
                            if (state is LoadingHistoryPetState) {
                              return const LoadingAnimation();
                            } else if (state is LoadedHistoryPetState) {
                              if (state.pets.isEmpty) {
                                return Center(
                                  child: Lottie.asset(
                                    AnimationConst.noDataAnimation,
                                  ),
                                );
                              }

                              return ListView.builder(
                                itemCount: state.pets.length,
                                itemBuilder: (context, index) {
                                  final pet = state.pets[index];
                                  return PetListItem(animal: pet);
                                },
                              );
                            } else if (state is ErrorHistoryPetState) {
                              return Center(
                                child: Text('Error: ${state.error}'),
                              );
                            }
                            return Container();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
