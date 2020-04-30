import 'package:favelasemcorona/components/dharma_button.dart';
import 'package:favelasemcorona/components/grey_line.dart';
import 'package:favelasemcorona/components/scroll_view.dart';
import 'package:favelasemcorona/screens/map_demo.dart';
import 'package:favelasemcorona/screens/useful_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiskCovidScreen extends StatelessWidget {
  static const String id = "disk_covid_screen";

  //https://www.saude.gov.br/saude-de-a-z/servico-de-atendimento-movel-de-urgencia-samu-192

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'MontserratAlternates' ),
      home: SafeArea(
        child: Scaffold(
          body: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            verticalDirection: VerticalDirection.up,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,
                      //     size: 30.0), onPressed: () => Navigator
                      //     .pushReplacementNamed(context, UsefulInfoScreen.id)),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-dir.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-esq.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-dir.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-esq.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-dir.png'),
                      Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/corona-esq.png'),
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
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Container(child: Image.network
                          ('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/disk-covid.png', width: 200, height: 200,)),
                      ),
                      MyScrollView(
                        longText: 'Ao ligar no Disque Saúde 136, gratuitamente, e escolhendo a opção número 1, '
                            'a população pode buscar ajuda para identificar sinais da doença e até ser atendido '
                            'por um profissional de saúde para tirar dúvidas e receber orientações sobre seu quadro clínico.',
                        color1: Colors.transparent,
                        color2: Colors.transparent,),
                      GreyLine(),
                      Text("SAMU - 192", style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w700),),
                      MyScrollView(
                        longText: 'Veja quando chamar o SAMU:'
                        '\n'
                            'Na ocorrência de problemas cardio-respiratórios;'
                            '\n'
                            'Intoxicação exógena e envenenamento;'
                            '\n'
                            'Queimaduras graves;'
                            '\n'
                            'Na ocorrência de maus tratos;'
                            '\n'
                            'Trabalhos de parto em que haja risco de morte da mãe ou do feto;'
                            '\n'
                            'Em tentativas de suicídio;'
                            '\n'
                            'Crises hipertensivas e dores no peito de aparecimento súbito;'
                            '\n'
                            'Quando houver acidentes/traumas com vítimas;'
                            '\n'
                            'Afogamentos;'
                            '\n'
                            'Choque elétrico;'
                            '\n'
                            'Acidentes com produtos perigosos;'
                            '\n'
                            'Suspeita de Infarto ou AVC (alteração súbita na fala, '
                            'perda de força em um lado do corpo e desvio da comissura labial são os sintomas mais comuns);'
                            '\n'
                            'Agressão por arma de fogo ou arma branca;'
                            '\n'
                            'Soterramento, Desabamento;'
                            '\n'
                            'Crises Convulsivas;'
                            '\n'
                            'Transferência inter-hospitalar de doentes graves;'
                            '\n'
                            'Outras situações consideradas de urgência ou emergência, com risco de morte, sequela ou sofrimento intenso.',
                        color1: Colors.transparent,
                        color2: Colors.transparent,),
                      DharmaButton(
                        titleOfButton: 'UPA perto de você',
                      onPressed: () => Navigator.pushReplacementNamed
                        (context, MapsDemo.id),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
