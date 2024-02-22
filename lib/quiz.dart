import 'package:first_app/data/questions.dart';
import 'package:first_app/questions_screen.dart';
import 'package:first_app/result_screen.dart';
import 'package:first_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activescreen = 'start-screen';
  void swithcscreen() {
    setState(() {
      activescreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activescreen = 'result-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenwidget = StartScreen(swithcscreen);
    if (activescreen == 'question-screen') {
      screenwidget = QuestionsScreen(
        onSelectedAnswer: chooseAnswer,
      );
    }
    if (activescreen == 'result-screen') {
      screenwidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        startQuiz: swithcscreen,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 43, 12, 96),
              Color.fromARGB(255, 77, 14, 158)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: screenwidget,
        ),
      ),
    );
  }
}
