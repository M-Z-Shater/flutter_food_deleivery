import 'package:flutter/material.dart';
import 'package:flutter_food_deleivery/data/data.dart';
import 'package:flutter_food_deleivery/screens/cart_screen.dart';
import 'package:flutter_food_deleivery/screens/restaurant_screen.dart';
import 'package:flutter_food_deleivery/widgets/rating_widget.dart';
import 'package:flutter_food_deleivery/widgets/recent_orders.dart';

class HomeScreen extends StatelessWidget {
  _buildRestaurants(BuildContext context) {
    List<Widget> restaurantsList = [];
    restaurants.forEach((rest) {
      restaurantsList.add(GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => RestaurantScreen(rest)));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1.0, color: Colors.grey[200])),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: rest.imageUrl,
                  child: Image(
                    image: AssetImage(rest.imageUrl),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        rest.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingWidget(rest),
                      SizedBox(height: 4),
                      Text(
                        rest.address,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        '1.2 miles from you',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return Column(
      children: restaurantsList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
          ),
          iconSize: 30,
          onPressed: () {},
        ),
        actions: [
          FlatButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CartScreen())),
              child: Text(
                'Cart(${currentUser.cart.length})',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                      width: 0.8, color: Theme.of(context).primaryColor),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(width: 0.8)),
                hintText: "Search a food or restaurant",
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {},
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Nearby restaurants',
                  style: TextStyle(
                      fontSize: 24,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600),
                ),
              ),
              _buildRestaurants(context),
            ],
          )
        ],
      ),
    );
  }
}
