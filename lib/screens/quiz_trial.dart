import 'package:flutter/material.dart';
import 'package:helloworld/main.dart';
import 'package:helloworld/screens/quiz_screen.dart'; // Make sure path is correct

class QuizTrial extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const QuizTrial({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return QuizPageWrapper(toggleTheme: toggleTheme, isDarkMode: isDarkMode);
  }
}

class QuizPageWrapper extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const QuizPageWrapper({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<QuizPageWrapper> createState() => _QuizPageWrapperState();
}

class _QuizPageWrapperState extends State<QuizPageWrapper> {
  int score = 0;

  void _restartQuiz() {
    setState(() {
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuizPage(
        isDarkMode: widget.isDarkMode,
        onScoreUpdate: (newScore) {
          setState(() {
            score = newScore;
          });
        },
        score: score,
        toggleTheme: widget.toggleTheme,
        onBackPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => QuizScreen(
                    toggleTheme: widget.toggleTheme,
                    isDarkMode: widget.isDarkMode,
                  ),
            ),
          );
        },
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final bool isDarkMode;
  final int score;
  final ValueChanged<int> onScoreUpdate;
  final VoidCallback toggleTheme;
  final VoidCallback onBackPressed;

  const QuizPage({
    super.key,
    required this.isDarkMode,
    required this.score,
    required this.onScoreUpdate,
    required this.toggleTheme,
    required this.onBackPressed,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final String correctAnswer = 'Balbal';

  void _checkAnswer(String selectedAnswer) {
    bool isCorrect = selectedAnswer == correctAnswer;
    int updatedScore = widget.score;

    if (isCorrect) {
      updatedScore++;
    }

    widget.onScoreUpdate(updatedScore);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ResultPage(
              isCorrect: isCorrect,
              isDarkMode: widget.isDarkMode,
              onNext: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ScorePage(
                          score: updatedScore,
                          isDarkMode: widget.isDarkMode,
                          onRestart: () {
                            setState(() {
                              widget.onScoreUpdate(0);
                            });
                          },
                          toggleTheme: widget.toggleTheme,
                          onBackPressed: widget.onBackPressed,
                        ),
                  ),
                );
              },
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.isDarkMode ? Colors.brown : Colors.white;
    final textColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final buttonColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final buttonTextColor =
        widget.isDarkMode ? MyApp.customColor : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: widget.onBackPressed,
        ),
        title: Text(
          'Quiz',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'BonaNova',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: textColor,
            ),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.local_florist, color: MyApp.customColor),
                const SizedBox(width: 10),
                Text(
                  'Score: ${widget.score}',
                  style: TextStyle(color: textColor, fontFamily: 'BonaNova'),
                ),
                const SizedBox(width: 10),
                Icon(Icons.local_florist, color: MyApp.customColor),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Question #1',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: textColor,
                fontFamily: 'BonaNova',
              ),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/balbal.png'),
            ),
            const SizedBox(height: 20),
            Text(
              'What is this called?',
              style: TextStyle(color: textColor, fontFamily: 'BonaNova'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  _answerButton('Adlaw', buttonColor, buttonTextColor),
                  _answerButton('Haliya', buttonColor, buttonTextColor),
                  _answerButton('Balbal', buttonColor, buttonTextColor),
                  _answerButton('Tiktik', buttonColor, buttonTextColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _answerButton(String text, Color buttonColor, Color textColor) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width / 2) - 30,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () => _checkAnswer(text),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontFamily: 'BonaNova'),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final bool isCorrect;
  final bool isDarkMode;
  final VoidCallback onNext;

  const ResultPage({
    super.key,
    required this.isCorrect,
    required this.isDarkMode,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? Colors.brown : Colors.white;
    final textColor = isDarkMode ? Colors.white : MyApp.customColor;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isCorrect ? 'Correct!' : 'Incorrect!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: isCorrect ? Colors.lightGreenAccent : Colors.redAccent,
                fontFamily: 'BonaNova',
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontFamily: 'BonaNova',
                ),
                children: [
                  const TextSpan(text: 'That is a '),
                  TextSpan(
                    text: 'Balbal.',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.white : MyApp.customColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onNext,
              child: Text(
                'Next',
                style: TextStyle(
                  color: isDarkMode ? MyApp.customColor : Colors.white,
                  fontFamily: 'BonaNova',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  final bool isDarkMode;
  final VoidCallback onRestart;
  final VoidCallback toggleTheme;
  final VoidCallback onBackPressed;

  const ScorePage({
    super.key,
    required this.score,
    required this.isDarkMode,
    required this.onRestart,
    required this.toggleTheme,
    required this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isDarkMode ? Colors.brown : Colors.white;
    final textColor = isDarkMode ? Colors.white : MyApp.customColor;
    final buttonColor = isDarkMode ? Colors.white : MyApp.customColor;
    final buttonTextColor = isDarkMode ? MyApp.customColor : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: onBackPressed,
        ),
        title: Text(
          'Quiz',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'BonaNova',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
              color: textColor,
            ),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score:',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: 'BonaNova',
                ),
              ),
              const SizedBox(height: 20),
              Icon(Icons.star, color: MyApp.customColor, size: 60),
              Text(
                '$score',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  fontFamily: 'BonaNova',
                ),
              ),
              Icon(Icons.star, color: MyApp.customColor, size: 60),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: onRestart,
                child: Text(
                  'Try Again',
                  style: TextStyle(
                    color: buttonTextColor,
                    fontFamily: 'BonaNova',
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
