// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Widget _buildFeaturedProduct(
      {required String name, required double price, required String image}) {
    return Card(
      child: Container(
        height: 250,
        width: 150,
        child: Column(
          children: <Widget>[
            Container(
              height: 140,
              width: 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/$image"),
                ),
              ),
            ),
            Text(
              "\$ $price",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            Text(
              name,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryProduct(String image) {
    return CircleAvatar(
      maxRadius: 40,
      backgroundColor: Color.fromARGB(255, 127, 169, 200),
      child: Container(
        height: 45,
        child: Image(
          color: Colors.black,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "Shop2Ez",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.send, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search...",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      /////////
                      Container(
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  "Featured",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "See All",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _buildFeaturedProduct(
                                image:
                                    "Razer-Barracuda-X-Wireless-Gaming-Headset-image-2.jpg",
                                price: 299.0,
                                name:
                                    "Razer Barracuda X Wireless Gaming Headset"),
                            _buildFeaturedProduct(
                                image: "Sony-WH-1000MX5-front-view.jpg",
                                price: 250.0,
                                name: "Sony WH 1000MX5")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 5,
                  child: Row(
                    children: <Widget>[],
                  ),
                ),
                Container(
                  height: 65,
                  child: Row(
                    children: <Widget>[
                      _buildCategoryProduct("Headphonee Icon.png"),
                      _buildCategoryProduct("Smartphonee Icon.png"),
                      _buildCategoryProduct("GamingConsolee Icon.png"),
                      _buildCategoryProduct("Laptop Icon.jpg"),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "New Items",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            _buildFeaturedProduct(
                                image: "Nintendo Switch.jpg",
                                price: 298.0,
                                name: "Nintendo Switch"),
                            _buildFeaturedProduct(
                                image: "games_gear_series-x.jpg",
                                price: 499.0,
                                name: "Xbox Series X")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
