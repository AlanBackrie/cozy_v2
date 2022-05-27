import 'package:cozy_v2/theme.dart';
import 'package:cozy_v2/models/tips.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final Tips tip;

  TipsCard(this.tip);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tip.imageUrl,
          width: 80,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tip.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(tip.update)
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_right_sharp,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}
