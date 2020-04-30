import 'package:favelasemcorona/components/counter.dart';
import 'package:favelasemcorona/utils/arcgis_helper.dart';
import 'package:flutter/material.dart';
import 'package:favelasemcorona/components/curly_header.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:favelasemcorona/models/favelas.dart';
import 'package:favelasemcorona/utils/api_helper.dart';
import 'package:favelasemcorona/utils/globals.dart' as globals;
import 'package:webview_flutter/webview_flutter.dart';

class TestTestScreen extends StatefulWidget {
  static const id = 'test_test_screen';

  TestTestScreen({this.favela});

  final Favela favela;

  @override
  _TestTestScreenState createState() => _TestTestScreenState();
}

class _TestTestScreenState extends State<TestTestScreen> {
  String imageUrl;
  String communityName;
  int population;
  int residences;
  int totalCases;
  int activeCases;
  int recoveredCases;
  int deaths;
  String description;
  bool isloading = false;
  String last_update;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromAPI();
    controller.addListener(onScroll);
  }

  void getDataFromAPI() async {
    setState(() {
      isloading = true;
    });
    var favela = globals.selected_favela;
    var infected = await ArcgisHelper.getConfirmedCases(favela);
    var deaths_res = await ArcgisHelper.getDeaths(favela);
    var recovered = await ArcgisHelper.getRecovered(favela);
    DateTime today = new DateTime.now();
    String dateSlug ="${today.day.toString().padLeft(2,'0')}/${today.month.toString().padLeft(2,'0')}";


    setState(() {
      totalCases = infected;
      deaths = deaths_res;
      recoveredCases = recovered;
      last_update = dateSlug;
    });

    setState(() {
      isloading = false;
    });
  }

  final controller = ScrollController();
  double offset = 0;

//  void initState(){
//    super.initState();
//    controller.addListener(onScroll);
//  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isloading)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: controller,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CurlyHeader(
//              image: imageUrl,
                    image:
                        "http://portalgeo.rio.rj.gov.br/mapa_digital_rio/assets/images/territorios/Andarai_MarceloHorn.jpg",
                    offset: offset,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Color(0xFFE5E5E5),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mapPin),
                        SizedBox(width: 20),
                        Text(globals.selected_favela)
//                  Expanded(
//                    child: DropdownButton(
//                      isExpanded: true,
//                      underline: SizedBox(),
//                      icon: Icon(FontAwesomeIcons.arrowAltCircleDown),
//                      value: "Rocinha",
//
////                      items: [
////                        'Rocinha',
////                        'Complexo da Maré',
////                        'Barreira do Vasco',
////                        'Vila Kennedy'
////                      ].map<DropdownMenuItem<String>>((String value) {
////                        return DropdownMenuItem<String>(
////                          value: value,
////                          child: Text(value),
////                        );
////                      }).toList(),
//                      onChanged: (value) {},
//                    ),
//                  ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Casos por bairro\n",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF303030),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "Atualizado em: ${last_update}",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 30,
                                color: Colors.grey.shade400,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Counter(
                                color: Color(0xFFFF8748),
                                number: totalCases,
                                title: "Infectados",
                              ),
                              Counter(
                                color: Color(0xFFFF4848),
                                number: deaths,
                                title: "Mortes",
                              ),
                              Counter(
                                color: Color(0xFF36C12C),
                                number: recoveredCases,
                                title: "Recuperados",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Covid19 por bairro",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF303030),
                                  fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(8),
                          height: 178,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black87,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 30,
                                color: Colors.grey.shade400,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'images/mapRio.png',
                            fit: BoxFit.fill,
                          ),
//                        child: WebView(
//                          initialUrl: 'https://experience.arcgis.com/experience/38efc69787a346959c931568bd9e2cc4',
//                          javascriptMode: JavascriptMode.unrestricted,
//                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
