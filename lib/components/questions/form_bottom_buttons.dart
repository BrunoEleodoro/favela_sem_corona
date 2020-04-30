import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  var backClicked;
  var nextClicked;
  var backButtonVisible;
  var nextButtonVisible;
  BottomButtons(
      {this.backClicked,
      this.nextClicked,
      this.backButtonVisible = true,
      this.nextButtonVisible = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Opacity(
            opacity: backButtonVisible ? 1 : 0,
            child: MaterialButton(
              onPressed: backClicked,
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_back),
                  SizedBox(
                    width: 10,
                  ),
                  Text('VOLTAR')
                ],
              ),
            ),
          ),
          Opacity(
            opacity: nextButtonVisible ? 1 : 0,
            child: MaterialButton(
              onPressed: nextClicked,
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_forward),
                  SizedBox(
                    width: 10,
                  ),
                  Text('PROXIMO')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
