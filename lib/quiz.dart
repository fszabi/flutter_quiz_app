import 'package:flutter/material.dart';
import 'package:quiz_app_2/data/questions.dart';
import 'package:quiz_app_2/results_screen/results_screen.dart';
import 'package:quiz_app_2/start_screen/start_screen.dart';
import 'package:quiz_app_2/questions_screen/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionsScreen();
  //   });
  // } There is a better approach

  List<String> selectedAnswers = [];

  var activeScreen = 'start-screen';

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void switchToQuestions() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(
      onSwitchToQuestions: switchToQuestions,
    );

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 60, 11, 143),
                Color.fromARGB(255, 117, 43, 243),
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
