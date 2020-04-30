import 'package:flutter/material.dart';

class MyScrollView extends StatelessWidget {

  MyScrollView({
    @required this.longText,
    @required this.color1,
    @required this.color2});

  final String longText;
  final Color color1;
  final Color color2;

  //parei aqui: colocar cores como variaveis

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children:[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    color1,
                    color2,
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(longText, style:
                TextStyle(
                    fontSize: 14),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}