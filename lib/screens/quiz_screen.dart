import 'package:flutter/material.dart';
import 'package:helloworld/main.dart';

class QuizScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const QuizScreen({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? Colors.white : MyApp.customColor;
    final buttonColor = isDarkMode ? Colors.white : MyApp.customColor;
    final buttonTextColor = isDarkMode ? Colors.black : Colors.white;

    // Define consistent text style
    final paragraphStyle = TextStyle(
      fontSize: 16,
      color: textColor,
      fontFamily: 'BonaNova',
      fontWeight: FontWeight.normal,
      height: 1.3,
    );

    return Scaffold(
      body: Column(
        children: [
          // Top decorative image
          Center(
            child: Image.asset(
              isDarkMode
                  ? 'lib/assets/QuizUpDM.png'
                  : 'lib/assets/QuizUpLM.png',
              width: 300,
              height: 40,
            ),
          ),

          // Quiz title
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'QUIZ',
              style: TextStyle(
                fontFamily: 'BonaNova',
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: textColor,
                letterSpacing: 1.5,
              ),
            ),
          ),

          Center(
            child: Image.asset(
              isDarkMode
                  ? 'lib/assets/QuizDownDM.png'
                  : 'lib/assets/QuizDownLM.png',
              width: 300,
              height: 40,
            ),
          ),

          // Divider
          const Divider(
            height: 40,
            thickness: 1,
            indent: 20,
            endIndent: 20,
            color: Colors.grey,
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: RichText(
                      text: TextSpan(
                        style: paragraphStyle,
                        children: [
                          TextSpan(
                            text: 'Important note: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BonaNova',
                            ),
                          ),
                          TextSpan(
                            text:
                                'This is only a sample version of the quiz. Depending on what works best in flutter, there may be slight changes in the final product.',
                          ),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  // Second paragraph
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'You will be asked 2 questions from any of the categories. Question type may include: multiple choice, true or false and guess the name.',
                      style: paragraphStyle,
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  // Third paragraph
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Text(
                      'Exiting the quiz prematurely will result in loss of progress. You have been warned.',
                      style: paragraphStyle,
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  // Final text
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      'Best of luck!',
                      style: paragraphStyle.copyWith(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: SizedBox(
              width: 180,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: buttonTextColor,
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Start',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'BonaNova',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
