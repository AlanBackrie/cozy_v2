import 'package:flutter/material.dart';
import 'package:cozy_v2/widgets/space_card.dart';

class Space {
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String country;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List photo;
  int numberOfKitchen;
  int numberOfbedrom;
  int numberOfCupboards;

  Space(
      {required this.country,
      required this.city,
      required this.id,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.rating,
      required this.photo,
      required this.address,
      required this.mapUrl,
      required this.numberOfKitchen,
      required this.numberOfbedrom,
      required this.numberOfCupboards,
      required this.phone});

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        country: json['country'],
        city: json['city'],
        id: json['id'],
        imageUrl: json['imageUrl'],
        name: json['name'],
        price: json['price'],
        rating: json['rating'],
        photo: json['photo'],
        address: json['address'],
        mapUrl: json['mapUrl'],
        numberOfKitchen: json['numberOfKitchen'],
        numberOfbedrom: json['numberOfbedrom'],
        numberOfCupboards: json['numberOfCupboards'],
        phone: json['phone'],
      );
}
