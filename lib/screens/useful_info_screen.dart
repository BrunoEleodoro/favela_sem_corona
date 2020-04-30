import 'package:favelasemcorona/components/menu_item_button.dart';
import 'package:favelasemcorona/screens/disk_covid_screen.dart';
import 'package:favelasemcorona/screens/disk_domestic_violence_screen.dart';
import 'package:favelasemcorona/screens/iml_screen.dart';
import 'package:favelasemcorona/screens/psychological_help_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class UsefulInfoScreen extends StatelessWidget {
  static const String id = "useful_info_screen";
//
//  Widget MenuItem(IconData icon, String text, Function pressed) {
//    return FlatButton(
//      onPressed: pressed,
//      child: Row(
//        children: <Widget>[
//          SizedBox(width: 40),
//          Icon(icon, color: Colors.grey),
//          SizedBox(width: 10),
//          Text(text)
//        ],
//      ),
//    );
//  }

  Widget line() {
    return SizedBox(
      height: 1,
      width: 300,
      child: Divider(
        color: Colors.grey.shade400,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-dir.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-esq.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-dir.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-esq.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-dir.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-esq.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-dir.png'),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        child: Hero(
                            child: Container(child: Image.network
                              ('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/logo.png',
                              width: 180, height: 180,)),
                            tag: 'logo-favelasemcorona'
                        ),
                      ),
                      SizedBox(height: 30),
                      MenuItem(icon: FontAwesomeIcons.ambulance,
                        iconText: "DISQUE SAÚDE / SAMU",
                        onPressed: () => Navigator.pushNamed(context, DiskCovidScreen.id),),
                      MenuItem(icon: FontAwesomeIcons.bullhorn,
                        iconText: 'DISQUE DENÚNCIA',
                        onPressed: () => Navigator.pushNamed(context, DiskDomesticViolenceScreen.id),),
                      MenuItem(icon: FontAwesomeIcons.handHoldingHeart,
                        iconText: 'APOIO PSICOLÓGICO',
                        onPressed: () => Navigator.pushNamed(context, PsychologicalHelpScreen.id),),
                      MenuItem(icon: FontAwesomeIcons.skullCrossbones,
                        iconText: 'ASSISTÊNCIA FUNERÁRIA',
                        onPressed: () => Navigator.pushNamed(context, IMLScreen.id),),
                      MenuItem(icon: FontAwesomeIcons.backward,
                      iconText: 'MENU',
                      onPressed: ()=> Navigator.pop(context),),
                      SizedBox(height: 60,),
                      Image.network('https://raw.githubusercontent'
                          '.com/itsencrypted/favela_sem_corona_api/master'
                          '/images/stickers_fsc08.gif', width: 240)
                    ],
                  ),
                ),
              ),
            ],
          ),
    );
  }
}
