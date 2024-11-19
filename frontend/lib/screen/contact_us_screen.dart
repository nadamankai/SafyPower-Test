import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fintech_dashboard_clone/layout/app_layout.dart';
import 'package:fintech_dashboard_clone/layout/top_app_bar.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const TopAppBar(title: 'Contact us'),
                const SizedBox(height: 20),

                // Contact Form Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey, // Assign the form key
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),

                        // Name Field
                        _buildTextField(
                          controller: _nameController,
                          label: 'Your Name',
                          hintText: 'Enter your full name',
                        ),
                        const SizedBox(height: 20),

                        // Email Field
                        _buildTextField(
                          controller: _emailController,
                          label: 'Your Email',
                          hintText: 'Enter your email address',
                        ),
                        const SizedBox(height: 20),

                        // Message Field
                        _buildTextField(
                          controller: _messageController,
                          label: 'Your Message',
                          hintText: 'What can we help you with?',
                          maxLines: 5,
                        ),
                        const SizedBox(height: 30),

                        // Submit Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _showConfirmationDialog(context);
                              _clearForm(); // Clear the form fields
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Send Message',
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.blueAccent),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Message Sent"),
        content: const Text("Thank you for reaching out to us. We'll get back to you shortly."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
  }
}
