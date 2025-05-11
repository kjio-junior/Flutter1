import 'package:flutter/material.dart';
import 'package:helloworld/screens/settings_screen.dart';
import 'package:url_launcher/url_launcher.dart';

// Import your data models (update these paths to match your project structure)
import 'package:helloworld/models/ghosts.dart';
import 'package:helloworld/models/engkanto.dart';
import 'package:helloworld/models/aswang.dart';
import 'package:helloworld/models/miscellaneous.dart';
import 'package:helloworld/models/gods_goddesses.dart';

class EntriesScreen extends StatefulWidget {
  final int index;
  final String category;
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const EntriesScreen({
    super.key,
    required this.index,
    required this.category,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  _EntriesScreenState createState() => _EntriesScreenState();
}

class _EntriesScreenState extends State<EntriesScreen> {
  final Map<String, Color> categoryColors = {
    "Ghosts": const Color(0xFF494949),
    "Engkanto": const Color(0xFF683761),
    "Aswang": const Color(0xFF2F4F4F),
    "Gods & Goddesses": const Color(0xFF9B8118),
    "Miscellaneous": const Color(0xFF2F354F),
  };

  late List<dynamic> categoryEntries;
  late dynamic entry;
  late Color categoryColor;

  @override
  void initState() {
    super.initState();
    categoryColor = categoryColors[widget.category] ?? const Color(0xFF685147);

    // Assign entries dynamically based on category
    categoryEntries =
        widget.category == "Ghosts"
            ? ghostEntries
            : widget.category == "Engkanto"
            ? engkantoEntries
            : widget.category == "Aswang"
            ? aswangEntries
            : widget.category == "Gods & Goddesses"
            ? godsGoddessesEntries
            : miscellaneousEntries;

    entry = categoryEntries[widget.index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.isDarkMode ? categoryColor : Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Archives - ${widget.category}',
            style: TextStyle(
              fontFamily: 'BonaNova',
              fontSize: 22,
              color: widget.isDarkMode ? Colors.white : categoryColor,
            ),
          ),
        ),
        backgroundColor: widget.isDarkMode ? categoryColor : Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 12.0),
            child: GestureDetector(
              onTap: widget.toggleTheme,
              child: Image.asset(
                widget.isDarkMode
                    ? 'lib/assets/Sun Icon.png'
                    : 'lib/assets/Moon Icon.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => SettingsScreen(
                          toggleTheme: widget.toggleTheme,
                          isDarkMode: widget.isDarkMode,
                        ),
                  ),
                );
              },
              child: Image.asset(
                widget.isDarkMode
                    ? 'lib/assets/Settings DM Icon.png'
                    : 'lib/assets/Settings LM Icon.png',
                width: 30,
                height: 30,
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image of the creature
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: Image.asset(
                  widget.isDarkMode
                      ? entry.darkImagePath
                      : entry.lightImagePath,
                  fit: BoxFit.fitWidth,
                ),
              ),

              // Name of the creature
              Image.asset(
                widget.isDarkMode ? entry.darkNamePath : entry.lightNamePath,
                width: 350,
                height: 150,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Text(
                    entry.name,
                    style: TextStyle(
                      fontSize: 24,
                      color: widget.isDarkMode ? Colors.white : categoryColor,
                      fontFamily: 'BonaNova',
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),

              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  entry.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: widget.isDarkMode ? Colors.white : categoryColor,
                    fontFamily: 'InstrumentSans',
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Sources section with hyperlinks
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 14, fontFamily: 'InstrumentSans'),
                  children: [
                    TextSpan(
                      text: "Sources: ",
                      style: TextStyle(
                        color: widget.isDarkMode ? Colors.white : categoryColor,
                      ),
                    ),
                    for (var i = 0; i < entry.sources.length; i++)
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            launchUrl(Uri.parse(entry.sources[i]));
                          },
                          child: Text(
                            "${i + 1}${i < entry.sources.length - 1 ? ', ' : ''}",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Page indicator image
              Image.asset(
                widget.isDarkMode
                    ? entry.darkPageCountPath
                    : entry.lightPageCountPath,
                width: 100,
                height: 50,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),

              // NEXT BUTTON
              if (widget.index < categoryEntries.length - 1)
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          widget.isDarkMode ? Colors.white : categoryColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EntriesScreen(
                                index: widget.index + 1,
                                category: widget.category,
                                toggleTheme: widget.toggleTheme,
                                isDarkMode: widget.isDarkMode,
                              ),
                        ),
                      );
                    },
                    child: Text(
                      "NEXT: ${categoryEntries[widget.index + 1].name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'BonaNova',
                        fontSize: 18,
                        color: widget.isDarkMode ? categoryColor : Colors.white,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),

              // PREVIOUS BUTTON
              if (widget.index > 0)
                SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          widget.isDarkMode ? categoryColor : Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(
                          color:
                              widget.isDarkMode ? Colors.white : categoryColor,
                          width: 2,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EntriesScreen(
                                index: widget.index - 1,
                                category: widget.category,
                                toggleTheme: widget.toggleTheme,
                                isDarkMode: widget.isDarkMode,
                              ),
                        ),
                      );
                    },
                    child: Text(
                      "PREVIOUS: ${categoryEntries[widget.index - 1].name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'BonaNova',
                        fontSize: 18,
                        color: widget.isDarkMode ? Colors.white : categoryColor,
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 150),
            ],
          ),
        ),
      ),
    );
  }
}
