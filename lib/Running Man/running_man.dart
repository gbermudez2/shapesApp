import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:shapes/Running%20Man/running_manPractice.dart';

class RunningMan extends StatefulWidget {
  const RunningMan({super.key, required this.title});

  final String title;

  @override
  State<RunningMan> createState() => _RunningManState();
}


class _RunningManState extends State<RunningMan> {
  late VideoPlayerController _videoPlayerController;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  _initializeVideoPlayer() {
    _videoPlayerController = VideoPlayerController.asset('assets/running_man.mp4')
      ..initialize().then((_) {
        setState(() {
          _duration = _videoPlayerController.value.duration;
        });
      })
      ..setLooping(true)
      ..play()
      ..addListener(() {
        if (_videoPlayerController.value.hasError) {
          print('VideoPlayer Error: ${_videoPlayerController.value.errorDescription}');
        }
        setState(() {
          _isPlaying = _videoPlayerController.value.isPlaying;
          _position = _videoPlayerController.value.position;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  void _toRunningManPractice() {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RunningManPractice(title: 'RunningManPractice')),
      );
    });
  }

  void _seekToSecond(double second) {
    Duration newDuration = Duration(seconds: second.toInt());
    _videoPlayerController.seekTo(newDuration);
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
          children: [
            Container(
              width: 300.0,
              height: 450.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: _videoPlayerController.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_videoPlayerController),
                    Container(
                      height: 50,
                      child: Slider(
                        value: _position.inSeconds.toDouble(),
                        max: _duration.inSeconds.toDouble(),
                        onChanged: (value) {
                          _seekToSecond(value);
                        },
                        activeColor: Colors.red,
                        inactiveColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
                  : CircularProgressIndicator(),
            ),
          ],
        ),
      ),

      floatingActionButton: ElevatedButton(
        onPressed: _toRunningManPractice,
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