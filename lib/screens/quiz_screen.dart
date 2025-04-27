import 'package:flutter/material.dart';

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
    return Scaffold(body: Center(child: Text('Quiz Screen')));
  }
}
