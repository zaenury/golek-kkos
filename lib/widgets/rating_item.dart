import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;
  RatingItem(
      {this.index,
      this.rating}); // for using to other class, add {} on consturctor

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating ? 'assets/icon_star.png' : "assets/icon_star_grey.png",
      width: 20,
    );
  }
}
