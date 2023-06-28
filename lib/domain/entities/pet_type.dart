import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_adoption_app/core/const/media_const.dart';

enum PetType {
  cat(
    displayName: "Cats",
    iconData: FontAwesomeIcons.cat,
    imageUrl: ImageConst.transparentCat,
  ),
  dog(
    displayName: "Dogs",
    iconData: FontAwesomeIcons.dog,
    imageUrl: ImageConst.transparentDog,
  ),
  parrot(
    displayName: "Parrots",
    iconData: FontAwesomeIcons.crow,
    imageUrl: ImageConst.transparentParrot,
  ),
  fish(
    displayName: "Fish",
    iconData: FontAwesomeIcons.fish,
    imageUrl: ImageConst.transparentFish,
  );

  const PetType({
    required this.displayName,
    required this.iconData,
    required this.imageUrl,
  });

  final String displayName;
  final IconData iconData;
  final String imageUrl;
}
