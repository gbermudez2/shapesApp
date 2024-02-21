import 'package:flutter/material.dart';

class RunningMan extends StatefulWidget {
  const RunningMan({super.key, required this.title});

  final String title;

  @override
  State<RunningMan> createState() => _RunningManState();
}


class _RunningManState extends State<RunningMan> {
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
        title: const Text('Running Man',
            style: TextStyle(
                fontSize: 30,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold
            )),
      ),
      body: Center(
        child: Container(
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