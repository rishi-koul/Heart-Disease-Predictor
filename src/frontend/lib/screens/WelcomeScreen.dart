import 'package:flutter/material.dart';
import 'FormScreen.dart';
import 'HeartFlexHeader.dart';

class WelcomeScreen extends StatelessWidget {
  Future navigateToFormScreen(context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          HeartFlexScreen(),
          SizedBox(height: 30),
          Container(
            height: MediaQuery.of(context).size.height / 3 - 30,
            child: Column(
              children: <Widget>[
                Text(
                  "Lets get started to get your",
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                ),
                Text(
                  "personalized health results",
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: (MediaQuery.of(context).size.height / 3 - 65) / 2),
                RaisedButton(
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  onPressed: () async {
                    navigateToFormScreen(context);
                  },
                  color: Colors.blue,
                  elevation: 10.0,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: Image.asset(
              'assets/images/image.png',
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
            ),
          )
        ],
      ),
    );
  }
}
