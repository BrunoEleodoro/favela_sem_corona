import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  MenuItem({this.icon, this.iconText, @required this.onPressed});

  final IconData icon;
  final String iconText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 250,
      child: ListTile(
        onTap: onPressed,
        title: Text(iconText),
        leading: Icon(icon, color: Colors.grey),
      ),
    );
  }
}
