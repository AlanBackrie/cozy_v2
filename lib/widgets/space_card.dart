import 'package:cozy_v2/models/space.dart';
import 'package:cozy_v2/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cozy_v2/models/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  SpaceCard(this.space);

  get purpleColor => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (content) => DetailPage()));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  Image.asset(
                    space.imageUrl,
                  ),
                  SizedBox(width: 16),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Color(0xFF3F2D81),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/start.png",
                              height: 22,
                              width: 22,
                            ),
                            Text(
                              "${space.rating}/5",
                              style: whiteTextStyle.copyWith(fontSize: 13),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name,
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              Text.rich(
                TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                        text: '/month',
                        style: greyTextStyle.copyWith(fontSize: 16))
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                "${space.city}, ${space.Country} ",
                style: greyTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}