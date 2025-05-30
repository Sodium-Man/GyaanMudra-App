// import 'package:flutter/material.dart';
// import 'package:my_app/screens/profile_setup_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const ProfileSetupScreen()),
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

// lib/screens/splash_screen.dart

import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'sign_up_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignUpScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/GyaanMudra.png',
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
