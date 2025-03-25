// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:my_app/screens/video_list_screen.dart';
// import 'package:my_app/screens/camera_screen.dart';
// import 'package:my_app/widgets/section_card.dart';

// class HomeScreen extends StatelessWidget {
//   final String name;
//   HomeScreen({super.key, required this.name});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Image.asset('assets/GyaanMudra.png', width: 50, height: 50),
//             Text(name, style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SectionCard(
//             title: "Alphabets",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => VideoListScreen(section: "Alphabets"),
//                 ),
//               );
//             },
//           ),
//           SectionCard(
//             title: "Words",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => VideoListScreen(section: "Words"),
//                 ),
//               );
//             },
//           ),
//           SectionCard(
//             title: "Sentence Formation",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => VideoListScreen(section: "Sentence Formation"),
//                 ),
//               );
//             },
//           ),
//           SectionCard(
//             title: "Numbers",
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => VideoListScreen(section: "Numbers"),
//                 ),
//               );
//             },
//           ),
//           SizedBox(height: 20),
//           Divider(thickness: 2),
//           SizedBox(height: 20),
//           IconButton(
//             icon: Icon(Icons.camera_alt, size: 50, color: Colors.blue),
//             onPressed: () async {
//               final cameras = await availableCameras();
//               final firstCamera = cameras.first;
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => CameraScreen(camera: firstCamera),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:my_app/screens/video_list_screen.dart';
import 'package:my_app/screens/camera_screen.dart';
import 'package:my_app/widgets/section_card.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/GyaanMudra.png', width: 50, height: 50),
            Text(name, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SectionCard(
            title: "Alphabets",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoListScreen(section: "Alphabets"),
                ),
              );
            },
          ),
          SectionCard(
            title: "Words",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoListScreen(section: "Words"),
                ),
              );
            },
          ),
          SectionCard(
            title: "Sentence Formation",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoListScreen(section: "Sentence Formation"),
                ),
              );
            },
          ),
          SectionCard(
            title: "Numbers",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoListScreen(section: "Numbers"),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          const Divider(thickness: 2),
          const SizedBox(height: 20),
          IconButton(
            icon: const Icon(Icons.camera_alt, size: 50, color: Colors.blue),
            onPressed: () async {
              final cameras = await availableCameras();
              final firstCamera = cameras.first;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraScreen(camera: firstCamera),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}