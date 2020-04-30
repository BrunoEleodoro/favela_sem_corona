import 'dart:ui';
import 'package:favelasemcorona/models/posto_de_saude.dart';
import 'package:favelasemcorona/screens/favelas_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostoDeSaudeScreen extends StatefulWidget {
  static const String id = 'listview_screen';
  final PostoDeSaude postoDeSaude;

  PostoDeSaudeScreen({this.postoDeSaude});

  @override
  _PostoDeSaudeScreenState createState() => _PostoDeSaudeScreenState();
}

class _PostoDeSaudeScreenState extends State<PostoDeSaudeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: 360,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [BoxShadow(color: Colors.black26, offset: Offset
                      (0.0, 2.0,), blurRadius: 6.0,),]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(image: NetworkImage('https://raw.githubusercontent'
                      '.com/itsencrypted/favela_sem_corona_api/master/images/doctor.png'),
                    fit: BoxFit.cover,),),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Rocinha', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600, color: Colors.teal,),),
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
            SizedBox(height: 10,),
            Container(color: Colors.grey.shade100,
            child: Column(
              children: <Widget>[
                Text('${clinicasDaFamiliaRocinha[0].nome}', style: TextStyle(fontSize:
                18, fontWeight: FontWeight.bold),),
                Text('${clinicasDaFamiliaRocinha[0].endereco}'),
                Text('${clinicasDaFamiliaRocinha[0].telefone}'),
                Text('${clinicasDaFamiliaRocinha[0].horariosDeFuncionamento[0]}'),
                Text('${clinicasDaFamiliaRocinha[0].horariosDeFuncionamento[1]}'),
                Text(''),
                Text('${clinicasDaFamiliaRocinha[1].nome}', style: TextStyle(fontSize:
                18, fontWeight: FontWeight.bold),),
                Text('${clinicasDaFamiliaRocinha[1].endereco}'),
                Text('${clinicasDaFamiliaRocinha[1].telefone}'),
                Text('${clinicasDaFamiliaRocinha[1].horariosDeFuncionamento[0]}'),
                Text('${clinicasDaFamiliaRocinha[1].horariosDeFuncionamento[1]}'),
                Text(''),
                Text('${clinicasDaFamiliaRocinha[2].nome}', style: TextStyle(fontSize:
                18, fontWeight: FontWeight.bold),),
                Text('${clinicasDaFamiliaRocinha[2].endereco}'),
                Text('${clinicasDaFamiliaRocinha[2].telefone}'),
                Text('${clinicasDaFamiliaRocinha[2].horariosDeFuncionamento[0]}'),
                Text('${clinicasDaFamiliaRocinha[2].horariosDeFuncionamento[1]}'),
                Text(''),
                ],
            )),
            SizedBox(height: 10,),
            IconButton(
              icon: Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/stickers_fsc03.gif'),
              iconSize: 170,
              onPressed: () {
                Navigator.pushReplacementNamed(context, FavelasScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}