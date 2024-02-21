import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.title});

  final String title;


  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black87,
      body: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 15, top: 80),
          child: Text(
            'Home',
            style: TextStyle(fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Inter'),
          ),
        ),
      ),
    );
  }
}