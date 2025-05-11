import 'package:flutter/material.dart';
import 'package:helloworld/screens/entries_screen.dart';

class ArchivesScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const ArchivesScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  ArchivesScreenState createState() => ArchivesScreenState();
}

class ArchivesScreenState extends State<ArchivesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.isDarkMode ? const Color(0xFF685147) : Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          categoryButton('Aswang', 'lib/assets/AswangCategory.png'),
          categoryButton('Gods & Goddesses', 'lib/assets/G&GCategory.png'),
          categoryButton('Ghosts', 'lib/assets/GhostCategory.png'),
          categoryButton('Engkanto', 'lib/assets/EngkantoCategory.png'),
          categoryButton('Miscellaneous', 'lib/assets/MiscCategory.png'),
        ],
      ),
    );
  }

  Widget categoryButton(String category, String imagePath) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => EntriesScreen(
                      index: 0,
                      category: category,
                      toggleTheme: widget.toggleTheme,
                      isDarkMode: widget.isDarkMode,
                    ),
              ),
            );
          },
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
