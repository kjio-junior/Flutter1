import 'package:flutter/material.dart';
import 'package:helloworld/main.dart';

class SettingsScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const SettingsScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _termsExpanded = false;
  bool _feedbackExpanded = false;
  bool _aboutExpanded = false;

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;
    final textColor = isDark ? Colors.white : Colors.black;
    final customColor = MyApp.customColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontFamily: 'BonaNova')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSection(
              title: 'Terms and Conditions',
              isExpanded: _termsExpanded,
              onTap: () => setState(() => _termsExpanded = !_termsExpanded),
              content: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to PHantasya! a mobile app that brings the magic and mystery of Philippine mythology to life.\n\n'
                  'By using this app, you agree to the following terms that help keep the experience safe, respectful, and inspiring for everyone.\n\n'
                  'PHantasya is free to explore, does not require login or account creation, and offers both light and dark mode for user comfort.\n\n'
                  'All stories, creature entries, and design elements in the app are original or properly credited, and may not be copied or used for commercial purposes without permission. While we aim for accuracy, mythology often varies by region and tradition, and our content represents just one version of many. \n\n'
                  'Please use the app respectfully—do not tamper with its features or misuse its content. We do not collect personal data, but may use anonymous analytics to improve the app’s performance. Third-party links or credits may appear, but we are not responsible for external content. The app may be updated occasionally to improve features or fix bugs, but we do not guarantee perfect functionality on all devices.\n\n'
                  'Use of PHantasya is entirely at your own risk, and we are not liable for any damages related to its use. Continued use of the app after updates means you accept the revised terms. We reserve the right to change these terms at any time. Enjoy the journey through myth and magic; may the engkantos and multos guide you well.\n\n'
                  'Last updated: May 2025',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ),
              isDark: isDark,
              customColor: customColor,
            ),
            _buildSection(
              title: 'Send Feedback',
              isExpanded: _feedbackExpanded,
              onTap:
                  () => setState(() => _feedbackExpanded = !_feedbackExpanded),
              content: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'We’d love to hear from you! \n\n'
                      'Whether you spotted a bug, want to request a mythical creature, or just want to say hi, your thoughts help us grow PHantasya into something even more magical. Connect with Us: Instagram: @phantasya_app\n\n'
                      'Follow us for updates, behind-the-scenes content, and a bit of folklore magic in your feed.\n\n'
                      'Email: phantasya.feedback@gmail.com.\nDrop us a message anytime—mythical creature sightings are welcome. \n\n'
                      'Your words are like whispers from the diwata—subtle, powerful, and deeply appreciated.\n\n',
                      style: TextStyle(
                        fontFamily: 'InstrumentSans',
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              isDark: isDark,
              customColor: customColor,
            ),
            _buildSection(
              title: 'About Us',
              isExpanded: _aboutExpanded,
              onTap: () => setState(() => _aboutExpanded = !_aboutExpanded),
              content: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Welcome to PHantasya, where ancient stories whisper through your screen.\n\n'
                  'Version: 1.0.0\n\n'
                  'We created this app to celebrate the myths, legends, and creatures of the Philippines—from the eerie elegance of the white lady to the fiery wrath of the bakunawa. Whether you’re a long-time folklore fan or just starting your journey into the unknown, PHantasya is your companion in exploring the rich world of local mythology.\n\n '
                  'Our Mission:\nTo spark curiosity, preserve cultural stories, and make mythology accessible and exciting for everyone, no matter the age or background.\n\n'
                  'Who We Are:\nWe’re a small team of storytellers, designers, and myth geeks who grew up on aswang tales, bedtime legends, and barrio ghost stories. PHantasya is our tribute to the imagination, mystery, and magic of Filipino heritage.\n\n'
                  'Why PHantasya?\nWe believe our folklore deserves the spotlight. It’s dark, dramatic, beautiful—and completely ours. .\n\n',
                  style: TextStyle(
                    fontFamily: 'InstrumentSans',
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ),
              isDark: isDark,
              customColor: customColor,
            ),
            // Add the arrow divider at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Image.asset(
                isDark
                    ? 'lib/assets/Arrow Divider DM.png'
                    : 'lib/assets/Arrow Divider LM.png',
                width: 300,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required Widget content,
    required bool isDark,
    required Color customColor,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: isDark ? customColor : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'BonaNova',
                fontSize: 18,
                color: isDark ? Colors.white : customColor,
              ),
            ),
            trailing: Icon(
              isExpanded ? Icons.expand_less : Icons.expand_more,
              color: isDark ? Colors.white : customColor,
            ),
            onTap: onTap,
          ),
          if (isExpanded) content,
        ],
      ),
    );
  }
}
