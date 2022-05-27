import 'package:cozy_v2/theme.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final String imageUrl;
  final bool isactive;

  BottomNavBar({required this.imageUrl, required this.isactive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Image.asset(
          imageUrl,
          width: 26,
        ),
        Spacer(),
        isactive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(1000),
                    )),
              )
            : Container(),
      ],
    );
  }
}
