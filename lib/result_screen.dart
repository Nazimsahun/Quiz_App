import 'package:first_app/data/questions.dart';
import 'package:first_app/questions-summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'quiz.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {required this.startQuiz, required this.chosenAnswers, super.key});
  void Function() startQuiz;
  void Function() {}
  final List<String> chosenAnswers;
  int? X = 0;
  List<Map<String, Object>> getsummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summarydata = getsummaryData();
    final X = summarydata.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    final Y = chosenAnswers.length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $X out of $Y questions correctly!",
              style: const TextStyle(
                color: Color.fromARGB(255, 162, 130, 251),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(getsummaryData()),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  primary: Color.fromARGB(255, 188, 182, 255),
                ),
                onPressed: startQuiz,
                icon: const Icon(Icons.restart_alt),
                label: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
