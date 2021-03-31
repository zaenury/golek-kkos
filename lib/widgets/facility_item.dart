import 'package:flutter/material.dart';

import '../theme.dart';

class FacilityItem extends StatelessWidget {
  final String imageUrl;
  final int number;
  final String facilty;

  FacilityItem({this.imageUrl, this.number, this.facilty});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: '$number',
            style: purpleTextStyle.copyWith(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: ' $facilty',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
