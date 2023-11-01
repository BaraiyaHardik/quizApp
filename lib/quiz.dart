import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/result_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> _selectedAnswers = []; // correct answers
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }


  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);
    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }
  void restartQuiz (){
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
         chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:quiz/start_screen.dart';

class Quiz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }

}
class _QuizState extends State<Quiz>{
  @override
  Widget build(context) {
   return  MaterialApp(
     home: Scaffold(
       body: Container(
         decoration: const BoxDecoration(
           gradient: LinearGradient(
             colors: [
               Color.fromARGB(255, 78, 13, 151),
               Color.fromARGB(255, 107, 15, 168),
             ],
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
           ),
         ),
         child: const StartScreen(),
       ),
     ),
   );
  }

}
*/
