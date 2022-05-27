import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({required this.index, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        index <= rating ? 'assets/start.png' : 'assets/grey_start.png',
        width: 20);
  }
}
