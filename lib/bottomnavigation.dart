import 'package:flutter/material.dart';
import 'package:tugastpm1/calculatorpage.dart';
import 'package:tugastpm1/homepage.dart';
import 'package:tugastpm1/ganjilgenappage.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    HomePage(),
    CalculatorPage(),
    GanjilGenap(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tugas 1 TPM'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Kelompok'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate,
            ),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.numbers,
            ),
            label: 'ganjilgenap',
          )
        ],

        onTap: (index) {
          setState(
                () {
              selectedIndex = index;
            },
          );
        },
        selectedItemColor: Color.fromARGB(255, 51, 88, 107),
        unselectedItemColor: Color.fromARGB(255, 130, 141, 146),
        currentIndex: selectedIndex,
      ),
    );
  }
}