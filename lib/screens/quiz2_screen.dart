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
      'type': 'image_grid',
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
      'type': 'image_grid',
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
      'type': 'image_grid',
      'question':
          'This moon goddess is known as the arch-enemy of Bakunawa in Bicolano mythology.',
      'correctAnswer': 'HaliCh',
      'choices': ['HaliCh', 'ManCh', 'NunoCh', 'Tikbalang'],
      'explanations': {
        'HaliCh':
            'Correct! Haliya is the moon goddess who protects the moon from Bakunawa.',
        'ManCh':
            'Incorrect. The manananggal is a vampire-like creature, not a moon goddess.',
        'NunoCh':
            'Incorrect. The nuno is a dwarf-like creature living in anthills.',
        'Tikbalang':
            'Incorrect. The tikbalang is a half-man, half-horse creature.',
      },
    },
    {
      'type': 'image_grid',
      'question':
          'This creature is a dwarf-like being that lives in anthills or mounds (punso).',
      'correctAnswer': 'NunoCh',
      'choices': ['HaliCh', 'ManCh', 'NunoCh', 'Tikbalang'],
      'explanations': {
        'HaliCh': 'Incorrect. Haliya is a moon goddess, not a dwarf.',
        'ManCh': 'Incorrect. The manananggal is a vampire-like creature.',
        'NunoCh':
            'Correct! The nuno sa punso is a dwarf-like creature living in anthills.',
        'Tikbalang':
            'Incorrect. The tikbalang is a half-man, half-horse creature.',
      },
    },
    {
      'type': 'circular_image',
      'image': 'Balbal2.png',
      'question': 'What is this called?',
      'correctAnswer': 'Balbal',
      'choices': ['Adlaw', 'Haliya', 'Balbal', 'Tiktik'],
      'explanations': {
        'Adlaw': 'Try again next time!',
        'Balbal': 'Correct! That is a Balbal!',
        'Haliya': 'Ha? Haliya',
        'Tiktik': 'Tiktok pa more?',
      },
    },
    {
      'type': 'circular_image',
      'image': 'Manananggal.png',
      'question': 'What is this called?',
      'correctAnswer': 'Manananggal',
      'choices': ['Balbal', 'Sirena', 'Adlaw', 'Manananggal'],
      'explanations': {
        'Sirena': 'The manananggal doesn\'t live underwater!',
        'Manananggal': 'Correct! That is a manananggal.',
        'Adlaw': 'Not an adlaw!',
        'Balbal': 'Try again next time!',
      },
    },
    {
      'type': 'true_false',
      'question': 'You should say "Tabi tabi po" when going past a punso.',
      'correctAnswer': 'True',
      'choices': ['True', 'False'],
      'explanations': {
        'True':
            'Correct! It is customary to say tabi tabi po when going through a punso!',
        'False':
            'Incorrect. You will be cursed if you wont say the phrase tabi tabi po.',
      },
    },
    {
      'type': 'true_false',
      'question': 'Haliya and Bakunawa are good friends.',
      'correctAnswer': 'False',
      'choices': ['True', 'False'],
      'explanations': {
        'True': 'Incorrect. Bakunawa is Haliya\'s arch-enemy.',
        'False': 'Correct! Bakunawa and Haliya are not friends!.',
      },
    },
    {
      'type': 'text_choices',
      'question':
          'What is the proper way to protect yourself from an engkanto?',
      'correctAnswer':
          'Say "Tabi tabi po" and ask permission when passing through their territory',
      'choices': [
        'Ignore them completely and walk straight through their dwelling',
        'Say "Tabi tabi po" and ask permission when passing through their territory',
        'Challenge them to a fight to show dominance',
        'Offer them money or valuables as tribute',
      ],
      'explanations': {
        'Ignore them completely and walk straight through their dwelling':
            'This is disrespectful and may anger the engkanto, leading to misfortune.',
        'Say "Tabi tabi po" and ask permission when passing through their territory':
            'Correct! This shows respect to the engkanto and prevents misfortune.',
        'Challenge them to a fight to show dominance':
            'Engkantos are powerful beings - challenging them would be dangerous.',
        'Offer them money or valuables as tribute':
            'Engkantos don\'t typically require material offerings, just respect.',
      },
    },
    {
      'type': 'text_choices',
      'question': 'What should you do if you encounter a Tikbalang at night?',
      'correctAnswer':
          'Turn your shirt inside out to confuse it and safely leave the area',
      'choices': [
        'Run as fast as you can in the opposite direction',
        'Turn your shirt inside out to confuse it and safely leave the area',
        'Try to ride it like a horse to tame it',
        'Offer it food to gain its favor',
      ],
      'explanations': {
        'Run as fast as you can in the opposite direction':
            'Tikbalangs are faster than humans - running won\'t help.',
        'Turn your shirt inside out to confuse it and safely leave the area':
            'Correct! This traditional method confuses the Tikbalang and allows escape.',
        'Try to ride it like a horse to tame it':
            'This would anger the Tikbalang and make the situation worse.',
        'Offer it food to gain its favor':
            'Tikbalangs aren\'t typically appeased by food offerings.',
      },
    },
  ];

  void answerQuestion(String answer) {
    if (answered) return;
    setState(() {
      answered = true;
      selectedAnswer = answer;
      isCorrect = answer == questions[currentQuestionIndex]['correctAnswer'];
      if (isCorrect) score += 10;
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
      setState(() {
        answered = true;
      });
    }
  }

  void resetQuiz() {
    setState(() {
      score = 0;
      currentQuestionIndex = 0;
      answered = false;
      selectedAnswer = '';
      isCorrect = false;
    });
  }

  Widget _buildScoreSummary() {
    final textColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final backgroundColor =
        widget.isDarkMode ? MyApp.customColor.withOpacity(0.8) : Colors.white;
    final buttonColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final buttonTextColor = widget.isDarkMode ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Score:',
                style: TextStyle(
                  fontFamily: 'BonaNova',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 20),

              Image.asset(
                widget.isDarkMode
                    ? 'lib/assets/QuizUpDM.png'
                    : 'lib/assets/QuizUpLM.png',
                width: 300,
                height: 40,
              ),

              const SizedBox(height: 20),

              Text(
                '$score/100',
                style: TextStyle(
                  fontFamily: 'BonaNova',
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 20),

              Image.asset(
                widget.isDarkMode
                    ? 'lib/assets/QuizDownDM.png'
                    : 'lib/assets/QuizDownLM.png',
                width: 300,
                height: 40,
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: resetQuiz,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Try Again',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 18,
                        color: buttonTextColor,
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Back to Quiz',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 18,
                        color: buttonTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
                  color: isCorrect ? Color(0xFF97E08A) : Color(0xFFF46464),
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

  Widget _buildImageGridQuestion() {
    final currentQuestion = questions[currentQuestionIndex];
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
            _buildHeader(textColor),
            _buildScore(),
            _buildQuestionNumber(textColor),
            _buildQuestionBox(currentQuestion, textBoxColor, textBoxTextColor),
            _buildImageChoices(currentQuestion),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularImageQuestion() {
    final currentQuestion = questions[currentQuestionIndex];
    final textColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final backgroundColor =
        widget.isDarkMode ? MyApp.customColor.withOpacity(0.8) : Colors.white;
    final buttonColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final buttonTextColor = widget.isDarkMode ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(textColor),
            _buildScore(),
            _buildQuestionNumber(textColor),
            _buildCircularImage(currentQuestion),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                currentQuestion['question'],
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  fontSize: 18,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2.5,
                  children:
                      (currentQuestion['choices'] as List<String>).map((
                        choice,
                      ) {
                        return ElevatedButton(
                          onPressed: () => answerQuestion(choice),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: Text(
                            choice,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 16,
                              color: buttonTextColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTrueFalseQuestion() {
    final currentQuestion = questions[currentQuestionIndex];
    final textColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final backgroundColor =
        widget.isDarkMode ? MyApp.customColor.withOpacity(0.8) : Colors.white;
    final buttonColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final buttonTextColor = widget.isDarkMode ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(textColor),
            _buildScore(),
            _buildQuestionNumber(textColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  currentQuestion['question'],
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 18,
                    color: buttonTextColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => answerQuestion('True'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'True',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 20,
                            color: buttonTextColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () => answerQuestion('False'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          'False',
                          style: TextStyle(
                            fontFamily: 'InstrumentSans',
                            fontSize: 20,
                            color: buttonTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextChoicesQuestion() {
    final currentQuestion = questions[currentQuestionIndex];
    final textColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final backgroundColor =
        widget.isDarkMode ? MyApp.customColor.withOpacity(0.8) : Colors.white;
    final buttonColor = widget.isDarkMode ? Colors.white : MyApp.customColor;
    final buttonTextColor = widget.isDarkMode ? Colors.black : Colors.white;
    final borderColor =
        widget.isDarkMode
            ? Colors.white.withOpacity(0.3)
            : MyApp.customColor.withOpacity(0.3);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(textColor),
            _buildScore(),
            _buildQuestionNumber(textColor),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: borderColor, width: 1),
                ),
                color: buttonColor,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    currentQuestion['question'],
                    style: TextStyle(
                      fontFamily: 'InstrumentSans',
                      fontSize: 18,
                      color: buttonTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.separated(
                  itemCount: currentQuestion['choices'].length,
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final choice = currentQuestion['choices'][index];
                    return Material(
                      borderRadius: BorderRadius.circular(12),
                      elevation: 1,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => answerQuestion(choice),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: borderColor, width: 1),
                          ),
                          child: Text(
                            choice,
                            style: TextStyle(
                              fontFamily: 'InstrumentSans',
                              fontSize: 16,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
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
    );
  }

  Widget _buildScore() {
    return Padding(
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
    );
  }

  Widget _buildQuestionNumber(Color textColor) {
    return Padding(
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
    );
  }

  Widget _buildQuestionBox(
    Map<String, dynamic> question,
    Color boxColor,
    Color textColor,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          question['question'],
          style: TextStyle(
            fontFamily: 'InstrumentSans',
            fontSize: 18,
            color: textColor,
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }

  Widget _buildImageChoices(Map<String, dynamic> question) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children:
              (question['choices'] as List<String>).map((creature) {
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
              }).toList(),
        ),
      ),
    );
  }

  Widget _buildCircularImage(Map<String, dynamic> question) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: MyApp.customColor, width: 3),
      ),
      child: ClipOval(
        child: Image.asset(
          'lib/assets/${question['image']}',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Text(
                'Image not found',
                style: TextStyle(
                  color: widget.isDarkMode ? Colors.white : Colors.black,
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
    if (answered) {
      if (currentQuestionIndex >= questions.length - 1) {
        return _buildScoreSummary();
      }
      return _buildAnswerResult();
    }

    final currentQuestion = questions[currentQuestionIndex];
    switch (currentQuestion['type']) {
      case 'circular_image':
        return _buildCircularImageQuestion();
      case 'true_false':
        return _buildTrueFalseQuestion();
      case 'text_choices':
        return _buildTextChoicesQuestion();
      default:
        return _buildImageGridQuestion();
    }
  }
}
