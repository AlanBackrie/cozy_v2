import 'package:cozy_v2/models/city.dart';
import 'package:cozy_v2/models/space.dart';
import 'package:cozy_v2/theme.dart';
import 'package:cozy_v2/models/tips.dart';
import 'package:cozy_v2/provider/space_provider.dart';
import 'package:cozy_v2/widgets/bottom_navbar.dart';
import 'package:cozy_v2/widgets/city_card.dart';
import 'package:cozy_v2/widgets/space_card.dart';
import 'package:cozy_v2/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: edge),
            // TODO: Header
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Explore Now",
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Mencari kosan yang cozy",
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),
            // TODO : POPULER Cities
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Popular Cities",
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/jakarta.png',
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/images/bandung.png',
                        ispopuler: true),
                  ),
                  SizedBox(width: 20),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/surabaya.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // TODO: Recomended Space
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Recomended Space",
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder<List<Space>>(
                future: spaceProvider.getRecomendedSpace(),
                builder: ((context, snapshot) {
                  // if (snapshot.hasData) {
                  //   List<Space> data = snapshot.data!;
                  //   return Column(
                  //     children: data.map((item) => SpaceCard(item)).toList(),
                  //   );
                  // }
                  // return Center(
                  //   child: CircularProgressIndicator(),
                  // );
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data!;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return Text('tidak ada data');
                }),
              ),
            ),
            SizedBox(height: 30),
            // NOTE : Tips & Guidance
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                "Tips & Guidance",
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                        id: 1,
                        imageUrl: 'assets/Group1.png',
                        name: 'City Guidelines',
                        update: 'Updated 20 Apr'),
                  ),
                  SizedBox(height: 20),
                  TipsCard(
                    Tips(
                        id: 1,
                        imageUrl: 'assets/Group2.png',
                        name: 'Jakarta Fairship',
                        update: 'Updated 11 Dec'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60 + edge),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBar(imageUrl: 'assets/icons/home.png', isactive: true),
            BottomNavBar(imageUrl: 'assets/icons/email.png', isactive: true),
            BottomNavBar(imageUrl: 'assets/icons/card.png', isactive: true),
            BottomNavBar(imageUrl: 'assets/icons/love.png', isactive: true),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
