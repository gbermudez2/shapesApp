import 'package:flutter/material.dart';
import 'main_menu.dart';
import 'skill_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightBlueAccent,
        ),
        primaryColorDark: Colors.black,
        useMaterial3: true
      ),
      home: const MyHomePage(title: 'Shapes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _toMainMenu() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainMenu(title: 'Main Menu')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black87,
      body: const Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
            'Shapes',
              style: TextStyle(fontSize: 70, color: Colors.white,
              fontWeight: FontWeight.bold,
                  letterSpacing: -2,
                  fontFamily: 'Inter'),
            ),
            Text(
              'Learn to dance.',
              style: TextStyle(fontSize: 20, color: Colors.white,
              letterSpacing: 6,
                  fontFamily: 'Inter'),
            ),
          ],
        ),
      ),


      floatingActionButton: ElevatedButton(
        onPressed: _toMainMenu,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Text('BEGIN',
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 10,
                color: Colors.black87),),
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}