import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption_app/core/const/media_const.dart';
import 'package:pet_adoption_app/domain/entities/pet_type.dart';
import 'package:pet_adoption_app/presentation/pages/history_page.dart';
import 'package:pet_adoption_app/presentation/widget/home/app_bar.dart';
import 'package:pet_adoption_app/presentation/widget/home/drawer.dart';
import 'package:pet_adoption_app/presentation/widget/home/pet_list_view.dart';
import 'package:pet_adoption_app/presentation/widget/home/pet_search_view.dart';
import 'package:pet_adoption_app/presentation/widget/home/pet_type_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FocusNode focusNode = FocusNode();
  String searchText = "";
  TextEditingController searchController = TextEditingController();
  int? selectedPetIconIndex;

  bool get isSearchingEnabled => searchText.isNotEmpty;
  PetType? get type => selectedPetIconIndex == null
      ? null
      : PetType.values[selectedPetIconIndex!];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
        searchController.clear();
      },
      child: WillPopScope(
        onWillPop: () async {
          if (isSearchingEnabled) {
            setState(() {
              searchText = "";
            });

            searchController.clear();
            focusNode.unfocus();
            return false;
          }

          return true;
        },
        child: Scaffold(
          drawer: const HomeDrawer(),
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
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            searchText = value;
                          });
                        },
                        onSubmitted: (value) {},
                        // autocorrect: true,
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.06),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              const SizedBox(height: 20),
                              if (isSearchingEnabled) ...[
                                Expanded(
                                    child: PetSearchView(query: searchText))
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
                                    itemCount: PetType.values.length,
                                    itemBuilder: (context, index) {
                                      final isSelected =
                                          index == selectedPetIconIndex;
                                      return PetTypeItem(
                                        type: PetType.values[index],
                                        isSelected: isSelected,
                                        onClick: () {
                                          setState(() {
                                            selectedPetIconIndex =
                                                isSelected ? null : index;
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                                Expanded(child: PetListView(type: type))
                              ]
                            ],
                          ),
                        ),
                      ),
                      AnimatedSwitcher(
                        switchInCurve: Curves.decelerate,
                        duration: const Duration(seconds: 1),
                        child: (selectedPetIconIndex != null)
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: FloatingActionButton.small(
                                  elevation: 2,
                                  onPressed: () {
                                    setState(() {
                                      selectedPetIconIndex = null;
                                    });
                                  },
                                  backgroundColor: Colors.redAccent,
                                  foregroundColor: Colors.white,
                                  child: const Icon(FontAwesomeIcons.xmark),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
