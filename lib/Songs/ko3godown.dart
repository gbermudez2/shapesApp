import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class KO3GoDown extends StatefulWidget {
  const KO3GoDown({super.key, required this.title});

  final String title;

  @override
  State<KO3GoDown> createState() => _KO3GoDownState();
}

class _KO3GoDownState extends State<KO3GoDown> {
  bool _isPlaying = false;
  double _playbackPosition = 0.0;
  double _playbackDuration = 0.0;
  late Timer _timer;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  void _initAudioPlayer() async {
    _audioPlayer = AudioPlayer();
    await _audioPlayer.setAsset('assets/sounds/KO3GoDown.mp3');
    _audioPlayer.setLoopMode(LoopMode.one);
    _audioPlayer.setVolume(1.0);
    _audioPlayer.positionStream.listen((position) {
      setState(() {
        _playbackPosition = position.inMilliseconds.toDouble();
      });
    });
    _audioPlayer.durationStream.listen((duration) {
      setState(() {
        _playbackDuration = duration?.inMilliseconds.toDouble() ?? 0.0;
      });
    });
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      _audioPlayer.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _stopMetronome() {
    _timer.cancel();
    _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  void _updatePlaybackPosition(double value) {
    final position = value * _playbackDuration;
    _audioPlayer.seek(Duration(milliseconds: position.toInt()));
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
              'Playback Position: ${(_playbackPosition / 1000).toStringAsFixed(2)}s / ${(_playbackDuration / 1000).toStringAsFixed(2)}s',
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            Slider(
              value: _playbackPosition / (_playbackDuration == 0 ? 1 : _playbackDuration),
              min: 0.0,
              max: 1.0,
              onChanged: (double value) {
                _updatePlaybackPosition(value);
              },
              activeColor: Colors.lightBlue,
              inactiveColor: Colors.white,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _togglePlayPause,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                _isPlaying ? 'Pause' : 'Play',
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
