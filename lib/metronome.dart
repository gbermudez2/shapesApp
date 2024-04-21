import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Metronome extends StatefulWidget {
  const Metronome({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Metronome> createState() => _MetronomeState();
}

class _MetronomeState extends State<Metronome> {
  bool _isPlaying = false;
  double _tempo = 120.0; // Initial tempo (beats per minute)
  late Timer _timer;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  void _initAudioPlayer() async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setAsset('assets/sounds/tick.mp3');
    _audioPlayer.setLoopMode(LoopMode.one);
    _audioPlayer.setVolume(1.0); // Set the volume to maximum (1.0)
  }

  void _startMetronome() {
    const int millisecondsPerMinute = 60000;
    double playbackSpeed = _tempo / 73; // Calculate playback speed based on tempo

    _timer = Timer.periodic(Duration(milliseconds: millisecondsPerMinute ~/ _tempo), (Timer timer) {
      if (!_isPlaying) {
        timer.cancel();
      }
      _audioPlayer.setSpeed(playbackSpeed);
      _audioPlayer.play();
    });
    setState(() {
      _isPlaying = true;
    });
  }

  void _stopMetronome() {
    _timer.cancel();
    _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  void _updateMetronome() {
    _timer.cancel();
    _startMetronome();
  }

  @override
  void dispose() {
    _timer.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tempo: ${_tempo.round()} BPM',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            Slider(
              value: _tempo,
              min: 50.0,
              max: 200.0,
              divisions: 200,
              label: _tempo.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _tempo = value;
                });
                _updateMetronome();
              },
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.white,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_isPlaying) {
                  _stopMetronome();
                } else {
                  _startMetronome();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                _isPlaying ? 'Stop' : 'Start',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20.0,
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
