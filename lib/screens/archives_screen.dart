import 'package:flutter/material.dart';

class ArchivesScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const ArchivesScreen({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode;

    return Center(
      child: Text(
        'Your archived content will appear here!',
        style: TextStyle(
          fontFamily: 'BonaNova',
          fontSize: 20,
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
