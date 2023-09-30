import 'package:flutter/material.dart';
import 'package:quis_app/screens/telaquiz.dart';

class StartQuizPage extends StatelessWidget {
  const StartQuizPage({super.key, Key? k});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.topRight,
            colors: [
              Colors.blue, // Change the gradient colors
              Colors.blueAccent.shade100,
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Futebol Quiz",
                style: TextStyle(
                  color: Colors.white, // Change the text color
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
              // Add the image below the text
              Image.asset(
                'assets/images/soccer_quis.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PlayQuizPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Change the button color
                  minimumSize: const Size(200, 60),
                ),
                child: const Text(
                  "Jogar",
                  style: TextStyle(
                    color: Colors.blue, // Change the text color
                    fontSize: 18,
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
}
