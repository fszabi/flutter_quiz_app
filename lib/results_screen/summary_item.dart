import 'package:flutter/material.dart';
import 'package:quiz_app_2/results_screen/questions_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['chosen_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          isCorrectAnswer: isCorrectAnswer,
          questionIndex: itemData['question_index'] as int,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: const Color.fromARGB(255, 233, 227, 250),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                itemData['chosen_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 249, 133, 241),
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                itemData['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 150, 198, 241),
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
