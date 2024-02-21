import 'package:flutter/material.dart';
import 'running_man.dart';

class SkillTree extends StatefulWidget {
  const SkillTree({super.key, required this.title});

  final String title;

  @override
  State<SkillTree> createState() => _SkillTreeState();
}

class _SkillTreeState extends State<SkillTree> {
  void _toRunningMan() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RunningMan(title: 'Main Menu')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Skill Tree',
        style: TextStyle(
          fontSize: 30,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold
        )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _toRunningMan,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(50),
                backgroundColor: Colors.blue
              ),
              child: const Text(
                'Running Man',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter',
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Handle Skill 2 button press
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(30),
                    backgroundColor: Colors.redAccent
                  ),
                  child: const Text(
                    'LOCKED',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Skill 3 button press
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(30),
                    backgroundColor: Colors.redAccent
                  ),
                  child: const Text(
                    'LOCKED',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle Skill 4 button press
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(50),
                backgroundColor: Colors.redAccent
              ),
              child: const Text(
                'LOCKED',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Colors.redAccent
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}