import 'package:favelasemcorona/screens/arcgis_covid_screen.dart';
import 'package:favelasemcorona/screens/auth_for_wallet.dart';
import 'package:favelasemcorona/screens/disk_covid_screen.dart';
import 'package:favelasemcorona/screens/disk_domestic_violence_screen.dart';
import 'package:favelasemcorona/screens/entrepreneurs_screen.dart';
import 'package:favelasemcorona/screens/facebook_screen.dart';
import 'package:favelasemcorona/screens/favelas_screen.dart';
import 'package:favelasemcorona/screens/iml_screen.dart';
import 'package:favelasemcorona/screens/kyc_donation.dart';
import 'package:favelasemcorona/screens/kyc_screen.dart';
import 'package:favelasemcorona/screens/map_demo.dart';
import 'package:favelasemcorona/screens/main_menu_screen.dart';
import 'package:favelasemcorona/screens/payment_amount.dart';
import 'package:favelasemcorona/screens/posto_de_saude_screen.dart';
import 'package:favelasemcorona/screens/psychological_help_screen.dart';
import 'package:favelasemcorona/screens/questionnaire_screen.dart';
import 'package:favelasemcorona/screens/quiz_screen.dart';
import 'package:favelasemcorona/screens/test_test_screen.dart';
import 'package:favelasemcorona/screens/useful_info_screen.dart';
import 'package:favelasemcorona/screens/wallet.dart';
import 'package:favelasemcorona/screens/welcome_screen.dart';
import 'package:favelasemcorona/screens/min_saude_screen.dart';
import 'package:favelasemcorona/screens/instagram_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';


void main() => runApp(FavelaSemCorona());

class FavelaSemCorona extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: notWhite, // navigation bar color
        statusBarColor: notWhite,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarDividerColor: background,
        systemNavigationBarIconBrightness: Brightness.dark// status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      // initialRoute: QuestionaireScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        MenuIconsScreen.id: (context) => MenuIconsScreen(),
        QuizScreen.id: (context) => QuizScreen(),
        MinSaudeScreen.id: (context) => MinSaudeScreen(),
        MapsDemo.id: (context) => MapsDemo(),
        PainelCovidRioScreen.id: (context) => PainelCovidRioScreen(),
        IMLScreen.id: (context) => IMLScreen(),
        PostoDeSaudeScreen.id: (context) => PostoDeSaudeScreen(),
        Wallet.id: (context) => Wallet(),
        FavelasScreen.id: (context) => FavelasScreen(),
        EntrepreneursScreen.id: (context) => EntrepreneursScreen(),
        InstagramScreen.id: (context) => InstagramScreen(),
        UsefulInfoScreen.id: (context) => UsefulInfoScreen(),
        DiskCovidScreen.id: (context) => DiskCovidScreen(),
        DiskDomesticViolenceScreen.id: (context) => DiskDomesticViolenceScreen(),
        PsychologicalHelpScreen.id: (context) => PsychologicalHelpScreen(),
        FacebookScreen.id: (context) => FacebookScreen(),
        TestTestScreen.id: (context) => TestTestScreen(),
        PaymentTx.id: (context) => PaymentTx(),
        Auth.id: (context) => Auth(),
        QuestionaireScreen.id: (context) => QuestionaireScreen(),
        Login_email.id :(context) => Login_email(),
        DonationKyc.id :(context) => DonationKyc(),
      },
    );
  }
}
