import 'package:flutter/material.dart';
import 'package:quis_app/screens/home_page.dart';

class ResultPage extends StatelessWidget {
  final int correctAnswer, wrongAnswer;

  const ResultPage({
    Key? key,
    required this.correctAnswer,
    required this.wrongAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.blue.withOpacity(0.8),
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "RESULTADO",
                style: TextStyle(
                  color:  Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.blue.shade400,
                      offset: const Offset(1.5, 1),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  answerTab("Total de Perguntas", correctAnswer + wrongAnswer),
                  answerTab(
                      "% de Acertos",
                      (correctAnswer != 0
                          ? ((correctAnswer / (correctAnswer + wrongAnswer)) *
                                  100)
                              .toStringAsFixed(0)
                          : "0"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  answerTab("Respostas Certas", correctAnswer),
                  answerTab("Respostas Erradas", wrongAnswer),
                ],
              ),
              ElevatedButton(
                onPressed: (() {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const StartQuizPage())),
                    (route) => false,
                  );
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                child: const Text(
                  "Jogar Novamente",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget answerTab(String title, value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "$value",
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
