import 'dart:ffi';

import 'package:cozy_v2/models/space.dart';
import 'package:cozy_v2/theme.dart';
import 'package:cozy_v2/widgets/facility_item.dart';
import 'package:cozy_v2/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    Uri _url = Uri.parse('https://flutter.dev');

    Future<void> showConfirmation() async {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Konfirmasi'),
              content: const Text('Apakah kamu ingin menelephone pemilik kos'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  child: const Text('Yaa'),
                  onPressed: () {
                    Navigator.pop(context, 'Yaa');
                    launchUrlString('tel:${space.phone}');
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 340,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      // TODO : Title
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  space.name,
                                  style: blackTextStyle.copyWith(fontSize: 22),
                                ),
                                SizedBox(height: 2),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style:
                                        purpleTextStyle.copyWith(fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: '/month',
                                          style: greyTextStyle.copyWith(
                                              fontSize: 16))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                                children: [1, 2, 3, 4, 5].map((index) {
                              return Container(
                                child: RatingItem(
                                    index: index, rating: space.rating),
                              );
                            }).toList())
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 3),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItems(
                              Name: 'Kitchen',
                              imageUrl: 'assets/facility/dapur.png',
                              jumfac: space.number_of_kitchens,
                            ),
                            FacilityItems(
                              Name: 'Bedroom',
                              imageUrl: 'assets/facility/kasur.png',
                              jumfac: space.number_of_bedrooms,
                            ),
                            FacilityItems(
                              Name: 'Big Lemari',
                              imageUrl: 'assets/facility/lemari.png',
                              jumfac: space.number_of_cupboards,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      // TODO : Photos
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: space.photos.map((item) {
                              return Container(
                                margin: EdgeInsets.only(left: edge),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(17),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList()
                            //  [
                            //   SizedBox(width: edge),
                            //   Image.asset(
                            //     'assets/images/photo1.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: 18),
                            //   Image.asset(
                            //     'assets/images/photo2.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: 18),
                            //   Image.asset(
                            //     'assets/images/photo3.png',
                            //     width: 110,
                            //     height: 88,
                            //     fit: BoxFit.cover,
                            //   ),
                            //   SizedBox(width: edge),
                            // ],
                            ),
                      ),
                      SizedBox(height: 20),
                      // TODO : LOKASI
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: blackTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                      SizedBox(height: 6),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.city}\n${space.country}',
                              style: greyTextStyle,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrlString(
                                    'https://goo.gl/maps/r9TdTtD8nbRTHrrGA');
                              },
                              child: Image.asset(
                                'assets/icons/lokasi.png',
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: edge),
                        width: MediaQuery.of(context).size.width - (2 * edge),
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            showConfirmation();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          child: Text(
                            'BOOK NOW',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/icons/btn_back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/btn_wishlist.png',
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
