import 'package:flutter/material.dart';

class HeartFlexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 0, left: 0),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(1000),
            bottomRight: Radius.circular(1000),
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50)),
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: (MediaQuery.of(context).size.width / 10),
                top: MediaQuery.of(context).size.height / 9),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/images/logo.png',
                  width: 90,
                  height: 70,
                ),
                Text(
                  "Heart",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                Text(
                  "Flex",
                  style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
