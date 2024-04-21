import 'package:flutter/material.dart';
import 'main.dart';
import 'metronome.dart';
import 'Songs/ko3godown.dart';

class PracticeMenu extends StatefulWidget {
  const PracticeMenu({super.key, required this.title});

  final String title;


  @override
  State<PracticeMenu> createState() => _PracticeMenuState();
}

class _PracticeMenuState extends State<PracticeMenu> {
  void _toMetronome() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
        const Metronome(title: 'Metronome')),
      );
    });
  }

  void _toKO3GoDown() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>
        const KO3GoDown(title: 'KO3 - Go Down')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Practice',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold
            )),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _toMetronome,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text(
                'Metronome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 1,
                  fontFamily: 'Inter',
                  color: Colors.black87,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'DANCERUSH STARDOM Playlist',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
            ),// Add some space between text and buttons
            const SizedBox(height: 10), // Add some space between buttons
            ElevatedButton(
              onPressed: _toKO3GoDown,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              ),
              child: const Text(
                'Go Down - KO3',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 0,
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
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              ),
              child: const Text(
                'N/A',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 5,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Other',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              ),
              child: const Text(
                'N/A',
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
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              ),
              child: const Text(
                'N/A',
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