import 'package:flutter/material.dart';
import 'package:flutter_food_deleivery/data/data.dart';
import 'package:flutter_food_deleivery/widgets/recent_orders.dart';

class HomeScreen extends StatelessWidget {
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
              onPressed: () {},
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
                  borderSide: BorderSide(width: 0.8,color:Theme.of(context).primaryColor ),

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
          ),RecentOrders(),

        ],
      ),
    );
  }
}
