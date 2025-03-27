import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  final String videoTitle;
  const VideoPlayerScreen({
    super.key,
    required this.videoPath,
    required this.videoTitle,
  });

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;
  bool _videoEnded = false;
  bool _initialized = false;
  double _playbackSpeed = 1.0;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.asset(widget.videoPath);
    await _controller.initialize();

    _controller.addListener(_videoListener);

    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: false,
        showControls: false,
        customControls: const SizedBox.shrink(),
        allowPlaybackSpeedChanging: true,
      );
      _initialized = true;
    });
  }

  void _videoListener() {
    if (!mounted) return;

    if (_controller.value.position >= _controller.value.duration) {
      if (!_videoEnded) {
        setState(() {
          _videoEnded = true;
        });
      }
    } else {
      if (_videoEnded) {
        setState(() {
          _videoEnded = false;
        });
      }
    }
  }

  void _replayVideo() {
    if (!mounted) return;
    setState(() {
      _videoEnded = false;
      _controller.seekTo(Duration.zero);
      _controller.play();
    });
  }

  void _changePlaybackSpeed(double speed) {
    setState(() {
      _playbackSpeed = speed;
      _controller.setPlaybackSpeed(speed);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.videoTitle)),
      body: GestureDetector(
        onTap: _videoEnded ? _replayVideo : () {}, // Handle tap for replay
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (_initialized && _chewieController != null)
              Chewie(controller: _chewieController!),

            // Playback Speed Controls
            if (!_videoEnded)
              Positioned(
                bottom: 20,
                right: 20,
                child: PopupMenuButton<double>(
                  icon: const Icon(Icons.speed, color: Colors.white),
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 0.5, child: Text('0.5x')),
                    const PopupMenuItem(value: 1.0, child: Text('1.0x')),
                    const PopupMenuItem(value: 1.5, child: Text('1.5x')),
                    const PopupMenuItem(value: 2.0, child: Text('2.0x')),
                  ],
                  onSelected: _changePlaybackSpeed,
                ),
              ),

            // Replay Overlay (No dimming)
            if (_videoEnded)
              Container(
                color: Colors.transparent, // No dimming
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.replay, size: 50, color: Colors.white),
                      const SizedBox(height: 10),
                      const Text('Tap anywhere to replay',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
