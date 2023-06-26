import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption_app/presentation/pages/animal_detail_screen.dart';
import 'package:pet_adoption_app/presentation/pages/history_page.dart';

class Animal {
  String? name;
  String? scientificName;
  double? age;
  String? distanceToUser;
  bool? isFemale;
  String? imageUrl;
  Color? backgroundColor;

  int? weight;

  Animal({
    this.name,
    this.scientificName,
    this.age,
    this.distanceToUser,
    this.isFemale,
    this.imageUrl,
    this.backgroundColor,
    this.weight,
  });
}

class AdoptionScreen extends StatefulWidget {
  const AdoptionScreen({super.key});

  @override
  _AdoptionScreenState createState() => _AdoptionScreenState();
}

class _AdoptionScreenState extends State<AdoptionScreen> {
  int selectedAnimalIconIndex = 0;

  final List<Animal> animals = [
    Animal(
      name: 'Sola',
      scientificName: 'Abyssinian cat',
      age: 2.0,
      distanceToUser: '3.6 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(203, 213, 216, 1.0),
    ),
    Animal(
      name: 'Orion',
      scientificName: 'Abyssinian cat',
      age: 1.5,
      distanceToUser: '7.8 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(237, 214, 180, 1.0),
    ),
    Animal(
      name: 'Luna',
      scientificName: 'American Shorthair',
      age: 3.0,
      distanceToUser: '6.5 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(214, 218, 234, 1.0),
    ),
    Animal(
      name: 'Milo',
      scientificName: 'Siamese',
      age: 2.0,
      distanceToUser: '3.3 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(243, 218, 203, 1.0),
    ),
    Animal(
      name: 'Charlie',
      scientificName: 'Maine Coon',
      age: 4.5,
      distanceToUser: '2.7 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(213, 230, 221, 1.0),
    ),
    Animal(
      name: 'Lucy',
      scientificName: 'Persian',
      age: 2.5,
      distanceToUser: '5.1 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(249, 216, 215, 1.0),
    ),
    Animal(
      name: 'Oliver',
      scientificName: 'Scottish Fold',
      age: 3.0,
      distanceToUser: '4.2 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(226, 220, 230, 1.0),
    ),
    Animal(
      name: 'Chloe',
      scientificName: 'Ragdoll',
      age: 1.8,
      distanceToUser: '6.3 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(220, 224, 238, 1.0),
    ),
    Animal(
      name: 'Max',
      scientificName: 'Bengal',
      age: 2.2,
      distanceToUser: '3.9 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(244, 222, 205, 1.0),
    ),
    Animal(
      name: 'Lola',
      scientificName: 'Sphynx',
      age: 1.5,
      distanceToUser: '7.1 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(222, 236, 215, 1.0),
    ),
    Animal(
      name: 'Leo',
      scientificName: 'Russian Blue',
      age: 2.8,
      distanceToUser: '4.8 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(232, 221, 237, 1.0),
    ),
    Animal(
      name: 'Mia',
      scientificName: 'British Shorthair',
      age: 3.2,
      distanceToUser: '5.9 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(246, 214, 209, 1.0),
    ),
    Animal(
      name: 'Oscar',
      scientificName: 'Devon Rex',
      age: 1.9,
      distanceToUser: '7.4 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(214, 232, 224, 1.0),
    ),
    Animal(
      name: 'Bella',
      scientificName: 'Balinese',
      age: 2.5,
      distanceToUser: '4.5 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(252, 211, 207, 1.0),
    ),
    Animal(
      name: 'Tiger',
      scientificName: 'Toyger',
      age: 2.3,
      distanceToUser: '4.1 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(228, 218, 236, 1.0),
    ),
    Animal(
      name: 'Sophie',
      scientificName: 'Himalayan',
      age: 3.5,
      distanceToUser: '6.9 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(217, 225, 239, 1.0),
    ),
    Animal(
      name: 'Rocky',
      scientificName: 'Norwegian Forest Cat',
      age: 4.2,
      distanceToUser: '2.5 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(235, 219, 231, 1.0),
    ),
    Animal(
      name: 'Lily',
      scientificName: 'Tonkinese',
      age: 2.7,
      distanceToUser: '5.4 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(251, 209, 203, 1.0),
    ),
    Animal(
      name: 'Simba',
      scientificName: 'Egyptian Mau',
      age: 1.7,
      distanceToUser: '8.2 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(210, 238, 221, 1.0),
    ),
    Animal(
      name: 'Lucky',
      scientificName: 'Singapura',
      age: 2.1,
      distanceToUser: '4.8 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(230, 215, 236, 1.0),
    ),
    Animal(
      name: 'Coco',
      scientificName: 'Chartreux',
      age: 3.8,
      distanceToUser: '6.2 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(208, 228, 235, 1.0),
    ),
    Animal(
      name: 'Teddy',
      scientificName: 'Turkish Van',
      age: 1.6,
      distanceToUser: '7.7 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(225, 233, 241, 1.0),
    ),
    Animal(
      name: 'Misty',
      scientificName: 'Burmese',
      age: 2.9,
      distanceToUser: '3.2 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(242, 212, 202, 1.0),
    ),
    Animal(
      name: 'Jack',
      scientificName: 'Manx',
      age: 2.4,
      distanceToUser: '5.6 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(246, 206, 201, 1.0),
    ),
    Animal(
      name: 'Daisy',
      scientificName: 'Oriental',
      age: 3.3,
      distanceToUser: '4.7 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(222, 227, 243, 1.0),
    ),
    Animal(
      name: 'Buddy',
      scientificName: 'Somali',
      age: 2.2,
      distanceToUser: '4.3 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(249, 202, 197, 1.0),
    ),
    Animal(
      name: 'Misty',
      scientificName: 'Burmilla',
      age: 1.9,
      distanceToUser: '7.9 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(220, 234, 229, 1.0),
    ),
    Animal(
      name: 'Rocky',
      scientificName: 'Japanese Bobtail',
      age: 4.7,
      distanceToUser: '3.1 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(238, 199, 195, 1.0),
    ),
    Animal(
      name: 'Coco',
      scientificName: 'LaPerm',
      age: 3.1,
      distanceToUser: '6.1 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(213, 223, 232, 1.0),
    ),
    Animal(
      name: 'Max',
      scientificName: 'Havana Brown',
      age: 2.6,
      distanceToUser: '5.2 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(229, 196, 192, 1.0),
    ),
    Animal(
      name: 'Lola',
      scientificName: 'Munchkin',
      age: 1.8,
      distanceToUser: '7.2 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(244, 190, 186, 1.0),
    ),
    Animal(
      name: 'Leo',
      scientificName: 'Siberian',
      age: 3.6,
      distanceToUser: '2.9 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(225, 219, 230, 1.0),
    ),
    Animal(
      name: 'Sophie',
      scientificName: 'Bombay',
      age: 2.3,
      distanceToUser: '4.4 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(241, 186, 182, 1.0),
    ),
    Animal(
      name: 'Charlie',
      scientificName: 'Cornish Rex',
      age: 2.7,
      distanceToUser: '5.3 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(218, 216, 235, 1.0),
    ),
    Animal(
      name: 'Lily',
      scientificName: 'Aegean',
      age: 1.7,
      distanceToUser: '8.1 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(236, 182, 178, 1.0),
    ),
    Animal(
      name: 'Oscar',
      scientificName: 'Singapura',
      age: 2.1,
      distanceToUser: '4.9 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(212, 226, 220, 1.0),
    ),
    Animal(
      name: 'Bella',
      scientificName: 'Mekong Bobtail',
      age: 3.9,
      distanceToUser: '6.0 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(228, 178, 175, 1.0),
    ),
    Animal(
      name: 'Simba',
      scientificName: 'Peterbald',
      age: 2.4,
      distanceToUser: '5.5 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(232, 212, 207, 1.0),
    ),
    Animal(
      name: 'Lucy',
      scientificName: 'Egyptian Mau',
      age: 1.6,
      distanceToUser: '7.6 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(208, 220, 214, 1.0),
    ),
    Animal(
      name: 'Teddy',
      scientificName: 'Korat',
      age: 2.9,
      distanceToUser: '3.3 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(253, 174, 171, 1.0),
    ),
    Animal(
      name: 'Molly',
      scientificName: 'American Bobtail',
      age: 3.3,
      distanceToUser: '4.6 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(202, 214, 229, 1.0),
    ),
    Animal(
      name: 'Rocky',
      scientificName: 'Selkirk Rex',
      age: 2.2,
      distanceToUser: '4.2 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(244, 169, 166, 1.0),
    ),
    Animal(
      name: 'Daisy',
      scientificName: 'Sphynx',
      age: 1.9,
      distanceToUser: '8.0 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(215, 206, 231, 1.0),
    ),
    Animal(
      name: 'Max',
      scientificName: 'Birman',
      age: 4.7,
      distanceToUser: '3.0 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(233, 164, 161, 1.0),
    ),
    Animal(
      name: 'Chloe',
      scientificName: 'Kurilian Bobtail',
      age: 3.1,
      distanceToUser: '6.0 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(191, 202, 220, 1.0),
    ),
    Animal(
      name: 'Oliver',
      scientificName: 'Ocicat',
      age: 2.6,
      distanceToUser: '5.4 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(255, 160, 157, 1.0),
    ),
    Animal(
      name: 'Mia',
      scientificName: 'Pixie-bob',
      age: 2.3,
      distanceToUser: '4.5 km',
      isFemale: true,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(209, 198, 232, 1.0),
    ),
    Animal(
      name: 'Toby',
      scientificName: 'Norwegian Forest Cat',
      age: 1.7,
      distanceToUser: '7.5 km',
      isFemale: false,
      imageUrl: 'assets/images/sola.png',
      backgroundColor: const Color.fromRGBO(240, 155, 152, 1.0),
    ),
  ];

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

  Widget buildAnimalIcon(int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedAnimalIconIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedAnimalIconIndex == index
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    color: selectedAnimalIconIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  animalIcons[index],
                  size: 25.0,
                  color: selectedAnimalIconIndex == index
                      ? Colors.white
                      : Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            animalTypes[index],
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        child: const Icon(
                          FontAwesomeIcons.bars,
                        ),
                        onTap: () {},
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            'Location',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.0,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: Theme.of(context).primaryColor,
                              ),
                              const Text(
                                'Shahdara, ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22.0,
                                ),
                              ),
                              const Text(
                                'Delhi',
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 22.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage('assets/images/sola.png'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CupertinoSearchTextField(
                    controller: TextEditingController(),
                    onChanged: (value) {},
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
                            return buildAnimalIcon(index);
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          itemCount: animals.length,
                          itemBuilder: (context, index) {
                            final animal = animals[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return AnimalDetailScreen(animal: animal);
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 10.0,
                                  right: 20.0,
                                  left: 20.0,
                                ),
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: <Widget>[
                                    Material(
                                      borderRadius: BorderRadius.circular(20.0),
                                      elevation: 4.0,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0,
                                          vertical: 20.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            SizedBox(
                                              width: deviceWidth * 0.4,
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: <Widget>[
                                                      Text(
                                                        animal.name ?? " - ",
                                                        style: TextStyle(
                                                          fontSize: 26.0,
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      Icon(
                                                        animal.isFemale ?? false
                                                            ? FontAwesomeIcons
                                                                .venus
                                                            : FontAwesomeIcons
                                                                .mars,
                                                        color: Colors.grey,
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    animal.scientificName ??
                                                        " - ",
                                                    style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    '${animal.age} years old',
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        FontAwesomeIcons
                                                            .mapMarkerAlt,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                        size: 16.0,
                                                      ),
                                                      const SizedBox(
                                                        width: 6.0,
                                                      ),
                                                      Flexible(
                                                        child: Text(
                                                          '${animal.distanceToUser}',
                                                          style: TextStyle(
                                                            fontSize: 16.0,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color: animal.backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          height: 190.0,
                                          width: deviceWidth * 0.4,
                                        ),
                                        Hero(
                                          tag: animal.name ?? " - ",
                                          child: Image(
                                            image: AssetImage(
                                                animal.imageUrl ?? " - "),
                                            height: 220.0,
                                            fit: BoxFit.fitHeight,
                                            width: deviceWidth * 0.4,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
