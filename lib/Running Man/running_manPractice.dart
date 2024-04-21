import 'package:flutter/material.dart';
import 'package:shapes/Running%20Man/running_man.dart';

class RunningManPractice extends StatefulWidget {
  const RunningManPractice({super.key, required this.title});

  final String title;

  @override
  State<RunningManPractice> createState() => _RunningManPracticeState();
}


class _RunningManPracticeState extends State<RunningManPractice> {
  void _toRunningMan() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RunningMan(title: 'RunningManPractice')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: const Text('Running Man',
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
            const Text(
                'Follow the tempo.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
            ),
            const SizedBox(height: 40.0),
            Container(
              width: 300.0, // adjust width as needed
              height: 450.0, // adjust height as needed
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(25)
              ),
              child: const Center(
                child: Text(
                  'Video tutorial goes here.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ]
        )


      ),

      floatingActionButton: ElevatedButton(
        onPressed: _toRunningMan,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: Text('NEXT',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
                fontSize: 20,
                letterSpacing: 10,
                color: Colors.black87),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}