import 'package:flutter/material.dart';
import 'package:quis_app/components/questions.dart';
import 'package:quis_app/screens/resultados.dart';
import '../components/alert_option.dart';

class PlayQuizPage extends StatefulWidget {
  const PlayQuizPage({Key? key}) : super(key: key);

  @override
  State<PlayQuizPage> createState() => _PlayQuizPageState();
}

class _PlayQuizPageState extends State<PlayQuizPage> {
  String correctAnswer = "", selectedAnswer = "";
  int currentIndex = 0, correctAnswers = 0, wrongAnswers = 0;
  bool isAnswerLocked = false;
  final PageController pageController = PageController();
  List<QuisQuestionModel> shuffledQuestions = [];
  int nextQuestionIndex = 0;

  _PlayQuizPageState() {
    shuffledQuestions =
        List.from(quisQuestions); // Crie uma cópia da lista original
    shuffledQuestions.shuffle(); // Embaralhe as questões
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Change the app bar color
        title: const Center(
          child: Text(
            "Futebol Quiz",
            style: TextStyle(
              color: Colors.white, // Change the text color
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true, // Center the title
        automaticallyImplyLeading: false, // Remove the back arrow
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.blueAccent.shade100,
            ],
          ),
        ),
        child: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: shuffledQuestions.length,
          itemBuilder: (context, index) {
            QuisQuestionModel model = shuffledQuestions[index];

            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    "Pergunta ${nextQuestionIndex + 1} de ${shuffledQuestions.length}",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      model.question,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: List.generate(
                      model.options.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isAnswerLocked = true;
                              selectedAnswer = model.options[index];
                              correctAnswer = model.correctAnswer;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedAnswer == model.options[index]
                                  ? Colors.blue
                                  : Colors.white, // Change the option color
                            ),
                            padding: const EdgeInsets.all(14),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              model.options[index],
                              style: TextStyle(
                                color: selectedAnswer == model.options[index]
                                    ? Colors.white
                                    : Colors.black, // Change the text color
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 133, 167, 223),
              Color.fromARGB(255, 133, 167, 230),
            ],
          ),
        ),
        child: InkWell(
          onTap: () {
            if (isAnswerLocked) {
              isAnswerLocked = false;
              if (selectedAnswer == correctAnswer) {
                correctAnswers++;
              } else {
                wrongAnswers++;
              }

              nextQuestionIndex++; // Avance para a próxima pergunta

              if (nextQuestionIndex < shuffledQuestions.length) {
                pageController.jumpToPage(nextQuestionIndex);
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      correctAnswer: correctAnswers,
                      wrongAnswer: wrongAnswers,
                    ),
                  ),
                );
              }
              debugPrint("Resposta Correta: $correctAnswers");
              debugPrint("Resposta Errada: $wrongAnswers");
            } else {
              showDialog(
                context: context,
                builder: ((context) {
                  return const AlertOption();
                }),
              );

              debugPrint("Selecione uma opção");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue, // Change the button color
                ),
                height: 70,
                alignment: Alignment.center,
                child: const Text(
                  "Próximo",
                  style: TextStyle(
                    color: Colors.white, // Change the text color
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
