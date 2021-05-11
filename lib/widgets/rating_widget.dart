import 'package:flutter/cupertino.dart';
import 'package:flutter_food_deleivery/models/restaurant.dart';

class RatingWidget extends StatelessWidget {
  final Restaurant restaurant;

  RatingWidget(this.restaurant);

  @override
  Widget build(BuildContext context) {
    String rate = '';
    for (int i = 0; i < restaurant.rating; i++) {
      if (i > 5) {
        break;
      }
      rate += '⭐️ ';
    }
    rate.trim();
    return Text(rate,style: TextStyle(fontSize: 18.0),);
  }
}
