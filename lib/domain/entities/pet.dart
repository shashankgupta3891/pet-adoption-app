// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Pet {
  final String id;
  final String name;
  final String breed;
  final int age;
  final String imageUrl;
  final double price;
  bool isAdopted;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.imageUrl,
    required this.price,
    required this.isAdopted,
  });

  Pet copyWith({
    String? id,
    String? name,
    String? breed,
    int? age,
    String? imageUrl,
    double? price,
    bool? isAdopted,
  }) {
    return Pet(
      id: id ?? this.id,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isAdopted: isAdopted ?? this.isAdopted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'breed': breed,
      'age': age,
      'imageUrl': imageUrl,
      'price': price,
      'isAdopted': isAdopted,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id'] as String,
      name: map['name'] as String,
      breed: map['breed'] as String,
      age: map['age'] as int,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      isAdopted: map['isAdopted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) =>
      Pet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Pet(id: $id, name: $name, breed: $breed, age: $age, imageUrl: $imageUrl, price: $price, isAdopted: $isAdopted)';
  }

  @override
  bool operator ==(covariant Pet other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.breed == breed &&
        other.age == age &&
        other.imageUrl == imageUrl &&
        other.price == price &&
        other.isAdopted == isAdopted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        breed.hashCode ^
        age.hashCode ^
        imageUrl.hashCode ^
        price.hashCode ^
        isAdopted.hashCode;
  }
}
