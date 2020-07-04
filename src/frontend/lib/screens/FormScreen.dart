import 'package:flutter/material.dart';
import 'FormScreen_2.dart';
import 'HeartFlexHeader.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _age;
  String _bloodPressure;
  String _bloodCholestrol;
  String _maxHeartRate;
  String _stressLevel;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future navigateToFormScreen_2(context) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormScreen_2(_age, _bloodPressure,
            _bloodCholestrol, _maxHeartRate, _stressLevel),
      ),
    );
  }

  Widget _buildAgeField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Age"),
      validator: (String value) {
        int temp_age = int.tryParse(value);
        if (temp_age == null || temp_age <= 0) {
          return "Age must be grater than 0 ";
        }
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _buildBloodPressureField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration:
          InputDecoration(labelText: "Resting Systolic Blood Pressure (in mm)"),
      validator: (String value) {
        int temp_bp = int.tryParse(value);
        if (temp_bp == null || temp_bp <= 50) {
          return "Systolic Blood Pressure must be greater than 50";
        }
      },
      onSaved: (String value) {
        _bloodPressure = value;
      },
    );
  }

  Widget _buildCholestrolField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Cholestrol level (in mg/dL)"),
      validator: (String value) {
        int temp_cl = int.tryParse(value);
        if (temp_cl == null || temp_cl <= 100) {
          return "Cholestrol Level must be greater than 100";
        }
      },
      onSaved: (String value) {
        _bloodCholestrol = value;
      },
    );
  }

  Widget _buildMaxHeartBeatField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: "Maximum Resting Heart Rate"),
      validator: (String value) {
        int temp_hb = int.tryParse(value);
        if (temp_hb == null || temp_hb <= 0) {
          return "Heat Rate must be greater than 0";
        }
      },
      onSaved: (String value) {
        _maxHeartRate = value;
      },
    );
  }

  Widget _buildStressField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Pls enter your stress level in range (0 - 5)"),
      validator: (String value) {
        int temp_sl = int.tryParse(value);
        if (temp_sl == null || temp_sl < 0) {
          return "Stress level must be greater than or equal to 0";
        } else if (temp_sl > 5) {
          return "Stress level must be less than 5";
        }
      },
      onSaved: (String value) {
        _stressLevel = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeartFlexScreen(),
            Container(
              padding: EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text(
                      "Welcome, please provide the",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "folowing information",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    _buildAgeField(),
                    SizedBox(height: 20),
                    _buildBloodPressureField(),
                    SizedBox(height: 20),
                    _buildCholestrolField(),
                    SizedBox(height: 20),
                    _buildMaxHeartBeatField(),
                    SizedBox(height: 20),
                    _buildStressField(),
                    SizedBox(height: 30),
                    RaisedButton(
                      child: Text(
                        "Next",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      onPressed: () async {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        print(_age);
                        navigateToFormScreen_2(context);
                      },
                      color: Colors.blue,
                      elevation: 10.0,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
