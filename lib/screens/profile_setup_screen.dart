import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/home_screen.dart';
import '../theme/app_theme.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  String name = "", email = "";
  DateTime? selectedDate;
  final TextEditingController dobController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobController.text = DateFormat("dd-MM-yyyy").format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complete Your Profile",
            style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildAvatarSection(),
              const SizedBox(height: 30),
              _buildTextField("Full Name", Icons.person),
              const SizedBox(height: 20),
              _buildDateField(context),
              const SizedBox(height: 20),
              _buildTextField("Email Address", Icons.email),
              const SizedBox(height: 40),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
          child:
              Icon(Icons.add_a_photo, size: 35, color: AppTheme.primaryColor),
        ),
        const SizedBox(height: 10),
        Text("Add Profile Photo",
            style: GoogleFonts.poppins(color: AppTheme.primaryColor)),
      ],
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppTheme.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryColor),
        ),
      ),
      validator: (value) => value!.isEmpty ? "This field is required" : null,
      onSaved: (value) {
        if (label == "Full Name") name = value!;
        if (label == "Email Address") email = value!;
      },
    );
  }

  Widget _buildDateField(BuildContext context) {
    return TextFormField(
      controller: dobController,
      decoration: InputDecoration(
        labelText: "Date of Birth",
        prefixIcon: Icon(Icons.calendar_today, color: AppTheme.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
      validator: (value) => value!.isEmpty ? "Select Date of Birth" : null,
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          backgroundColor: AppTheme.primaryColor,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(name: name),
              ),
            );
          }
        },
        child: Text("Continue",
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
