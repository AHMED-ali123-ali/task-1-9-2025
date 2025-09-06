import 'package:flutter/material.dart';
import 'package:navation_bar/pmi/pmiw.dart';
import 'calluter/calculatorApp.dart';
import 'login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int current = 0;
  final List<Widget> screens = [
    MyScreen(),
    CalculatorApp(),
    LoginScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: screens[current],

        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: 'Calculator',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: 'Login',
            ),
          ],
          currentIndex: current,
          onTap: (int index) {
            setState(() {
              current = index;
            });
          },
        ),
      ),
    );
  }
}