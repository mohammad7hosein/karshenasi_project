import 'package:flutter/material.dart';
import 'package:karshenasi_project/screen/schedule_screen.dart';
import 'package:karshenasi_project/screen/table_screen.dart';

class BottomNavBar extends StatefulWidget {
  static String route = '/bottom_nav_bar';
  int selectedIndex;

  BottomNavBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final pages = const [
    ScheduleScreen(),
    TableScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -1),
              color: Colors.grey,
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.edit_calendar_rounded,
                  color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
                ),
                label: "ثبت درس"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.event_note_rounded,
                  color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
                ),
                label: "برنامه"),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
