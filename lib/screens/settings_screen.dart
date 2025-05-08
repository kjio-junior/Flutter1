import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const SettingsScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode;
    final iconPath = isDark ? 'assets/Sun Icon.png' : 'assets/Moon Icon.png';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontFamily: 'BonaNova')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Image.asset(
                iconPath,
                width: 30,
                height: 30,
                errorBuilder:
                    (_, __, ___) => Icon(
                      isDark ? Icons.sunny : Icons.nightlight_round,
                      color:
                          isDark
                              ? Colors.white
                              : Colors.black, // Force contrast
                    ),
              ),
              onPressed: toggleTheme,
            ),
          ),
        ],
      ),
      body: const Center(child: Text('Settings Content Goes Here')),
    );
  }
}
