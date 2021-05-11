import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_deleivery/models/food.dart';
import 'package:flutter_food_deleivery/models/restaurant.dart';
import 'package:flutter_food_deleivery/widgets/rating_widget.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant _restaurant;

  RestaurantScreen(this._restaurant);

  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  _buildMenuItem(Food menuItem) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 175,
            height: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(menuItem.imageUrl),
              ),
            ),
          ),
          Container(
            width: 175,
            height: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black87.withOpacity(0.3),
                    Colors.black54.withOpacity(0.3),
                    Colors.black38.withOpacity(0.3),
                  ]),
            ),
          ),
          Positioned(
            bottom: 65,
            child: Column(
              children: [
                Text(
                  menuItem.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold),
                ),
                Text('\$${menuItem.price}',
                    style: TextStyle(color: Colors.white, fontSize: 18))
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                iconSize: 20,
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: widget._restaurant.imageUrl,
                child: Image(
                  image: AssetImage(widget._restaurant.imageUrl),
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        iconSize: 30,
                        color: Colors.white54,
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    IconButton(
                        iconSize: 35,
                        color: Theme.of(context).primaryColor,
                        icon: Icon(Icons.favorite),
                        onPressed: () {}),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget._restaurant.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text('1.2 miles away',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                RatingWidget(widget._restaurant),
                SizedBox(
                  height: 6,
                ),
                Text(widget._restaurant.address,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Text(
                    'Review',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
              FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {},
                  child: Text(
                    'Contact',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )),
            ],
          ),
/*          Center(
            child: Text(
              'Menu',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),*/
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List.generate(widget._restaurant.menu.length, (index) {
                Food food = widget._restaurant.menu[index];

                return Padding(
                  padding: EdgeInsets.all(10),
                  child: _buildMenuItem(food),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
