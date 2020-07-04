import 'dart:convert';
import 'ResultScreen.dart';
import 'package:flutter/material.dart';
import '../api/API.dart';
import 'HeartFlexHeader.dart';

class FormScreen_2 extends StatefulWidget {
  String _age;
  String _bloodPressure;
  String _bloodCholestrol;
  String _maxHeartRate;
  String _stressLevel;

  FormScreen_2(this._age, this._bloodPressure, this._bloodCholestrol,
      this._maxHeartRate, this._stressLevel);

  @override
  FormScreen_2State createState() => FormScreen_2State();
}

class FormScreen_2State extends State<FormScreen_2> {
  String _sex;
  String _cp;
  String _bloodSugar;
  String _restingcg = '1';
  String _angina;
  String _thal = '1';
  String _slope = '1';
  String _ca = '1';

  String url;
  String QueryText;

  Future navigateToResultScreen(context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ResultScreen(QueryText)));
  }

  DropdownButton _buildSexField() => DropdownButton<String>(
        items: [
          DropdownMenuItem(
            value: "1",
            child: Text(
              "Male",
            ),
          ),
          DropdownMenuItem(
            value: "0",
            child: Text(
              "Female",
            ),
          ),
        ],
        hint: Text("Please select your gender"),
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            _sex = value;
          });
        },
        value: _sex,
      );

  DropdownButton _buildCPField() => DropdownButton<String>(
        items: [
          DropdownMenuItem(
            value: "0",
            child: Text(
              "0 - Never Experienced",
            ),
          ),
          DropdownMenuItem(
            value: "1",
            child: Text(
              "1 - Expienced few times",
            ),
          ),
          DropdownMenuItem(
            value: "2",
            child: Text(
              "2 - Experined small pains sometimes",
            ),
          ),
          DropdownMenuItem(
            value: "3",
            child: Text(
              "3 - Experined strong pains somtimes",
            ),
          ),
          DropdownMenuItem(
            value: "4",
            child: Text(
              "4 - Experined strong pains frequently",
            ),
          ),
        ],
        hint: Text("Please rate your chest pain level (0-4)"),
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            _cp = value;
          });
        },
        value: _cp,
      );

  DropdownButton _buildBloodSugarField() => DropdownButton<String>(
        items: [
          DropdownMenuItem(
            value: "1",
            child: Text(
              "Yes",
            ),
          ),
          DropdownMenuItem(
            value: "0",
            child: Text(
              "No",
            ),
          ),
        ],
        hint: Text("Fasting Blood Sugar level ever exceeded 120"),
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            _bloodSugar = value;
          });
        },
        value: _bloodSugar,
      );

  DropdownButton _buildAnginaField() => DropdownButton<String>(
        items: [
          DropdownMenuItem(
            value: "1",
            child: Text(
              "Yes",
            ),
          ),
          DropdownMenuItem(
            value: "0",
            child: Text(
              "No",
            ),
          ),
        ],
        hint: Text(
          "Suffered Severe Chest Pain when Exercising",
        ),
        isExpanded: true,
        onChanged: (value) {
          setState(() {
            _angina = value;
          });
        },
        value: _angina,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeartFlexScreen(),
            Container(
              margin: EdgeInsets.all(24),
              child: Column(
                children: <Widget>[
                  Text(
                    "Please select the most suitable",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "option",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  _buildSexField(),
                  SizedBox(height: 20),
                  _buildCPField(),
                  SizedBox(height: 20),
                  _buildBloodSugarField(),
                  SizedBox(height: 20),
                  _buildAnginaField(),
                  SizedBox(height: 30),
                  RaisedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () async {
                      url = 'http://10.0.2.2:5000/api?Query=' +
                          widget._age +
                          ',' +
                          _sex +
                          ',' +
                          _cp +
                          ',' +
                          widget._bloodPressure +
                          ',' +
                          widget._bloodCholestrol +
                          ',' +
                          _bloodSugar +
                          ',' +
                          _restingcg +
                          ',' +
                          widget._maxHeartRate +
                          ',' +
                          _angina +
                          ',' +
                          widget._stressLevel +
                          ',' +
                          _slope +
                          ',' +
                          _ca +
                          ',' +
                          _thal;

                      String Data = await GetData(url);
                      var DecodedData = jsonDecode(Data);
                      QueryText = DecodedData['Query'].toString();
                      navigateToResultScreen(context);
                    },
                    color: Colors.blue,
                    elevation: 10.0,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
