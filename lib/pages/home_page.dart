import 'package:flutter/material.dart';
import 'package:golek_kos/models/city.dart';
import 'package:golek_kos/models/space.dart';
import 'package:golek_kos/theme.dart';
import 'package:golek_kos/widgets/city_card.dart';
import 'package:golek_kos/widgets/space_card.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: edge),
          child: ListView(
            children: [
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
              Column(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
