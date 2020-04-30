import 'package:flutter/material.dart';

class GreyLine extends StatelessWidget {
  const GreyLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      width: 300,
      child: Divider(
        color: Colors.grey.shade400,
      ),
    );
  }
}
