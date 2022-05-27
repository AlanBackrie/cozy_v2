import 'package:cozy_v2/models/space.dart';
import 'package:cozy_v2/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:cozy_v2/theme.dart';

class SpaceCard extends StatelessWidget {
  final Space space;

  const SpaceCard(this.space, {Key? key}) : super(key: key);

  get purpleColor => null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (content) => DetailPage(space)));
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
                  Image.network(
                    space.imageUrl,
                    height: 110,
                    width: 130,
                    fit: BoxFit.cover,
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
                              'assets/start.png',
                              height: 22,
                              width: 22,
                              fit: BoxFit.cover,
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
                "${space.city}, ${space.country} ",
                style: greyTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}
