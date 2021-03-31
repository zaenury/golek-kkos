import 'package:flutter/material.dart';
import 'package:golek_kos/models/city.dart';
import 'package:golek_kos/models/space.dart';
import 'package:golek_kos/models/tips.dart';
import 'package:golek_kos/theme.dart';
import 'package:golek_kos/widgets/bottom_navbar_item.dart';
import 'package:golek_kos/widgets/city_card.dart';
import 'package:golek_kos/widgets/space_card.dart';
import 'package:golek_kos/widgets/tips_card.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            //NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text('Explore Now',
                  style: blackTextStyle.copyWith(fontSize: 24)),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regulerTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                  CityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/city2.png',
                      isPopular: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/city3.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            //NOTE: RECOMENDED SPACE
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recomended Space',
                style: regulerTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  SpaceCard(Space(
                    id: 1,
                    name: 'Kuretakeso Hott',
                    price: 52,
                    imageUrl: 'assets/space1.png',
                    city: 'Bandung',
                    country: 'Germany',
                    rating: 4,
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(Space(
                    id: 2,
                    name: 'Roemah Nenek',
                    price: 11,
                    imageUrl: 'assets/space2.png',
                    city: 'Seattle',
                    country: 'Bogor',
                    rating: 5,
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  SpaceCard(Space(
                    id: 3,
                    name: 'Darrling How',
                    price: 20,
                    imageUrl: 'assets/space2.png',
                    city: 'Jakarta',
                    country: 'Indonesia',
                    rating: 3,
                  )),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTES: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips Guidance',
                style: regulerTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                        id: 1,
                        title: 'City Guidelines',
                        updatedAt: '20 April',
                        imageUrl: 'assets/tips1.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                        id: 2,
                        title: 'Jakarta Fairship',
                        updatedAt: '11 December',
                        imageUrl: 'assets/tips2.png'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50 + (edge * 2),
            ),
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
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
