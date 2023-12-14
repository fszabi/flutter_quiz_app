import 'package:flutter/material.dart';
import 'package:quiz_app_2/data/questions.dart';
import 'package:quiz_app_2/results_screen/questions_summary.dart';
import 'package:quiz_app_2/headings/heading_1.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final List<String> chosenAnswers;

  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'chosen_answer': chosenAnswers[i],
          'correct_answer': questions[i].answers[0],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final correctQuestions = summaryData
        .where(
          (data) => data['chosen_answer'] == data['correct_answer'],
        )
        .length;

    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HeadingOne(
            'You answered $correctQuestions out on $totalQuestions questions correctly!',
          ),
          const SizedBox(
            height: 40,
          ),
          QuestionsSummary(
            summaryData,
          ),
          const SizedBox(
            height: 40,
          ),
          TextButton.icon(
            onPressed: onRestart,
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 233, 227, 250),
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            icon: const Icon(
              Icons.refresh,
              size: 30,
            ),
            label: const Text(
              'Restart Quiz!',
            ),
          ),
        ],
      ),
    );
  }
}
