import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, {super.key});
  void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 300,
            child: Image.asset(
              'assets/images/quiz.png',
              color: const Color.fromARGB(133, 162, 132, 214),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            "Learn Flutter the Fun way!",
            style: GoogleFonts.lato(
                fontSize: 24,
                color: const Color.fromARGB(255, 147, 112, 199),
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 225, 205, 245)),
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start Quiz")),
        ],
      ),
    );
  }
}
