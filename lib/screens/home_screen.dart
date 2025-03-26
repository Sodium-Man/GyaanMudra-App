import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:my_app/screens/video_list_screen.dart';
import 'package:my_app/screens/camera_screen.dart';
import 'package:my_app/widgets/section_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  const HomeScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/GyaanMudra.png', width: 40, height: 40),
            const SizedBox(width: 15),
            Text(
              'Welcome, $name',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildSectionCard(context, "Alphabets", Icons.abc),
          _buildSectionCard(context, "Words", Icons.text_format),
          _buildSectionCard(context, "Sentence Formation", Icons.article),
          _buildSectionCard(context, "Numbers", Icons.numbers),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.accentColor,
        child: const Icon(Icons.camera_alt, size: 30),
        onPressed: () async {
          final cameras = await availableCameras();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CameraScreen(camera: cameras.first),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, String title, IconData icon) {
    return SectionCard(
      title: title,
      icon: icon,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoListScreen(section: title),
          ),
        );
      },
    );
  }
}
