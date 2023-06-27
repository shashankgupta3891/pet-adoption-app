// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/core/const/media_const.dart';
import 'package:photo_view/photo_view.dart';

import 'package:pet_adoption_app/domain/entities/pet.dart';
import 'package:pet_adoption_app/presentation/widgets/image_zoom_page.dart';

class DetailsScreenArgument {
  final Pet pet;

  DetailsScreenArgument(
    this.pet,
  );

  DetailsScreenArgument copyWith({
    Pet? pet,
  }) {
    return DetailsScreenArgument(
      pet ?? this.pet,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pet': pet.toMap(),
    };
  }

  factory DetailsScreenArgument.fromMap(Map<String, dynamic> map) {
    return DetailsScreenArgument(
      Pet.fromMap(map['pet'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory DetailsScreenArgument.fromJson(String source) =>
      DetailsScreenArgument.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DetailsScreenArgument(pet: $pet)';

  @override
  bool operator ==(covariant DetailsScreenArgument other) {
    if (identical(this, other)) return true;

    return other.pet == pet;
  }

  @override
  int get hashCode => pet.hashCode;
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final ConfettiController _confettiController =
      ConfettiController(duration: const Duration(seconds: 3));

  // DetailsScreenArgument? detailsScreenArgument;

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _showAdoptionPopup(Pet pet) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adoption Confirmation'),
          content: Text('You\'ve now adopted ${pet.name}'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments;
    if (arg is DetailsScreenArgument) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pet Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ImageZoomPage(
                        imageProvider: AssetImage(arg.pet.imageUrl),
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Hero(
                    tag: 'petImage',
                    child: PhotoView(
                      imageProvider: NetworkImage(arg.pet.imageUrl),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      arg.pet.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Age: ${arg.pet.age} years',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Price: \$${arg.pet.price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        _showAdoptionPopup(arg.pet);
                      },
                      child: const Text('Adopt Me'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Center(
      child: Lottie.asset(AnimationConst.noDataAnimation),
    );
  }
}
