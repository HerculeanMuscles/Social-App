import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sistconnect/page/profile.dart';
import 'package:sistconnect/page/tutor_page.dart';

import 'event_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final screens = [
    const EventPage(),
    const TutorPage(),
    const ProfileUser(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.black,
          selectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
          unselectedItemColor: const Color.fromRGBO(255, 255, 255, 69),
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() => _currentIndex = value);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Event',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline_rounded),
              label: 'Tutoring',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
      );
}
