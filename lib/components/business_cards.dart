import 'package:flutter/material.dart';

class BusinessCards extends StatelessWidget {

  BusinessCards({
    this.businessName,
    this.businessType,
    this.whatsApp,
    this.instagram,
    this.facebook,
    this.businessPicture
    });

  final String businessName;
  final String businessType;
  final String whatsApp;
  final String instagram;
  final String facebook;
  final String businessPicture;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(110, 5, 10, 5),
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey
              .shade200,
            borderRadius: BorderRadius.circular(20),),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(width: 140,
                        child: Text
                          (businessName,
                          style:
                          TextStyle
                            (fontSize: 16.0, fontWeight: FontWeight.w600),maxLines: 2, overflow: TextOverflow.ellipsis,)
                    ),
                    Text(businessType,
                      style:
                      TextStyle
                        (fontSize:10, fontWeight: FontWeight.w600),),
                  ],),
                SizedBox(height: 8.0,),
                Text(whatsApp, style: TextStyle(color: Colors.green),),
                SizedBox(height: 2.0,),
                Text(instagram, style: TextStyle(color:
                Colors.black54),),
                SizedBox(height: 2.0,),
                Text(facebook, style: TextStyle(color:
                Colors.black54),),
                SizedBox(height: 2.0,),
              ],),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 5.0,
          bottom: 5.0,
          child: ClipRRect(borderRadius: BorderRadius.circular(20.0),
            child: Image(width: 100.0, image: AssetImage
              (businessPicture),
              fit: BoxFit.cover,),),
        )
      ],
    );
  }
}