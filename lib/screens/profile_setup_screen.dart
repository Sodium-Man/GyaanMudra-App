import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_app/screens/home_screen.dart';

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
      lastDate: DateTime.now(), // Fixed: Added missing parenthesis
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
      appBar: AppBar(title: const Text("Profile Setup")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Enter name" : null,
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                controller: dobController,
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true,
                validator: (value) => value!.isEmpty ? "Select DOB" : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) => value!.contains("@") ? null : "Enter valid email",
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
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
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}