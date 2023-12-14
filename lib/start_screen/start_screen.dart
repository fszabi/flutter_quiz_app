import 'package:flutter/material.dart';
import 'package:quiz_app_2/headings/heading_1.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.onSwitchToQuestions,
  });

  final void Function() onSwitchToQuestions;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ), There is a better approach
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          const SizedBox(
            height: 80,
          ),
          const HeadingOne(
            'Learn Flutter the fun way!',
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: onSwitchToQuestions,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 233, 227, 250),
              side: const BorderSide(
                width: 2,
                color: Color.fromARGB(255, 233, 227, 250),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
            ),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
