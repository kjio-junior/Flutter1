import 'package:flutter/material.dart';
import 'package:helloworld/main.dart';

class Quiz2Screen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const Quiz2Screen({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  _Quiz2ScreenState createState() => _Quiz2ScreenState();
}

class _Quiz2ScreenState extends State<Quiz2Screen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;
  List<bool?> _answers = [null, null];

  final List<Map<String, dynamic>> _questions = [
    {
      'type': 'multiple_choice',
      'question':
          'This aswang is a half-man, half-horse humanoid said to roam the vast mountains and rainforests of the Philippines.',
      'options': ['Tikbalang', 'Sirena', 'Bakunawa', 'Apolaki'],
      'correctAnswer': 0,
      'category': 'Identification',
    },
    {
      'type': 'true_false',
      'question': 'Tiktik is a type of Aswang.',
      'correctAnswer': true,
      'category': 'Identification',
    },
  ];

  void _answerQuestion(int selectedOption) {
    setState(() {
      if (_questions[_currentQuestionIndex]['type'] == 'multiple_choice') {
        _answers[_currentQuestionIndex] =
            selectedOption ==
            _questions[_currentQuestionIndex]['correctAnswer'];
        if (_answers[_currentQuestionIndex] == true) {
          _score++;
        }
      }
      _nextQuestion();
    });
  }

  void _answerTrueFalse(bool answer) {
    setState(() {
      _answers[_currentQuestionIndex] =
          answer == _questions[_currentQuestionIndex]['correctAnswer'];
      if (_answers[_currentQuestionIndex] == true) {
        _score++;
      }
      _nextQuestion();
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      setState(() {
        _quizCompleted = true;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
      _answers = [null, null];
    });
  }

  @override
  Widget build(BuildContext context) {
    final textColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final buttonColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final buttonTextColor = widget.isDarkMode ? Colors.black : Colors.white;
    final cardColor = widget.isDarkMode ? Colors.grey[800] : Colors.grey[200];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz Questions',
          style: TextStyle(fontFamily: 'BonaNova', color: textColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            _quizCompleted
                ? _buildResultsScreen(textColor, buttonColor, buttonTextColor)
                : _buildQuestionScreen(
                  textColor,
                  buttonColor,
                  buttonTextColor,
                  cardColor,
                ),
      ),
    );
  }

  Widget _buildQuestionScreen(
    Color textColor,
    Color buttonColor,
    Color buttonTextColor,
    Color? cardColor,
  ) {
    final currentQuestion = _questions[_currentQuestionIndex];
    final questionType = currentQuestion['type'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress indicator
        LinearProgressIndicator(
          value: (_currentQuestionIndex + 1) / _questions.length,
          backgroundColor: Colors.grey[300],
          color: buttonColor,
        ),
        const SizedBox(height: 20),

        // Category chip
        Chip(
          label: Text(
            currentQuestion['category'],
            style: TextStyle(fontFamily: 'BonaNova', color: textColor),
          ),
          backgroundColor: cardColor,
        ),
        const SizedBox(height: 20),

        // Question text
        Text(
          currentQuestion['question'],
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'BonaNova',
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),

        // Question content based on type
        Expanded(
          child:
              questionType == 'multiple_choice'
                  ? _buildMultipleChoiceOptions(
                    currentQuestion,
                    buttonColor,
                    buttonTextColor,
                  )
                  : _buildTrueFalseOptions(buttonColor, buttonTextColor),
        ),
      ],
    );
  }

  Widget _buildMultipleChoiceOptions(
    Map<String, dynamic> question,
    Color buttonColor,
    Color buttonTextColor,
  ) {
    return ListView.builder(
      itemCount: question['options'].length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: buttonTextColor,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: () => _answerQuestion(index),
            child: Text(
              question['options'][index],
              style: TextStyle(fontSize: 16, fontFamily: 'BonaNova'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTrueFalseOptions(Color buttonColor, Color buttonTextColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: buttonTextColor,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () => _answerTrueFalse(true),
          child: Text(
            'True',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'BonaNova',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: buttonTextColor,
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          onPressed: () => _answerTrueFalse(false),
          child: Text(
            'False',
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'BonaNova',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResultsScreen(
    Color textColor,
    Color buttonColor,
    Color buttonTextColor,
  ) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quiz Completed!',
            style: TextStyle(
              fontSize: 28,
              fontFamily: 'BonaNova',
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Your Score: $_score out of ${_questions.length}',
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'BonaNova',
              color: textColor,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              foregroundColor: buttonTextColor,
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            onPressed: _restartQuiz,
            child: Text(
              'Restart Quiz',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'BonaNova',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Back to Home',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'BonaNova',
                color: textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
