import 'package:cozy_v2/widgets/space_card.dart';

class Space {
  int id;
  String name;
  String imageUrl;
  int price;
  String city;
  String Country;
  int rating;
  // String address;
  // String phone;
  // String mapUrl;
  // List Photo;
  // int numberOfKitchen;
  // int numberOfbedrom;
  // int numberOfCupboards;

  Space({
    required this.Country,
    required this.city,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.rating,
    // required this.Photo,
    // required this.address,
    // required this.mapUrl,
    // required this.numberOfKitchen,
    // required this.numberOfbedrom,
    // required this.numberOfCupboards,
    // required this.phone
  });

  // Space.fromJson(json) {
  //   id = json['id'];
  //   name = json['name'];
  //   city = json['city'];
  //   Country = json['country'];
  //   imageUrl = json['imageUrl'];
  //   price = json['price'];
  //   rating = json['rating'];
  //   address = json['address'];
  //   phone = json['phone'];
  //   mapUrl = json['mapUrl'];
  //   numberOfKitchen = json['numberOfKitchen'];
  //   numberOfbedrom = json['numberOfbedrom'];
  //   numberOfCupboards = json['numberOfCupboards'];
  // }
}
