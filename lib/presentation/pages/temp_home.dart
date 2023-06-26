import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption_app/core/const/const.dart';
import 'package:pet_adoption_app/core/const/image_const.dart';

// import 'package:pet_shop_app_01/models/cats_model.dart';
// import 'package:pet_shop_app_01/pages/detail.dart';

class TempHomePage extends StatefulWidget {
  const TempHomePage({Key? key}) : super(key: key);

  @override
  State<TempHomePage> createState() => _TempHomePageState();
}

class _TempHomePageState extends State<TempHomePage> {
  List<String> categories = ['Cats', 'Dogs', 'Birds', 'Fishs'];
  String category = 'Cats';
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat_outlined,
    Icons.person_outline_rounded
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Location',
                            style: poppins.copyWith(
                                fontSize: 14, color: black.withOpacity(0.6)),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: blue,
                            size: 18,
                          )
                        ],
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'Pekanbaru, ',
                            style: poppins.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: black)),
                        TextSpan(
                            text: 'Riau',
                            style:
                                poppins.copyWith(fontSize: 24, color: black)),
                      ])),
                    ],
                  ),
                ),
                const Icon(Icons.search),
                const SizedBox(width: 10),
                Stack(
                  children: [
                    const Icon(Icons.notifications_outlined),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: red),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: blue.withOpacity(0.6),
                child: Stack(children: [
                  Positioned(
                    bottom: -35,
                    right: -30,
                    width: 150,
                    height: 150,
                    child: Transform.rotate(
                      angle: 12,
                      child: SvgPicture.asset(
                        ImageConst.pawPrint,
                        color: blue,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -35,
                    left: -35,
                    width: 150,
                    height: 150,
                    child: Transform.rotate(
                      angle: -12,
                      child: SvgPicture.asset(
                        ImageConst.pawPrint,
                        color: blue,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -40,
                    left: 120,
                    width: 150,
                    height: 150,
                    child: Transform.rotate(
                      angle: -16,
                      child: SvgPicture.asset(
                        ImageConst.pawPrint,
                        color: blue,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 20,
                      height: 135,
                      child: Image.asset('assets/cats/cat1.png')),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join Our Animal\nLovers Community',
                          style: poppins.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: white),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: orange),
                          child: Text(
                            'Join Us',
                            style: poppins.copyWith(color: white, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Categories',
                  style: poppins.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold, color: black),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'View All',
                      style: poppins.copyWith(fontSize: 12, color: orange),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: orange),
                        child: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 14,
                          color: white,
                        ))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              const SizedBox(width: 20),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: const BoxDecoration(color: white),
                  child: const Icon(
                    Icons.tune_rounded,
                  )),
              ...List.generate(
                categories.length,
                (index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 20, right: 20)
                      : const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        category = categories[index];
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: categories[index] == category ? blue : white,
                            boxShadow: [
                              categories[index] == category
                                  ? const BoxShadow(
                                      offset: Offset(0, 5),
                                      color: blue,
                                      spreadRadius: 0,
                                      blurRadius: 5)
                                  : const BoxShadow(color: white),
                            ]),
                        child: Text(
                          categories[index],
                          style: poppins.copyWith(
                              color:
                                  categories[index] == category ? white : black,
                              fontSize: 14),
                        )),
                  ),
                ),
              )
            ]),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Adopt Pet',
                  style: poppins.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold, color: black),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'View All',
                      style: poppins.copyWith(fontSize: 12, color: orange),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: orange),
                        child: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          size: 14,
                          color: white,
                        ))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                cats.length,
                (index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 20, right: 20)
                      : const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             DetailPage(cat: cats[index])));
                      },
                      child: CatItem(cat: cats[index])),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              icons.length,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedPage = index;
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 50,
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 50,
                            child: Column(
                              children: [
                                Icon(
                                  icons[index],
                                  color: selectedPage == index
                                      ? blue
                                      : black.withOpacity(0.6),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                selectedPage == index
                                    ? Container(
                                        height: 5,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: blue),
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                          index == 2
                              ? Positioned(
                                  right: 0,
                                  top: -5,
                                  child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle, color: blue),
                                      child: Text(
                                        '6',
                                        style: poppins.copyWith(color: white),
                                      )),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}

class CatItem extends StatelessWidget {
  final Cat cat;
  const CatItem({
    Key? key,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.6,
        color: cat.color.withOpacity(0.6),
        child: Stack(
          children: [
            Positioned(
              bottom: -10,
              right: -10,
              height: 100,
              width: 100,
              child: Transform.rotate(
                  angle: 12,
                  child: SvgPicture.asset(
                    ImageConst.pawPrint,
                    color: cat.color,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              top: 100,
              left: -25,
              height: 100,
              width: 100,
              child: Transform.rotate(
                  angle: -11.5,
                  child: SvgPicture.asset(
                    ImageConst.pawPrint,
                    color: cat.color,
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              bottom: -10,
              right: -80,
              left: 20,
              child: Image.asset(
                cat.image,
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cat.name,
                          style: poppins.copyWith(
                              fontSize: 16,
                              color: black,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              color: blue,
                              size: 16,
                            ),
                            Text(
                              'Distance (${cat.distance} Km)',
                              style: poppins.copyWith(
                                fontSize: 12,
                                color: black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: white),
                    child: Icon(
                      cat.fav
                          ? Icons.favorite_rounded
                          : Icons.favorite_outline_rounded,
                      color: cat.fav ? red : black.withOpacity(0.6),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Cat {
  final Color color;
  final String name, location, sex, image, description;
  final double age, weight;
  final int distance;
  final bool fav;
  final Owner owner;

  Cat({
    required this.fav,
    required this.image,
    required this.color,
    required this.description,
    required this.name,
    required this.location,
    required this.sex,
    required this.age,
    required this.weight,
    required this.distance,
    required this.owner,
  });
}

List<Cat> cats = [
  Cat(
      fav: true,
      color: orange,
      name: 'Leo',
      description: desc,
      location: 'Dumai, Riau',
      sex: 'Male',
      age: 2.1,
      weight: 4.5,
      image: 'assets/cats/cat1.png',
      distance: 7,
      owner: owners[0]),
  Cat(
      fav: false,
      color: green,
      name: 'Lily',
      description: desc,
      location: 'Siak, Riau',
      sex: 'Female',
      age: 1.2,
      image: 'assets/cats/cat2.png',
      weight: 2.6,
      distance: 5,
      owner: owners[1]),
  Cat(
      fav: true,
      color: blue,
      name: 'Cleo',
      image: 'assets/cats/cat3.png',
      description: desc,
      location: 'Pekanbaru, Riau',
      sex: 'Male',
      age: 1.4,
      weight: 3.4,
      distance: 7,
      owner: owners[2]),
  Cat(
      fav: true,
      color: red,
      image: 'assets/cats/cat4.png',
      name: 'Milo',
      description: desc,
      location: 'Kampar, Riau',
      sex: 'Female',
      age: 1.1,
      weight: 3.2,
      distance: 11,
      owner: owners[0]),
];
String desc =
    'This cat is a domestic species of small carnivorous mammal. It is the only domesticated species in the family Felidae and is often reffered to as the domestic cat to distinguish it from the wild members of the family. A cat can either be a house cat, a farm cat or a feral cat, the latter rangers freely and avoids human contacts. Domestic cats are valued by humans for companionship and their ability to kill redonts. About 60 cat breeds are recognized by various cat registries.';
// 'Leo is a cat that i have found on the side of the road 1 year ago he is now a cheerful and active cat';

class Owner {
  final String name, image;

  Owner({required this.name, required this.image});
}

List<Owner> owners = [
  Owner(name: 'Sophia', image: 'assets/owners/woman-with-cat1.png'),
  Owner(name: 'Annie', image: 'assets/owners/woman-with-cat2.png'),
  Owner(name: 'Jessica', image: 'assets/owners/woman-with-cat3.png'),
];
