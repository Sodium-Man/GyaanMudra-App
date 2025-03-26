// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   final String videoPath;
//   const VideoPlayerScreen({super.key, required this.videoPath});

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   ChewieController? _chewieController;
//   bool _isLoading = true;
//   bool _hasError = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideo();
//   }

//   Future<void> _initializeVideo() async {
//     try {
//       _controller = VideoPlayerController.asset(widget.videoPath);
//       await _controller.initialize();

//       setState(() {
//         _chewieController = ChewieController(
//           videoPlayerController: _controller,
//           autoPlay: true,
//           looping: false,
//           errorBuilder: (context, errorMessage) {
//             return Center(
//                 child: Text(
//               'Error loading video: $errorMessage',
//               style: const TextStyle(color: Colors.white),
//             ));
//           },
//         );
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _hasError = true;
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Video Player")),
//       body: _buildVideoPlayer(),
//     );
//   }

//   Widget _buildVideoPlayer() {
//     if (_isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     if (_hasError || _chewieController == null) {
//       return const Center(child: Text("Failed to load video"));
//     }
//     return Chewie(controller: _chewieController!);
//   }
// }

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  final String videoTitle; // New parameter

  const VideoPlayerScreen({
    super.key,
    required this.videoPath,
    required this.videoTitle, // Added title
  });

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  ChewieController? _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.asset(widget.videoPath);
    await _controller.initialize();

    setState(() {
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: false,
      );
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoTitle), // Dynamic title
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Chewie(controller: _chewieController!),
    );
  }
}
