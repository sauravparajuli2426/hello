import 'package:flutter/material.dart';
import 'package:hello/screens/homescreen.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/made.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown before playing
        setState(() {});
        _controller.play();
      });
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        // Video finished playing, navigate to the next screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
        : CircularProgressIndicator(); // Loading indicator while initializing
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
