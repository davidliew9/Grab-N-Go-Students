import 'package:StudentApp/subpages/stall_page.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  final String imageLocation;
  final String locationName;
  final double width;
  final double height;

  Location({this.imageLocation, this.locationName, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => new StallPage(),
          ),
        ),
        child: Container(
          width: width,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: width,
              height: height,
            ),
            subtitle: Container(
              child: Text(locationName),
              alignment: Alignment.topCenter,
            ),
          ),
        ),
      ),
    );
  }
}
