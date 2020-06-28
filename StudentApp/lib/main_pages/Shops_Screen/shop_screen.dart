import 'package:StudentApp/main_pages/appBar.dart';

import 'dataSearch.dart';
import 'package:flutter/material.dart';
import 'locations.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  String foodOrLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topBar(
          context,
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 25,
              ),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kInputDecoration,
                onChanged: (value) {
                  setState(() {
                    foodOrLocation = value;
                  });
                },
              ),
            ),*/
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Locations'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.73,
              child: LocationsList(),
            )
          ],
        ),
      ),
    );
  }
}
