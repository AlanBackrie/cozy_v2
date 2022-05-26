import 'package:flutter/material.dart';

import '../models/theme.dart';

class FacilityItems extends StatelessWidget {
  String imageUrl;
  String Name;
  int jumfac;

  FacilityItems(
      {required this.Name, required this.imageUrl, required this.jumfac});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        Text.rich(
          TextSpan(
            text: '${jumfac}',
            style: purpleTextStyle.copyWith(fontSize: 14),
            children: [
              TextSpan(text: Name, style: greyTextStyle.copyWith(fontSize: 14))
            ],
          ),
        ),
      ],
    ));
  }
}
