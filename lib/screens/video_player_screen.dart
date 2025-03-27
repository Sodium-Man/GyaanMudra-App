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
  bool _showControls = false;
  bool _videoEnded = false;
  bool _initialized = false;

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
          _showControls = false;
          _updateChewieController();
        });
      }
    } else {
      if (_videoEnded) {
        setState(() {
          _videoEnded = false;
          _showControls = false;
          _updateChewieController();
        });
      }
    }
  }

  void _updateChewieController() {
    _chewieController?.dispose();
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: !_videoEnded,
      looping: false,
      showControls: _showControls,
      customControls: _showControls ? null : const SizedBox.shrink(),
      allowPlaybackSpeedChanging: false,
      allowMuting: false,
      allowFullScreen: false,
    );
  }

  void _replayVideo() {
    if (!mounted) return;

    setState(() {
      _videoEnded = false;
      _showControls = false;
      _controller.seekTo(Duration.zero);
      _controller.play();
      _updateChewieController();
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (_initialized && _chewieController != null)
            Chewie(controller: _chewieController!),
          if (_videoEnded)
            Container(
              color: Colors.black.withOpacity(0.7),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay,
                          size: 50, color: Colors.white),
                      onPressed: _replayVideo,
                    ),
                    const SizedBox(height: 10),
                    const Text('Tap to replay',
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
