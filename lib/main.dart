import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloworld/screens/quiz_screen.dart';
import 'package:helloworld/screens/archives_screen.dart';
import 'package:helloworld/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static const Color customColor = Color(0xFF685147);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  int _currentTabIndex = 1;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  Future<void> _ensureFontLoaded() async {
    try {
      final fontLoader = FontLoader('BonaNova')
        ..addFont(rootBundle.load('fonts/BonaNova-Regular.ttf'));
      await fontLoader.load();
    } catch (e) {
      debugPrint('Error loading font: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'BonaNova',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: MyApp.customColor,
            fontFamily: 'BonaNova',
            fontSize: 24,
          ),
          iconTheme: IconThemeData(color: MyApp.customColor),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: MyApp.customColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'BonaNova',
        scaffoldBackgroundColor: MyApp.customColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: MyApp.customColor,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: 'BonaNova',
            fontSize: 24,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: MyApp.customColor,
          unselectedItemColor: Colors.black54,
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: FutureBuilder(
        future: _ensureFontLoaded(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MainNavigationScreen(
              toggleTheme: _toggleTheme,
              isDarkMode: _isDarkMode,
              initialIndex: _currentTabIndex,
              onTabChanged: (index) {
                _currentTabIndex = index;
              },
            );
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;
  final int initialIndex;
  final ValueChanged<int> onTabChanged;

  const MainNavigationScreen({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
    required this.initialIndex,
    required this.onTabChanged,
  });

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  late int _selectedIndex;
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
    _initializeScreens();
  }

  void _initializeScreens() {
    _screens.clear();
    _screens.addAll([
      QuizScreen(
        toggleTheme: widget.toggleTheme,
        isDarkMode: widget.isDarkMode,
      ),
      HomeContent(
        toggleTheme: widget.toggleTheme,
        isDarkMode: widget.isDarkMode,
      ),
      ArchivesScreen(
        toggleTheme: widget.toggleTheme,
        isDarkMode: widget.isDarkMode,
      ),
      const SizedBox(),
    ]);
  }

  @override
  void didUpdateWidget(MainNavigationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isDarkMode != widget.isDarkMode) {
      _initializeScreens();
    }
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      _showQuitDialog();
    } else {
      setState(() {
        _selectedIndex = index;
      });
      widget.onTabChanged(index);
    }
  }

  void _showQuitDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text(
              'Warning!',
              style: TextStyle(fontFamily: 'BonaNova'),
            ),
            content: const Text(
              'You are about to exit the app. Continue?',
              style: TextStyle(fontFamily: 'BonaNova'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'No',
                  style: TextStyle(fontFamily: 'BonaNova'),
                ),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text(
                  'Yes',
                  style: TextStyle(fontFamily: 'BonaNova'),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              _selectedIndex == 0
                  ? 'Quiz'
                  : _selectedIndex == 1
                  ? 'Homepage'
                  : _selectedIndex == 2
                  ? 'Archives'
                  : '',
            ),
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 12.0),
              child: GestureDetector(
                onTap: widget.toggleTheme,
                child: Image.asset(
                  isDark
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
                  isDark
                      ? 'lib/assets/Settings DM Icon.png'
                      : 'lib/assets/Settings LM Icon.png',
                  width: 30,
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex == 3 ? 1 : _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              isDark
                  ? 'lib/assets/Quiz DM Icon.png'
                  : 'lib/assets/Quiz LM Icon.png',
              width: 30,
              height: 30,
            ),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              isDark
                  ? 'lib/assets/Home DM Icon.png'
                  : 'lib/assets/Home LM Icon.png',
              width: 30,
              height: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              isDark
                  ? 'lib/assets/Archive DM Icon.png'
                  : 'lib/assets/Archives LM Icon.png',
              width: 30,
              height: 30,
            ),
            label: 'Archives',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              isDark
                  ? 'lib/assets/Exit DM Icon.png'
                  : 'lib/assets/Exit LM Icon.png',
              width: 30,
              height: 30,
            ),
            label: 'Quit',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const HomeContent({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollPosition);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomeContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isDarkMode != widget.isDarkMode) {
      _scrollPosition = _scrollController.position.pixels;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_scrollPosition);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;
    final bgColor = isDark ? MyApp.customColor : Colors.white;
    final textColor = isDark ? Colors.white : MyApp.customColor;

    return SingleChildScrollView(
      key: const PageStorageKey<String>('homePageScrollPosition'),
      controller: _scrollController,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'lib/assets/Banner.png',
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 30,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        bgColor.withOpacity(0.7),
                        bgColor.withOpacity(0.95),
                      ],
                      stops: const [0.0, 0.5],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: const Offset(0, -106),
            child: Column(
              children: [
                Image.asset(
                  isDark
                      ? 'lib/assets/PHantasya Logo DM.png'
                      : 'lib/assets/PHantasya Logo LM.png',
                  width: 240,
                  height: 240,
                ),
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: Column(
                    children: [
                      Text(
                        'Learn all about',
                        style: TextStyle(
                          fontFamily: 'BonaNova',
                          fontSize: 24,
                          color: textColor,
                          height: 0.9,
                        ),
                      ),
                      Text(
                        'Philippine Mythology!',
                        style: TextStyle(
                          fontFamily: 'BonaNova',
                          fontSize: 24,
                          color: textColor,
                          height: 0.9,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Image.asset(
                        isDark
                            ? 'lib/assets/Arrow Divider DM.png'
                            : 'lib/assets/Arrow Divider LM.png',
                        width: 300,
                        height: 24,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              isDark
                                  ? 'lib/assets/Archives LM Icon.png'
                                  : 'lib/assets/Archive DM Icon.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Read about famous Aswangs, Spirits, Gods and Goddesses that color our history in the Archives.',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Test what you\'ve learned about Philippine myths in the Quizzes Tab! Are you up for the challenge?',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              isDark
                                  ? 'lib/assets/Quiz LM Icon.png'
                                  : 'lib/assets/Quiz DM Icon.png',
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              isDark
                                  ? 'lib/assets/Sun Icon.png'
                                  : 'lib/assets/Moon Icon.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Toggle between light and dark modes to fit your preferences.',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'Visit settings to view terms & conditions, additional information or send us a suggestion!',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Image.asset(
                              isDark
                                  ? 'lib/assets/Settings DM Icon.png'
                                  : 'lib/assets/Settings LM Icon.png',
                              width: 100,
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              isDark
                                  ? 'lib/assets/Exit LM Icon.png'
                                  : 'lib/assets/Exit DM Icon.png',
                              width: 100,
                              height: 100,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                'Need a break? Click the exit button to close the app. See you soon!',
                                style: TextStyle(
                                  fontFamily: 'InstrumentSans',
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Image.asset(
                        isDark
                            ? 'lib/assets/Arrow Divider DM.png'
                            : 'lib/assets/Arrow Divider LM.png',
                        width: 300,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
