import 'package:flutter/material.dart';
import 'package:golek_kos/models/space.dart';
import 'package:golek_kos/pages/error_page.dart';
import 'package:golek_kos/widgets/facility_item.dart';
import 'package:golek_kos/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  DetailPage(this.space);

  Widget build(BuildContext context) {
    //function for plugin url_launcher
    //Flutter has to inject plugin dependencies into the platform-specific parts of your app
    //hot restart/hot reload is not enough to trigger the injection, then close & re run the app
    @override
    launchURL(String url) async => await canLaunch(url)
        ? await launch(url)
        // : throw 'could not launch $url';
        : Navigator.push(
            context, MaterialPageRoute(builder: (context) => ErrorPage()));

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl,
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                SizedBox(
                  height: 328,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: whiteColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: TITLE
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: edge,
                        ),
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
                                SizedBox(
                                  height: 2,
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: '\$${space.price}',
                                    style: purpleTextStyle.copyWith(
                                      fontSize: 16,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map(
                                (index) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 2),
                                    child: RatingItem(
                                      index: index,
                                      rating: space.rating,
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: MAIN FACILITIES
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Main Facilities',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              imageUrl: 'assets/icon_kitchen.png',
                              number: space.numberOfKitchens,
                              facilty: 'kitchen',
                            ),
                            FacilityItem(
                              imageUrl: 'assets/icon_bedroom.png',
                              number: space.numberOfBedrooms,
                              facilty: 'bedroom',
                            ),
                            FacilityItem(
                              imageUrl: 'assets/icon_cupboard.png',
                              number: space.numberOfCupboards,
                              facilty: 'Big Lemari',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: PHOTOS
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Photos',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 88,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos.map(
                            (item) {
                              return Container(
                                margin: EdgeInsets.only(left: 24),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    item,
                                    height: 88,
                                    width: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //NOTE: LOCATION
                      Padding(
                        padding: EdgeInsets.only(left: edge),
                        child: Text(
                          'Location',
                          style: regulerTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${space.address}\n${space.city}',
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                launchURL(space.mapUrl);
                                //launchURL('asdfawdf');
                              },
                              child: Image.asset(
                                'assets/btn_map.png',
                                width: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () {
                            launchURL('tel:+${space.phone}');
                          },
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: purpleColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    'assets/btn_wishlist.png',
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
