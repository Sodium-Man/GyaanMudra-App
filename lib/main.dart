// // import 'package:flutter/material.dart';
// // import 'package:camera/camera.dart';
// // import 'package:chewie/chewie.dart';
// // import 'package:video_player/video_player.dart';
// // import 'package:intl/intl.dart'; // For formatting the date

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: SplashScreen(),
// //     );
// //   }
// // }

// // // Splash Screen
// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     Future.delayed(Duration(seconds: 2), () {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => ProfileSetupScreen()),
// //       );
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.blueAccent,
// //       body: Center(
// //         child: Image.asset('assets/GyaanMudra.png', width: 150, height: 150),
// //       ),
// //     );
// //   }
// // }

// // // Profile Setup Screen
// // class ProfileSetupScreen extends StatefulWidget {
// //   const ProfileSetupScreen({super.key});

// //   @override
// //   _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
// // }

// // class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   String name = "", email = "";
// //   DateTime? selectedDate;
// //   TextEditingController dobController = TextEditingController();

// //   // Function to show Date Picker
// //   Future<void> _selectDate(BuildContext context) async {
// //     DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime(2000), // Default date
// //       firstDate: DateTime(1950), // Earliest date allowed
// //       lastDate: DateTime.now(), // Latest date allowed
// //     );

// //     if (picked != null && picked != selectedDate) {
// //       setState(() {
// //         selectedDate = picked;
// //         dobController.text = DateFormat("dd-MM-yyyy").format(picked); // Format date
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Profile Setup")),
// //       body: Padding(
// //         padding: EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: [
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: "Name"),
// //                 validator: (value) => value!.isEmpty ? "Enter name" : null,
// //                 onSaved: (value) => name = value!,
// //               ),
// //               TextFormField(
// //                 controller: dobController,
// //                 decoration: InputDecoration(
// //                   labelText: "Date of Birth",
// //                   suffixIcon: IconButton(
// //                     icon: Icon(Icons.calendar_today),
// //                     onPressed: () => _selectDate(context),
// //                   ),
// //                 ),
// //                 readOnly: true, // Prevent manual input
// //                 validator: (value) => value!.isEmpty ? "Select DOB" : null,
// //               ),
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: "Email"),
// //                 validator: (value) => value!.contains("@") ? null : "Enter valid email",
// //                 onSaved: (value) => email = value!,
// //               ),
// //               SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   if (_formKey.currentState!.validate()) {
// //                     _formKey.currentState!.save();
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) => HomeScreen(name: name),
// //                       ),
// //                     );
// //                   }
// //                 },
// //                 child: Text("Next"),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // Home Screen
// // class HomeScreen extends StatelessWidget {
// //   final String name;
// //   HomeScreen({super.key, required this.name});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Image.asset('assets/GyaanMudra.png', width: 50, height: 50),
// //             Text(name, style: TextStyle(fontSize: 18)),
// //           ],
// //         ),
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           SectionCard(title: "Alphabets", onTap: () {
// //             Navigator.push(context, MaterialPageRoute(builder: (context) => VideoListScreen()));
// //           }),
// //           SectionCard(title: "Words", onTap: () {}),
// //           SectionCard(title: "Sentence Formation", onTap: () {}),
// //           SizedBox(height: 20),
// //           Divider(thickness: 2),
// //           SizedBox(height: 20),
// //           IconButton(
// //             icon: Icon(Icons.camera_alt, size: 50, color: Colors.blue),
// //             onPressed: () async {
// //               final cameras = await availableCameras();
// //               final firstCamera = cameras.first;
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(builder: (context) => CameraScreen(camera: firstCamera)),
// //               );
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // Section Card Widget
// // class SectionCard extends StatelessWidget {
// //   final String title;
// //   final VoidCallback onTap;
// //   SectionCard({super.key, required this.title, required this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Card(
// //         elevation: 4,
// //         margin: EdgeInsets.all(10),
// //         child: Padding(
// //           padding: EdgeInsets.all(16),
// //           child: Center(
// //             child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // Video List Screen
// // class VideoListScreen extends StatelessWidget {
// //   final List<Map<String, String>> videos = [
// //     {"name": "A", "path": "assets/videos/A.mp4"},
// //     {"name": "B", "path": "assets/videos/B.mp4"},
// //     {"name": "C", "path": "assets/videos/C.mp4"},
// //     {"name": "D", "path": "assets/videos/D.mp4"}
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Alphabet Videos")),
// //       body: ListView.builder(
// //         itemCount: videos.length,
// //         itemBuilder: (context, index) {
// //           return Card(
// //             margin: EdgeInsets.all(8),
// //             child: ListTile(
// //               leading: Icon(Icons.video_library, color: Colors.blue),
// //               title: Text(videos[index]["name"]!),
// //               onTap: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (context) => VideoPlayerScreen(videoPath: videos[index]["path"]!),
// //                   ),
// //                 );
// //               },
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }

// // // Video Player Screen
// // class VideoPlayerScreen extends StatefulWidget {
// //   final String videoPath;
// //   VideoPlayerScreen({super.key, required this.videoPath});

// //   @override
// //   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// // }

// // class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
// //   late VideoPlayerController _controller;
// //   late ChewieController _chewieController;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = VideoPlayerController.asset(widget.videoPath);
// //     _controller.initialize().then((_) {
// //       setState(() {
// //         _chewieController = ChewieController(
// //           videoPlayerController: _controller,
// //           autoPlay: true,
// //           looping: false,
// //         );
// //       });
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     _chewieController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Video Player")),
// //       body: Center(
// //         child: _controller.value.isInitialized
// //             ? Chewie(controller: _chewieController)
// //             : CircularProgressIndicator(),
// //       ),
// //     );
// //   }
// // }

// // // Camera Screen
// // class CameraScreen extends StatelessWidget {
// //   final CameraDescription camera;
// //   CameraScreen({super.key, required this.camera});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Camera")),
// //       body: Center(child: Text("Camera functionality here")),
// //     );
// //   }
// // }







// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:chewie/chewie.dart';
// import 'package:video_player/video_player.dart';
// import 'package:intl/intl.dart'; // For formatting the date

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }

// // Splash Screen
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => ProfileSetupScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Center(
//         child: Image.asset('assets/GyaanMudra.png', width: 150, height: 150),
//       ),
//     );
//   }
// }

// // Profile Setup Screen
// class ProfileSetupScreen extends StatefulWidget {
//   const ProfileSetupScreen({super.key});

//   @override
//   _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
// }

// class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
//   final _formKey = GlobalKey<FormState>();
//   String name = "", email = "";
//   DateTime? selectedDate;
//   TextEditingController dobController = TextEditingController();

//   // Function to show Date Picker
//   Future<void> _selectDate(BuildContext context) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime(2000), // Default date
//       firstDate: DateTime(1950), // Earliest date allowed
//       lastDate: DateTime.now(), // Latest date allowed
//     );

//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//         dobController.text = DateFormat("dd-MM-yyyy").format(picked); // Format date
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Profile Setup")),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Name"),
//                 validator: (value) => value!.isEmpty ? "Enter name" : null,
//                 onSaved: (value) => name = value!,
//               ),
//               TextFormField(
//                 controller: dobController,
//                 decoration: InputDecoration(
//                   labelText: "Date of Birth",
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.calendar_today),
//                     onPressed: () => _selectDate(context),
//                   ),
//                 ),
//                 readOnly: true, // Prevent manual input
//                 validator: (value) => value!.isEmpty ? "Select DOB" : null,
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: "Email"),
//                 validator: (value) => value!.contains("@") ? null : "Enter valid email",
//                 onSaved: (value) => email = value!,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => HomeScreen(name: name),
//                       ),
//                     );
//                   }
//                 },
//                 child: Text("Next"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Home Screen
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
//           SectionCard(title: "Alphabets", onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => VideoListScreen(section: "Alphabets")));
//           }),
//           SectionCard(title: "Words", onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => VideoListScreen(section: "Words")));
//           }),
//           SectionCard(title: "Sentence Formation", onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => VideoListScreen(section: "Sentence Formation")));
//           }),
//           SectionCard(title: "Numbers", onTap: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => VideoListScreen(section: "Numbers")));
//           }),
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
//                 MaterialPageRoute(builder: (context) => CameraScreen(camera: firstCamera)),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// // Section Card Widget
// class SectionCard extends StatelessWidget {
//   final String title;
//   final VoidCallback onTap;
//   SectionCard({super.key, required this.title, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Card(
//         elevation: 4,
//         margin: EdgeInsets.all(10),
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Center(
//             child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Video List Screen
// class VideoListScreen extends StatelessWidget {
//   final String section;
//   VideoListScreen({super.key, required this.section});

//   final Map<String, List<Map<String, String>>> videoData = {
//     "Alphabets": [
//       {"name": "A", "path": "assets/videos/A.mp4"},
//       {"name": "B", "path": "assets/videos/B.mp4"},
//       {"name": "C", "path": "assets/videos/C.mp4"},
//       {"name": "D", "path": "assets/videos/D.mp4"}
//     ],
//     "Words": [
//       {"name": "Apple", "path": "assets/videos/Apple.mp4"},
//       {"name": "Ball", "path": "assets/videos/Ball.mp4"},
//       {"name": "Cat", "path": "assets/videos/Cat.mp4"},
//       {"name": "Dog", "path": "assets/videos/Dog.mp4"}
//     ],
//     "Sentence Formation": [
//       {"name": "I am happy", "path": "assets/videos/I_am_happy.mp4"},
//       {"name": "This is a book", "path": "assets/videos/This_is_a_book.mp4"},
//       {"name": "She is dancing", "path": "assets/videos/She_is_dancing.mp4"},
//       {"name": "We are learning", "path": "assets/videos/We_are_learning.mp4"}
//     ],
//     "Numbers": [
//       {"name": "1", "path": "assets/videos/1.mp4"},
//       {"name": "2", "path": "assets/videos/2.mp4"},
//       {"name": "3", "path": "assets/videos/3.mp4"},
//       {"name": "4", "path": "assets/videos/4.mp4"}
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
//             margin: EdgeInsets.all(8),
//             child: ListTile(
//               leading: Icon(Icons.video_library, color: Colors.blue),
//               title: Text(videoData[section]![index]["name"]!),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => VideoPlayerScreen(videoPath: videoData[section]![index]["path"]!),
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

// // Video Player Screen
// class VideoPlayerScreen extends StatefulWidget {
//   final String videoPath;
//   VideoPlayerScreen({super.key, required this.videoPath});

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController _controller;
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset(widget.videoPath);
//     _controller.initialize().then((_) {
//       setState(() {
//         _chewieController = ChewieController(
//           videoPlayerController: _controller,
//           autoPlay: true,
//           looping: false,
//         );
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Video Player")),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? Chewie(controller: _chewieController)
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }

// // Camera Screen
// class CameraScreen extends StatelessWidget {
//   final CameraDescription camera;
//   CameraScreen({super.key, required this.camera});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Camera")),
//       body: Center(child: Text("Camera functionality here")),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:my_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}