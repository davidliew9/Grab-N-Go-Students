import 'dart:math';

import 'package:StudentApp/Models/LocationList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Shops_Screen/LocationCard.dart';
import 'package:geolocator/geolocator.dart';

class HorizontalList extends StatefulWidget {
  @override
  _HorizontalListState createState() => _HorizontalListState();
}

class _HorizontalListState extends State<HorizontalList> {
  Position current;

  List<Location> geoSort(List<Location> list) {
    getLocation();
    List<Location> ans = new List();
    list.sort(
      (a, b) => distanceTo(a, current).compareTo(distanceTo(b, current)),
    );
    return list;
  }

  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    current = position;
  }

  double distanceTo(Location geo, Position current) {
    double x = geo.location.latitude - current.latitude;
    double y = geo.location.longitude - current.longitude;
    return sqrt(x * x + y * y);
  }

  @override
  Widget build(BuildContext context) {
    List<Location> locations = Provider.of<List<Location>>(context);
    return locations == null
        ? CircularProgressIndicator()
        : Container(
            alignment: Alignment.center,
            height: 110.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              //wait for geotagging to link to locations
              children: geoSort(locations)
                  .map(
                    (e) => LocationCard(
                      imageLocation: e.imageURL,
                      locationName: e.name,
                      width: 160,
                      height: 80,
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
