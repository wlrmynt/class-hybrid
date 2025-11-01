import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/mandiri_screen.dart';
import 'screens/class_screen.dart';
import 'theme.dart';
import 'pages/materi_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/detail_materi_page.dart';

void main() {
  runApp(const LMSApp());
}

class LMSApp extends StatefulWidget {
  const LMSApp({super.key});

  @override
  State<LMSApp> createState() => _LMSAppState();
}

class _LMSAppState extends State<LMSApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    MandiriScreen(),
    ClassScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Hybrid',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: 'Mandiri',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Class'),
          ],
        ),
      ),
    );
  }
}
