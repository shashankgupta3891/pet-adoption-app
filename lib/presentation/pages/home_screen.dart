import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption_app/presentation/bloc/home/pet_list_bloc.dart';
import 'package:pet_adoption_app/presentation/bloc/home/search_pet_bloc.dart';
import 'package:pet_adoption_app/presentation/pages/history_page.dart';
import 'package:pet_adoption_app/presentation/widgets/home/app_bar.dart';
import 'package:pet_adoption_app/presentation/widgets/home/pet_list_view.dart';
import 'package:pet_adoption_app/presentation/widgets/home/pet_search_view.dart';
import 'package:pet_adoption_app/presentation/widgets/home/pet_type_item.dart';
import 'package:pet_adoption_app/presentation/widgets/pet_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode focusNode = FocusNode();
  String searchText = "";

  int? selectedAnimalIconIndex;

  List<String> animalTypes = [
    'Cats',
    'Dogs',
    'Parrots',
    'Fish',
    'Fish',
  ];

  List<IconData> animalIcons = [
    FontAwesomeIcons.cat,
    FontAwesomeIcons.dog,
    FontAwesomeIcons.crow,
    FontAwesomeIcons.fish,
    FontAwesomeIcons.fish,
  ];

  bool get isSearchingEnabled => searchText.isNotEmpty;
  String? get type => selectedAnimalIconIndex == null
      ? null
      : animalTypes[selectedAnimalIconIndex!];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HistoryPage(),
              ),
            );
          },
          label: const Text("History"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Column(
                  children: [
                    const HomeAppBar(),
                    const SizedBox(height: 20),
                    CupertinoSearchTextField(
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                      onSubmitted: (value) {},
                      // autocorrect: true,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).primaryColor.withOpacity(0.06),
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        if (isSearchingEnabled) ...[
                          PetSearchView(query: searchText)
                        ] else ...[
                          SizedBox(
                            height: 120.0,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.only(
                                left: 24.0,
                                top: 8.0,
                              ),
                              scrollDirection: Axis.horizontal,
                              itemCount: animalTypes.length,
                              itemBuilder: (context, index) {
                                final isSelected =
                                    index == selectedAnimalIconIndex;
                                return PetTypeItem(
                                  isSelected: isSelected,
                                  onClick: () {
                                    setState(() {
                                      selectedAnimalIconIndex =
                                          isSelected ? null : index;
                                    });
                                  },
                                  icon: animalIcons[index],
                                  typeName: animalTypes[index],
                                );
                              },
                            ),
                          ),
                          PetListView(type: type)
                        ]
                      ],
                    ),
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
