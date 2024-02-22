import 'package:flutter/material.dart';
import 'main.dart';
import 'skill_tree.dart';

class PracticeMenu extends StatefulWidget {
  const PracticeMenu({super.key, required this.title});

  final String title;


  @override
  State<PracticeMenu> createState() => _PracticeMenuState();
}

class _PracticeMenuState extends State<PracticeMenu> {
  void _toSkillTree() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
        const PracticeMenu(title: 'Practice Menu')),
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
                  'Practice',
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
                onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: const Text(
                'Song 1',
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: const Text(
                'Song 2',
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: const Text(
                'Song 3',
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: const Text(
                'Song 4',
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
              child: const Text(
                'Song 5',
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