import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/hotel.dart';
import 'package:flutter_application_2/views/page/bookmarks_page.dart';
import 'package:flutter_application_2/views/page/profile_page.dart';
import 'package:flutter_application_2/views/page/settings_page.dart';
import 'package:heroicons/heroicons.dart';


import 'home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

 
  bool _isDarkTheme = false;


  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(onBookmarkUpdated: (Hotel hotel) {}),
      const BookmarksPage(),
      const ProfilePage(),
      SettingsPage(
        toggleTheme: _toggleTheme,
        isDarkTheme: _isDarkTheme,
      ),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), 
      darkTheme: ThemeData.dark(), 
      themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,

      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _currentIndex,
            backgroundColor: _isDarkTheme ? Colors.black : Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: _isDarkTheme ? Colors.white70 : Colors.black54,
            onTap: _onTabTapped,
            items: const [
              BottomNavigationBarItem(
                label: '',
                icon: HeroIcon(HeroIcons.home),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: HeroIcon(HeroIcons.bookmarkSquare),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: HeroIcon(HeroIcons.adjustmentsVertical),
              ),
              BottomNavigationBarItem(
                label: '',
                icon: HeroIcon(HeroIcons.user),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
