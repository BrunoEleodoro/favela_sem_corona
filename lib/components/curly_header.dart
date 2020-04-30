import 'package:flutter/material.dart';

class CurlyHeader extends StatefulWidget {

  CurlyHeader({
    this.image,
    this.offset,
  });
  final String image;
  final double offset;

  @override
  _CurlyHeaderState createState() => _CurlyHeaderState();
}

class _CurlyHeaderState extends State<CurlyHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ClipPath(
        clipper: MyClipper(),
        child: Image.network(
          widget.image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

