import 'package:flutter/material.dart';
import 'package:helloworld/main.dart';

class ArchivesScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const ArchivesScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  void _showConfirmationDialog(BuildContext context, String category) {
    final bgColor = isDarkMode ? MyApp.customColor : Colors.white;
    final textColor = isDarkMode ? Colors.white : MyApp.customColor;
    final buttonColor = isDarkMode ? Colors.white : MyApp.customColor;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Enter $category?',
            style: TextStyle(
              fontFamily: 'BonaNova',
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to view $category content?'
            '\n\nEntries within this category have mentions of violent acts and sexual crime. Proceed?',
            style: TextStyle(
              fontFamily: 'InstrumentSans',
              color: textColor,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: buttonColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _navigateToCategory(context, category);
              },
              child: Text(
                'Proceed',
                style: TextStyle(
                  fontFamily: 'InstrumentSans',
                  color: buttonColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _navigateToCategory(BuildContext context, String category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => Scaffold(
              appBar: AppBar(
                title: Text(category),
                backgroundColor: isDarkMode ? MyApp.customColor : Colors.white,
                titleTextStyle: TextStyle(
                  color: isDarkMode ? Colors.white : MyApp.customColor,
                  fontFamily: 'BonaNova',
                  fontSize: 24,
                ),
              ),
              body: Center(
                child: Text(
                  '$category Content',
                  style: TextStyle(
                    fontSize: 24,
                    color: isDarkMode ? Colors.white : MyApp.customColor,
                  ),
                ),
              ),
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Aswang',
      'Gods and Goddesses',
      'Ghosts',
      'Engkanto',
      'Miscellaneous',
    ];

    final List<String> imageFiles = [
      'AsCat.png',
      'GGCat.png',
      'GhoCat.png',
      'EngCat.png',
      'MisCat.png',
    ];

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 4,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap:
                          () => _showConfirmationDialog(
                            context,
                            categories[index],
                          ),
                      child: Image.asset(
                        'lib/assets/${imageFiles[index]}',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              color:
                                  isDarkMode
                                      ? Colors.grey[800]
                                      : Colors.grey[300],
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
