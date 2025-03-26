// import 'package:flutter/material.dart';
// import 'package:my_app/models/video_model.dart';
// import 'package:my_app/screens/video_player_screen.dart';

// class VideoListScreen extends StatelessWidget {
//   final String section;
//   VideoListScreen({super.key, required this.section});

//   final Map<String, List<Video>> videoData = {
//     "Alphabets": [
//       Video(name: "A", path: "assets/videos/A.mp4"),
//       Video(name: "B", path: "assets/videos/B.mp4"),
//     ],
//     "Words": [
//       Video(name: "Apple", path: "assets/videos/Apple.mp4"),
//       Video(name: "Ball", path: "assets/videos/Ball.mp4"),
//     ],
//     "Sentence Formation": [
//       Video(name: "I am happy", path: "assets/videos/I_am_happy.mp4"),
//       Video(name: "This is a book", path: "assets/videos/This_is_a_book.mp4"),
//     ],
//     "Numbers": [
//       Video(name: "1", path: "assets/videos/1.mp4"),
//       Video(name: "2", path: "assets/videos/2.mp4"),
//     ],
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("$section Videos")),
//       body: ListView.builder(
//         itemCount: videoData[section]!.length,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: const EdgeInsets.all(8),
//             child: ListTile(
//               leading: const Icon(Icons.video_library, color: Colors.blue),
//               title: Text(videoData[section]![index].name),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => VideoPlayerScreen(videoPath: videoData[section]![index].path),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_app/models/video_model.dart';
// import 'package:my_app/screens/video_player_screen.dart';
// import '../theme/app_theme.dart';

// class VideoListScreen extends StatefulWidget {
//   final String section;
//   const VideoListScreen({super.key, required this.section});

//   @override
//   _VideoListScreenState createState() => _VideoListScreenState();
// }

// class _VideoListScreenState extends State<VideoListScreen> {
//   late Future<List<Video>> _videosFuture;

//   @override
//   void initState() {
//     super.initState();
//     _videosFuture = _loadVideos();
//   }

//   Future<List<Video>> _loadVideos() async {
//     final String jsonString = await rootBundle.loadString('assets/videos.json');
//     final Map<String, dynamic> jsonData = jsonDecode(jsonString);
//     final List<dynamic> videoList = jsonData[widget.section] ?? [];
//     return videoList.map((video) => Video.fromJson(video)).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.section} Videos", style: GoogleFonts.poppins()),
//       ),
//       body: FutureBuilder<List<Video>>(
//         future: _videosFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//                 child: CircularProgressIndicator(color: AppTheme.primaryColor));
//           }
//           if (snapshot.hasError) {
//             return Center(
//                 child:
//                     Text("Error loading videos", style: GoogleFonts.poppins()));
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(
//                 child:
//                     Text("No videos available", style: GoogleFonts.poppins()));
//           }

//           final videos = snapshot.data!;
//           return GridView.builder(
//             padding: const EdgeInsets.all(16),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               childAspectRatio: 0.8,
//             ),
//             itemCount: videos.length,
//             itemBuilder: (context, index) {
//               final video = videos[index];
//               return _buildVideoCard(context, video);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildVideoCard(BuildContext context, Video video) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: () => _playVideo(context, video.path),
//         child: Stack(
//           children: [
//             Positioned.fill(
//               child: Image.asset(
//                 'assets/thumbnails/${video.thumbnail}',
//                 fit: BoxFit.cover,
//                 errorBuilder: (_, __, ___) =>
//                     Container(color: AppTheme.primaryColor.withOpacity(0.1)),
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               left: 0,
//               right: 0,
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                   ),
//                 ),
//                 child: Text(
//                   video.name,
//                   style: GoogleFonts.poppins(
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600),
//                   maxLines: 2,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _playVideo(BuildContext context, String path) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => VideoPlayerScreen(videoPath: path),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/video_model.dart';
import 'package:my_app/screens/video_player_screen.dart';
import '../theme/app_theme.dart';

class VideoListScreen extends StatefulWidget {
  final String section;
  const VideoListScreen({super.key, required this.section});

  @override
  _VideoListScreenState createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  late Future<List<Video>> _videosFuture;

  @override
  void initState() {
    super.initState();
    _videosFuture = _loadVideos();
  }

  Future<List<Video>> _loadVideos() async {
    final String jsonString = await rootBundle.loadString('assets/videos.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);
    final List<dynamic> videoList = jsonData[widget.section] ?? [];
    return videoList.map((video) => Video.fromJson(video)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.section} Videos", style: GoogleFonts.poppins()),
      ),
      body: FutureBuilder<List<Video>>(
        future: _videosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(color: AppTheme.primaryColor));
          }
          if (snapshot.hasError) {
            return Center(
                child:
                    Text("Error loading videos", style: GoogleFonts.poppins()));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child:
                    Text("No videos available", style: GoogleFonts.poppins()));
          }

          final videos = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return _buildVideoCard(context, video);
            },
          );
        },
      ),
    );
  }

  Widget _buildVideoCard(BuildContext context, Video video) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(Icons.play_arrow, color: AppTheme.primaryColor),
        ),
        title: Text(video.name,
            style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
        subtitle: Text("Tap to play", style: GoogleFonts.poppins(fontSize: 12)),
        onTap: () => _playVideo(context, video.path),
      ),
    );
  }

  void _playVideo(BuildContext context, String path) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoPlayerScreen(videoPath: path),
      ),
    );
  }
}
