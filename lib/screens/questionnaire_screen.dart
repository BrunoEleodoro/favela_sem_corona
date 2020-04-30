import 'package:favelasemcorona/components/questions/form_dropdown.dart';
import 'package:favelasemcorona/components/questions/form_multiple.dart';
import 'package:favelasemcorona/components/questions/form_objective.dart';
import 'package:favelasemcorona/components/questions/form_radio.dart';
import 'package:favelasemcorona/utils/api_helper.dart';
import 'package:favelasemcorona/utils/secrets.dart' as secrets;
import 'package:flutter/material.dart';

class QuestionaireScreen extends StatefulWidget {
  static const String id = 'questionaire_screen';
  @override
  _QuestionaireScreenState createState() => _QuestionaireScreenState();
}

class _QuestionaireScreenState extends State<QuestionaireScreen> {
  var body = {};
  var index = 0;
  List<Widget> pages = List();
  bool isLoading = false;
  PageController controller = PageController();
  var questions = [];
  bool success = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      pages.clear();
      setState(() {
        isLoading = true;
      });
      questions = await ApiHelper.getRequest(context,
          'https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/questionnaire.json');

      var i = 0;
      while (i < questions.length) {
        var type = questions[i]['type'];
        switch (type) {
          case "objective":
            pages.add(ObjectiveScreen(
              body: body,
              nextPage: nextPage,
              previousPage: previousPage,
              id: questions[i]['id'],
              label: questions[i]['label'],
              formatter: questions[i]['formatter'],
              keyboard: questions[i]['keyboard'],
              length: questions[i]['length'],
            ));
            break;
          case "dropdown":
            pages.add(
              DropdownScreen(
                body: body,
                nextPage: nextPage,
                previousPage: previousPage,
                id: questions[i]['id'],
                label: questions[i]['label'],
                items: questions[i]['items'],
              ),
            );
            break;
          case "radio":
            pages.add(
              RadioScreen(
                body: body,
                nextPage: nextPage,
                previousPage: previousPage,
                id: questions[i]['id'],
                label: questions[i]['label'],
                items: List.from(questions[i]['items']),
              ),
            );
            break;
          case "multiple":
            pages.add(
              MultipleScreen(
                body: body,
                nextPage: nextPage,
                previousPage: previousPage,
                id: questions[i]['id'],
                label: questions[i]['label'],
                items: List.from(questions[i]['items']),
              ),
            );
            break;
          default:
        }
        i++;
      }

      setState(() {
        isLoading = false;
      });
    });
  }

  void nextPage() {
    if (index >= pages.length) {
      sendData();
    } else {
      var dependsOn = questions[index + 1]['dependsOn'];
      var respostaAnterior = body[questions[index]['id']];
      if (dependsOn != null && respostaAnterior != dependsOn) {
        pages.removeAt(index+1);
      }
      setState(() {
        index++;
      });
      controller.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  void previousPage() {
    setState(() {
      index--;
    });
    if (index < 0) {
      Navigator.pop(context);
    } else {
      controller.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  void sendData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var res = await ApiHelper.postRequest(
          context,
          "https://script.google.com/macros/s/${secrets.forms_key}/exec",
          body);
      print('res' + res);
    } catch (ex) {}
    setState(() {
      isLoading = false;
      success = true;
    });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoading)
          ? Center(child: CircularProgressIndicator())
          : Stack(
              children: <Widget>[
                Positioned(
                  top: -100,
                  left: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.5),
                        shape: BoxShape.circle),
                  ),
                ),
                (success)
                    ? Center(
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            'Seus dados foram enviados com sucesso! Estamos analisando e vamos te retornar em breve',
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      )
                    : PageView(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        controller: controller,
                        children: pages),
              ],
            ),
    );
  }
}
