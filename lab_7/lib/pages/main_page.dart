import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:lab_7/pages/language_page.dart';
import 'package:lab_7/pages/user_info_page.dart';



class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    SimpleRegistrationPage(),
    LanguagePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: tr('register'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: tr('language'),
          ),
        ],
      ),
    );
  }
}