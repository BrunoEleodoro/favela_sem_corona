import 'package:flutter/material.dart';
import 'package:favelasemcorona/models/quiz_brain.dart';

import '../constants.dart';

QuizBrain quizBrain = QuizBrain();

class QuizScreen extends StatelessWidget {
  static const String id = 'quiz_screen';

  @override
  Widget build(BuildContext context) {
    return QuizPage();

  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  bool displayInfo = false;
  String note = '';
  int selectedIndex = -1;

  void checkAnswer() {
    bool correctAnswer = quizBrain.getCorrectAnswer(selectedIndex);
    if (quizBrain.isFinished() == true) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Parabéns, você terminou o jogo! Nós do Favela '
                  'Sem Corona estaremos sempre com você em nossas redes '
                  'sociais.',
                  style: TextStyle(fontFamily: 'ComicNeue'),),
              title: Text("MUITO BEM!"),
              actions: <Widget>[
                FlatButton(
                  child: Text('OK'),
                  onPressed: () {
                    quizBrain.reset();
                    scoreKeeper = [];
                    Navigator.pushReplacementNamed(
                        context, 'menu_icons_screen');
                  },
                ),
              ],
            );
          });
    } else {
      if (correctAnswer) {
        scoreKeeper.add(Icon(
          Icons.thumb_up,
          color: Colors.green,
          size: 20,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
          size: 20,
        ));
      }
      quizBrain.nextQuestion();
      setState(() {
        selectedIndex = -1;
        displayInfo = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: nearlyWhite,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color:Colors.black),
        title: Text("Stop COVID-19", style: TextStyle(color: Colors.black),),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Image.network(quizBrain.questions[quizBrain.questionNumber]
              .questionImage,
            height: 210,),
          Padding(
            padding: EdgeInsets.all(2.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'MontserratAlternates',
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          (displayInfo)
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${note}', style: TextStyle(
                    fontFamily: 'MontserratAlternates',
                    fontSize: 12.0,
                  ),),
                )
              : SizedBox(),
          Container(
            height: 240,
            margin: EdgeInsets.only(left: 10, right: 10),
            child: ListView.builder(
              itemCount: quizBrain.getPossibleAnswers().length,
              itemBuilder: (context, index) {
                return Card(
                  color: selectedIndex == index ? Colors.amber : Colors.white,
                  elevation: 5,
                  child: ListTile(
                    enabled: selectedIndex == -1 || selectedIndex == index,
                    leading: Icon(Icons.adjust),
                    title: Text(
                      quizBrain.getPossibleAnswers()[index],
                    style: TextStyle(
                      fontFamily: 'MontserratAlternates',
                      fontSize: 16.0,
                    ),),
                    onTap: () {
                      if (selectedIndex != -1) {
                        checkAnswer();
                      } else {
                        int questionIndex = quizBrain.questionNumber;
                        setState(() {
                          selectedIndex = index;
                        });
                        if (quizBrain.questions[questionIndex].note != '') {
                          setState(() {
                            displayInfo = true;
                            note = quizBrain.questions[questionIndex].note;
                          });
                        }
                      }
                    }, //onTap
                  ),
                );
              },
            ),
          ),

        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: scoreKeeper,
        ),
      ),
    );
  }
}
