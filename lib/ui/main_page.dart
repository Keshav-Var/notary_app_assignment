import 'package:flutter/material.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text('Activity')),
    Center(child: Text('Workout')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() => _currentIndex = index);
          },

          /// 🔑 KEY CONFIG
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,

          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade400,
          backgroundColor: Colors.white,
          elevation: 8,

          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home_outlined, size: 26),
              activeIcon: Icon(Icons.home, size: 26),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.show_chart_outlined, size: 26), // wave-like icon
              activeIcon: Icon(Icons.show_chart, size: 26),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.local_fire_department_outlined, size: 26),
              activeIcon: Icon(Icons.local_fire_department, size: 26),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.person_outline, size: 26),
              activeIcon: Icon(Icons.person, size: 26),
            ),
          ],
        ),
      ),
    );
  }
}
