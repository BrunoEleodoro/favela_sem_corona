import 'package:flutter/material.dart';
import 'package:favelasemcorona/constants.dart';

class DharmaButton extends StatelessWidget {
  DharmaButton({this.titleOfButton, @required this.onPressed});

  final String titleOfButton;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: onPressed,
        textColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: <Color>[
                Colors.red,
                Colors.redAccent,
                kDharma4,
                kDharma5,
              ],
            ),
          ),
          padding: EdgeInsets.all(15.0),
          child: Text(
            titleOfButton,
            style: TextStyle(fontSize: 15.0, fontFamily: '',),
          ),
        ));
  }
}
