import 'dart:ui';
import 'package:favelasemcorona/models/entrepreneurs.dart';
import 'package:favelasemcorona/models/favelas.dart';
import 'package:favelasemcorona/components/business_cards.dart';
import 'package:favelasemcorona/screens/main_menu_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Favela favela = Favela();

class EntrepreneursScreen extends StatefulWidget {
  static const String id = 'entrepreneurs_screen';
  final Favela favela;

  // ignore: sort_constructors_first
  EntrepreneursScreen({this.favela});

  @override
  _EntrepreneursScreenState createState() => _EntrepreneursScreenState();
}

class _EntrepreneursScreenState extends State<EntrepreneursScreen> {

  String communityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(height: 310,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0.0, 2.0,), blurRadius: 6.0,),]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image(image: AssetImage('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/favelaRocinha.jpg'),
                  fit: BoxFit.cover,),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,
                      size: 30.0), onPressed: () => Navigator.pushReplacementNamed(context, MenuIconsScreen.id)),
                ],),
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Rocinha', style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.w600, color: Colors.white,),),
                  Row(
                    children: <Widget>[
                      Icon(Icons.edit_location, size: 15.0, color: Colors.white,),
                      SizedBox(width: 5.0,),
                      Text('Zona Oeste', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600, color: Colors.tealAccent),),
                    ],
                  ),
                ],),
            ),
          ],),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: rocinhaEntrepreneurs.length,
              itemBuilder: (BuildContext context, int index){
                return BusinessCards(
                  businessName: '${rocinhaEntrepreneurs[index].businessName}',
                  businessType: '${rocinhaEntrepreneurs[index].businessType}',
                  whatsApp:'WhatsApp: ${rocinhaEntrepreneurs[index].whatsApp}' ,
                  instagram: 'Instagram: ${rocinhaEntrepreneurs[index].instagramUrl}',
                  facebook:'${rocinhaEntrepreneurs[index].facebookUrl}',
                  businessPicture: 'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/chef-logo.jpg',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

