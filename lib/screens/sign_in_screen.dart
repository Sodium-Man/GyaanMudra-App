// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:my_app/screens/sign_up_screen.dart';
// // import '../services/auth_service.dart';
// // import '../theme/app_theme.dart';

// // class SignInScreen extends StatefulWidget {
// //   const SignInScreen({super.key});

// //   @override
// //   _SignInScreenState createState() => _SignInScreenState();
// // }

// // class _SignInScreenState extends State<SignInScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   String _email = '';
// //   String _password = '';
// //   bool _loading = false;
// //   String? _error;

// //   void _submit() async {
// //     if (!_formKey.currentState!.validate()) return;
// //     _formKey.currentState!.save();
// //     setState(() {
// //       _loading = true;
// //       _error = null;
// //     });
// //     try {
// //       await AuthService().signIn(_email.trim(), _password);
// //     } catch (e) {
// //       setState(() {
// //         _error = e.toString();
// //         _loading = false;
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Padding(
// //         padding: const EdgeInsets.all(24),
// //         child: Center(
// //           child: SingleChildScrollView(
// //             child: Form(
// //               key: _formKey,
// //               child: Column(
// //                 children: [
// //                   Text('Sign In',
// //                       style: GoogleFonts.poppins(
// //                           fontSize: 28, fontWeight: FontWeight.w600)),
// //                   const SizedBox(height: 40),
// //                   TextFormField(
// //                     decoration: InputDecoration(
// //                       labelText: 'Email',
// //                       prefixIcon:
// //                           Icon(Icons.email, color: AppTheme.primaryColor),
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(12)),
// //                     ),
// //                     keyboardType: TextInputType.emailAddress,
// //                     validator: (v) => v!.isEmpty ? 'Enter email' : null,
// //                     onSaved: (v) => _email = v!,
// //                   ),
// //                   const SizedBox(height: 20),
// //                   TextFormField(
// //                     decoration: InputDecoration(
// //                       labelText: 'Password',
// //                       prefixIcon:
// //                           Icon(Icons.lock, color: AppTheme.primaryColor),
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(12)),
// //                     ),
// //                     obscureText: true,
// //                     validator: (v) => v!.isEmpty ? 'Enter password' : null,
// //                     onSaved: (v) => _password = v!,
// //                   ),
// //                   if (_error != null) ...[
// //                     const SizedBox(height: 10),
// //                     Text(_error!, style: TextStyle(color: Colors.red)),
// //                   ],
// //                   const SizedBox(height: 30),
// //                   SizedBox(
// //                     width: double.infinity,
// //                     child: ElevatedButton(
// //                       onPressed: _loading ? null : _submit,
// //                       child: _loading
// //                           ? const CircularProgressIndicator(color: Colors.white)
// //                           : Text('Sign In',
// //                               style: GoogleFonts.poppins(fontSize: 16)),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   TextButton(
// //                     onPressed: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(builder: (_) => const SignUpScreen()),
// //                       );
// //                     },
// //                     child:
// //                         Text('New user? Sign Up', style: GoogleFonts.poppins()),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// lib/screens/sign_in_screen.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';
import 'sign_up_screen.dart';
import 'home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _loading = false;
  String? _error;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final cred = await AuthService().signIn(_email.trim(), _password);
      final profile = await AuthService().getProfile(cred.user!.uid);
      final name = profile.data()?['name'] as String? ?? '';
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen(name: name)),
      );
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                        fontSize: 28, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon:
                          Icon(Icons.email, color: AppTheme.primaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => v!.isEmpty ? 'Enter email' : null,
                    onSaved: (v) => _email = v!,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon:
                          Icon(Icons.lock, color: AppTheme.primaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    obscureText: true,
                    validator: (v) => v!.isEmpty ? 'Enter password' : null,
                    onSaved: (v) => _password = v!,
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: 10),
                    Text(_error!, style: const TextStyle(color: Colors.red)),
                  ],
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _loading ? null : _submit,
                      child: _loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text('Sign In',
                              style: GoogleFonts.poppins(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUpScreen()),
                      );
                    },
                    child:
                        Text('New user? Sign Up', style: GoogleFonts.poppins()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
