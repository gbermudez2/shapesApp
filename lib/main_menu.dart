import 'package:flutter/material.dart';
import 'main.dart';
import 'skill_tree.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key, required this.title});

  final String title;


  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  void _toSkillTree() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
        const SkillTree(title: 'Main Menu')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 80),
                child: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40), // Add some space between text and buttons
            ElevatedButton(
              onPressed: _toSkillTree,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
              ),
              child: const Text(
                'Skill Tree',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 5,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              onPressed: _toSkillTree,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: const Text(
                'Practice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 5,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}