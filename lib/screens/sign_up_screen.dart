// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:image_picker/image_picker.dart';
// // import '../services/auth_service.dart';
// // import '../theme/app_theme.dart';
// // import 'package:intl/intl.dart';

// // class SignUpScreen extends StatefulWidget {
// //   const SignUpScreen({super.key});

// //   @override
// //   _SignUpScreenState createState() => _SignUpScreenState();
// // }

// // class _SignUpScreenState extends State<SignUpScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   String _name = '';
// //   String _email = '';
// //   String _password = '';
// //   DateTime? _dob;
// //   File? _image;
// //   bool _loading = false;
// //   String? _error;

// //   Future<void> _pickImage() async {
// //     final picker = ImagePicker();
// //     final picked = await picker.pickImage(source: ImageSource.gallery);
// //     if (picked != null) {
// //       setState(() {
// //         _image = File(picked.path);
// //       });
// //     }
// //   }

// //   Future<void> _pickDate() async {
// //     final picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime(2000),
// //       firstDate: DateTime(1950),
// //       lastDate: DateTime.now(),
// //     );
// //     if (picked != null) setState(() => _dob = picked);
// //   }

// //   void _submit() async {
// //     if (!_formKey.currentState!.validate() || _image == null || _dob == null)
// //       return;
// //     _formKey.currentState!.save();
// //     setState(() {
// //       _loading = true;
// //       _error = null;
// //     });
// //     try {
// //       await AuthService().signUp(
// //         name: _name.trim(),
// //         dob: _dob!,
// //         email: _email.trim(),
// //         password: _password,
// //         profileImage: _image!,
// //       );
// //       Navigator.pop(context);
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
// //                   Text('Sign Up',
// //                       style: GoogleFonts.poppins(
// //                           fontSize: 28, fontWeight: FontWeight.w600)),
// //                   const SizedBox(height: 20),
// //                   GestureDetector(
// //                     onTap: _pickImage,
// //                     child: CircleAvatar(
// //                       radius: 50,
// //                       backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
// //                       backgroundImage:
// //                           _image != null ? FileImage(_image!) : null,
// //                       child: _image == null
// //                           ? Icon(Icons.add_a_photo,
// //                               size: 35, color: AppTheme.primaryColor)
// //                           : null,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 10),
// //                   Text('Add Profile Photo',
// //                       style: GoogleFonts.poppins(color: AppTheme.primaryColor)),
// //                   const SizedBox(height: 20),
// //                   TextFormField(
// //                     decoration: InputDecoration(
// //                       labelText: 'Full Name',
// //                       prefixIcon:
// //                           Icon(Icons.person, color: AppTheme.primaryColor),
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(12)),
// //                     ),
// //                     validator: (v) => v!.isEmpty ? 'Enter name' : null,
// //                     onSaved: (v) => _name = v!,
// //                   ),
// //                   const SizedBox(height: 20),
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
// //                     validator: (v) => v!.length < 6 ? 'Min 6 characters' : null,
// //                     onSaved: (v) => _password = v!,
// //                   ),
// //                   const SizedBox(height: 20),
// //                   TextFormField(
// //                     readOnly: true,
// //                     decoration: InputDecoration(
// //                       labelText: 'Date of Birth',
// //                       prefixIcon: Icon(Icons.calendar_today,
// //                           color: AppTheme.primaryColor),
// //                       border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(12)),
// //                     ),
// //                     controller: TextEditingController(
// //                         text: _dob != null
// //                             ? DateFormat('dd-MM-yyyy').format(_dob!)
// //                             : ''),
// //                     onTap: _pickDate,
// //                     validator: (_) => _dob == null ? 'Select DOB' : null,
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
// //                           : Text('Sign Up',
// //                               style: GoogleFonts.poppins(fontSize: 16)),
// //                     ),
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

// lib/screens/sign_up_screen.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../services/auth_service.dart';
import '../theme/app_theme.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();

  String _name = '';
  String _email = '';
  String _password = '';
  DateTime? _dob;
  File? _image;

  bool _loading = false;
  String? _error;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dob = picked;
        _dobController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _image == null || _dob == null)
      return;
    _formKey.currentState!.save();
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await AuthService().signUp(
        name: _name.trim(),
        dob: _dob!,
        email: _email.trim(),
        password: _password,
        profileImage: _image!,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInScreen()),
      );
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _dobController.dispose();
    super.dispose();
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
                  Text('Sign Up',
                      style: GoogleFonts.poppins(
                          fontSize: 28, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                      backgroundImage:
                          _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? Icon(Icons.add_a_photo,
                              size: 35, color: AppTheme.primaryColor)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('Add Profile Photo',
                      style: GoogleFonts.poppins(color: AppTheme.primaryColor)),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon:
                          Icon(Icons.person, color: AppTheme.primaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    validator: (v) => v!.trim().isEmpty ? 'Enter name' : null,
                    onSaved: (v) => _name = v!.trim(),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon:
                          Icon(Icons.email, color: AppTheme.primaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (v) => v!.trim().isEmpty ? 'Enter email' : null,
                    onSaved: (v) => _email = v!.trim(),
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
                    validator: (v) =>
                        v != null && v.length < 6 ? 'Min 6 characters' : null,
                    onSaved: (v) => _password = v!,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Date of Birth',
                      prefixIcon: Icon(Icons.calendar_today,
                          color: AppTheme.primaryColor),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onTap: _pickDate,
                    validator: (_) => _dob == null ? 'Select DOB' : null,
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
                          : Text('Sign Up',
                              style: GoogleFonts.poppins(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInScreen()),
                      );
                    },
                    child: Text('Already have an account? Sign In',
                        style: GoogleFonts.poppins()),
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
