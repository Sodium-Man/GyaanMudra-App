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


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/models/video_model.dart';
import 'package:my_app/screens/video_player_screen.dart';

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
    // Load JSON file from assets
    final String jsonString = await rootBundle.loadString('assets/videos.json');
    final Map<String, dynamic> jsonData = jsonDecode(jsonString);

    // Get videos for the selected section
    final List<dynamic> videoList = jsonData[widget.section] ?? [];
    return videoList.map((video) => Video.fromJson(video)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.section} Videos")),
      body: FutureBuilder<List<Video>>(
        future: _videosFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No videos found"));
          } else {
            final videos = snapshot.data!;
            return ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.video_library, color: Colors.blue),
                    title: Text(video.name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(videoPath: video.path),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}