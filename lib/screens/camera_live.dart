import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CameraLive extends StatefulWidget {
  const CameraLive({super.key});

  @override
  State<CameraLive> createState() => _CameraLiveState();
}

class _CameraLiveState extends State<CameraLive> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the video ID
    _controller = YoutubePlayerController(
      initialVideoId: 'BeTYTJ49NBY', // Replace with your valid YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Player'),
        backgroundColor: Colors.blue[700],
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: () {
              print('Player is ready!');
            },
            onEnded: (metaData) {
              print('Video has ended!');
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
