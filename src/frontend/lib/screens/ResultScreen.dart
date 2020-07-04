import 'package:flutter/material.dart';
import 'FormScreen.dart';
import 'HeartFlexHeader.dart';

class ResultScreen extends StatelessWidget {
  String result;

  ResultScreen(this.result);

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
    int temp_result = int.tryParse(result);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeartFlexScreen(),
          SizedBox(height: 30),
          Text(
            "Your chance of having a heart attack ",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            " is about:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          (temp_result >= 50)
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      result + '%',
                      style: TextStyle(color: Colors.red, fontSize: 90),
                    ),
                    Text(
                      "You are in high risk zone and must visit a doctor",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      result + '%',
                      style: TextStyle(color: Colors.green, fontSize: 90),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: EdgeInsets.all(20.0),
                        child: (temp_result >= 30)
                            ? Column(
                                children: <Widget>[
                                  Text(
                                    "You are in moderate risk zone and must",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    " visit a doctor if situation worsen even a bit",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  Text(
                                    "You are in low risk zone and don't need to",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    " visit a doctor",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ))
                  ],
                ),
          SizedBox(height: 30),
          RaisedButton(
            child: Text(
              "ReTake the Test",
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
    );
  }
}
