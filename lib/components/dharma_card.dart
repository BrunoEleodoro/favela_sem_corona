import 'package:flutter/material.dart';
import 'package:favelasemcorona/constants.dart';

class DharmaCard extends StatelessWidget {
  DharmaCard({this.titleOfButton, @required this.onPressed});

  final String titleOfButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        textColor: Colors.white,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                kDharma4,
                kDharma5,
                Colors.yellow,
              ],
            ),
          ),
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Text(
              titleOfButton,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ));
  }
}