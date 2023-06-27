import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PetType {
  cat(displayName: "Cats", iconData: FontAwesomeIcons.cat),
  dog(displayName: "Dogs", iconData: FontAwesomeIcons.dog),
  parrot(displayName: "Parrots", iconData: FontAwesomeIcons.crow),
  fish(displayName: "Fish", iconData: FontAwesomeIcons.fish);

  const PetType({required this.displayName, required this.iconData});

  final String displayName;
  final IconData iconData;
}
