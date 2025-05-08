import 'package:flutter/material.dart';
import 'package:helloworld/main.dart';

class Quiz2Screen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const Quiz2Screen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<Quiz2Screen> createState() => _Quiz2ScreenState();
}

class _Quiz2ScreenState extends State<Quiz2Screen> {
  int score = 0;
  bool answered = false;
  bool isCorrect = false;
  String selectedAnswer = '';
  int currentQuestionIndex = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'This engkanto is a half-man, half-horse humanoid said to roam the vast mountains and rainforests of the Philippines.',
      'correctAnswer': 'Tikbalang',
      'choices': ['Bakunawa', 'Tikbalang', 'WhiteLady', 'Balbal'],
      'explanations': {
        'Bakunawa':
            'The Bakunawa is a dragon-like creature that devours the moon, not a half-man, half-horse.',
        'Tikbalang':
            'Correct! The Tikbalang is indeed a half-man, half-horse creature from Philippine mythology.',
        'WhiteLady':
            'The White Lady is a ghostly apparition, not a half-man, half-horse creature.',
        'Balbal':
            'Balbal is a flesh-eating creature, not a half-man, half-horse being.',
      },
    },
    {
      'question':
          'This creature is known as the moon-eating dragon in Philippine mythology.',
      'correctAnswer': 'Bakunawa',
      'choices': ['Bakunawa', 'Tikbalang', 'WhiteLady', 'Balbal'],
      'explanations': {
        'Bakunawa':
            'Correct! The Bakunawa is a dragon-like creature that devours the moon.',
        'Tikbalang':
            'The Tikbalang is a half-man, half-horse creature, not a moon-eater.',
        'WhiteLady': 'The White Lady is a ghost, not a moon-eater.',
        'Balbal': 'Balbal is a flesh-eater, not a moon-eater.',
      },
    },
    {
      'question':
          'This mythological creature is described as a ghostly woman in white who appears in lonely places.',
      'correctAnswer': 'WhiteLady',
      'choices': ['Bakunawa', 'Tikbalang', 'WhiteLady', 'Balbal'],
      'explanations': {
        'Bakunawa': 'The Bakunawa is a dragon-like creature, not a ghost.',
        'Tikbalang':
            'The Tikbalang is a half-man, half-horse creature, not a ghost.',
        'WhiteLady':
            'Correct! The White Lady is indeed the ghostly woman in white from Philippine folklore.',
        'Balbal': 'Balbal is a flesh-eating creature, not a ghost.',
      },
    },
    {
      'question':
          'This creature is known to steal corpses from graves and replace them with banana trunks.',
      'correctAnswer': 'Balbal',
      'choices': ['Bakunawa', 'Tikbalang', 'WhiteLady', 'Balbal'],
      'explanations': {
        'Bakunawa': 'The Bakunawa is a moon-eating dragon, not a corpse thief.',
        'Tikbalang':
            'The Tikbalang is a half-man, half-horse creature, not known for stealing corpses.',
        'WhiteLady': 'The White Lady is a ghost, not a corpse thief.',
        'Balbal':
            'Correct! Balbal is indeed known for stealing corpses and replacing them with banana trunks.',
      },
    },
  ];

  void answerQuestion(String answer) {
    if (answered) return;

    setState(() {
      answered = true;
      selectedAnswer = answer;
      isCorrect = answer == questions[currentQuestionIndex]['correctAnswer'];
      if (isCorrect) {
        score += 10;
      }
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        answered = false;
        selectedAnswer = '';
        isCorrect = false;
      });
    } else {
      Navigator.pop(context);
    }
  }

  Widget _buildAnswerResult() {
    final textColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final backgroundColor =
        widget.isDarkMode ? MyApp.customColor.withOpacity(0.8) : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isCorrect ? 'Correct!' : 'Incorrect!',
                style: TextStyle(
                  fontFamily: 'BonaNova',
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color:
                      isCorrect
                          ? const Color(0xFF97E08A)
                          : const Color(0xFFF46464),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                (questions[currentQuestionIndex]['explanations']
                        as Map<String, String>)[selectedAnswer] ??
                    '',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 18,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      widget.isDarkMode ? Colors.white : MyApp.customColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  currentQuestionIndex < questions.length - 1
                      ? 'Next'
                      : 'Finish',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 20,
                    color: widget.isDarkMode ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuizQuestion() {
    final textColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final backgroundColor =
        widget.isDarkMode ? MyApp.customColor.withOpacity(0.8) : Colors.white;
    final textBoxColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final textBoxTextColor = widget.isDarkMode ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20.0,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: textColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Quiz',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BonaNova',
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      widget.isDarkMode
                          ? 'lib/assets/QuizScoreDM.png'
                          : 'lib/assets/QuizScoreLM.png',
                      width: 200,
                    ),
                    Text(
                      '$score',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 24,
                        color: widget.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                'Question #${currentQuestionIndex + 1}',
                style: TextStyle(
                  fontFamily: 'BonaNova',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: textBoxColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  questions[currentQuestionIndex]['question'],
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 18,
                    color: textBoxTextColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children:
                      (questions[currentQuestionIndex]['choices']
                              as List<String>)
                          .map((creature) {
                            return GestureDetector(
                              onTap: () => answerQuestion(creature),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'lib/assets/$creature.png',
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey[200],
                                        child: Center(
                                          child: Text(
                                            creature,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            );
                          })
                          .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return answered ? _buildAnswerResult() : _buildQuizQuestion();
  }
}
