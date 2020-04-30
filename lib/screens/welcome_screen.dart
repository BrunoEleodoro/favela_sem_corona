import 'dart:async';

import 'package:dio/dio.dart';
import 'package:favelasemcorona/components/dharma_button.dart';
import 'package:favelasemcorona/screens/main_menu_screen.dart';
import 'package:favelasemcorona/utils/api_helper.dart';
import 'package:flutter/material.dart';
import 'package:favelasemcorona/utils/globals.dart' as globals;
import 'package:geolocation/geolocation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String selectedItem = "selecione";
  bool isLoading = false;
  List<DropdownMenuItem<String>> favelas_dropdown = List();
  SharedPreferences prefs;
  var favelas;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      getFavelas();
      prefs = await SharedPreferences.getInstance();
      getGeolocationPosition();
    });
  }

  void getFavelas() async {
    setState(() => isLoading = true);
    favelas = await ApiHelper.getRequest(context,
        "https://services1.arcgis.com/OlP4dGNtIcnD3RYf/arcgis/rest/services/Casos_bairros_2/FeatureServer/0/query?f=json&where=Confirmados%20%3C%3E%200&returnGeometry=false&spatialRel=esriSpatialRelIntersects&outFields=*&orderByFields=Ordem%20desc&resultOffset=0&resultRecordCount=162&resultType=standard&cacheHint=true");
    var i = 0;
    favelas_dropdown.clear();

    favelas_dropdown.add(
      DropdownMenuItem(
        value: 'selecione',
        child: Text('Selecione sua comunidade'),
      ),
    );

    while (i < favelas['features'].length) {
      favelas_dropdown.add(DropdownMenuItem(
        value: favelas['features'][i]['attributes']['Bairro'],
        child: Text(favelas['features'][i]['attributes']['Bairro']),
      ));
      i++;
    }

    setState(() => isLoading = false);
  }

  void getGeolocationPosition() async {
    await Geolocation.enableLocationServices();

    var status = await Permission.location;
    
    print(status);

    StreamSubscription<LocationResult> subscription =
        Geolocation.currentLocation(accuracy: LocationAccuracy.best)
            .listen((result) async {
      if (result.isSuccessful) {
        var myLocation = result.location.latitude.toString() +
            "," +
            result.location.longitude.toString();
        print('my location=' + myLocation);
        await prefs.setString('location', myLocation);
        // todo with result
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                {Navigator.pushNamed(context, 'menu_icons_screen')},
            icon: Icon(
              Icons.list,
              color: Colors.black,
              size: 40.0,
            ),
          )
        ],
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //SizedBox(height: MediaQuery.of(context).size.height*0.2),
                      Hero(
                        child: Container(
                          child: Image.network(
                              'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/logo.png'),
                          height: MediaQuery.of(context).size.height * 0.35,
                        ),
                        tag: 'logo-favelasemcorona',
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06),
                      DropdownButton<String>(
                          onChanged: (value) {
                            setState(() => selectedItem = value);
                            globals.selected_favela = value;
                            globals.favelas = favelas;
                          },
                          value: selectedItem,
                          items: favelas_dropdown),
                      Visibility(
                        visible: selectedItem != "selecione",
                        child: DharmaButton(
                          titleOfButton: 'Entrar',
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, MenuIconsScreen.id),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
