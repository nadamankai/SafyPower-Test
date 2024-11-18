import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:fintech_dashboard_clone/screen/Login_Screen.dart';
import 'package:fintech_dashboard_clone/screen/profile_screen.dart';
import '../widgets/Switch_Remember.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _verificationController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agreeTerms = false;
  bool _submitted = false;

  bool get _isFormValid {
    return _formKey.currentState?.validate() == true && _agreeTerms;
  }

  String? _validateName(String? value) {
    if (!_submitted) return null;
    if (value == null ||
        value.isEmpty ||
        value.length < 3 ||
        !RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(value)) {
      return 'At least 3 letters';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (!_submitted) return null;
    if (value == null ||
        value.isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (!_submitted) return null;
    if (value == null ||
        value.length < 8 ||
        !RegExp(r'(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]')
            .hasMatch(value)) {
      return 'At least 8 characters,an uppercase letter, a number, and a symbol.';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (!_submitted) return null;
    if (value != _passwordController.text) {
      return 'Passwords do not match.';
    }
    return null;
  }

  String? _validateVerificationCode(String? value) {
    if (!_submitted) return null;
    if (value == null ||
        value.length != 4 ||
        !RegExp(r'^\d{4}$').hasMatch(value)) {
      return 'Please enter a valid 4-digit code.';
    }
    return null;
  }
   void _submitForm() async {
    if (_isFormValid) {
      try {
        final response = await http.post(
          Uri.parse('http://your-django-backend/api/v1/signup/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': _nameController.text,
            'email': _emailController.text,
            'password': _passwordController.text,
            // Add more fields as needed
          }),
        );

        if (response.statusCode == 201) {
          // Successful signup
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          );
        } else {
          // Error handling
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to sign up. Please try again.'),
            ),
          );
        }
      } catch (e) {
        // Exception handling
        print('Error: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred. Please try again later.'),
          ),
        );
      }
    } else {
      setState(() {
        _submitted = true;
      });
    }
  }

  Widget _buildFieldWithTooltip({
    required String? Function(String?) validator,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    void Function()? onSuffixIconPressed,
    bool hasError = false,
    String? errorText,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 19.36 / 16,
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              border: InputBorder.none,
              errorText: hasError ? errorText : null,
              suffixIcon: onSuffixIconPressed != null
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                        color: const Color(0xFF010483),
                      ),
                      onPressed: onSuffixIconPressed,
                    )
                  : null,
            ),
          ),
        ),
        if (hasError)
          Tooltip(
            message: errorText ?? '',
            child: IconButton(
              icon: const Icon(Icons.info, color: Colors.red),
              onPressed: () {
                // The tooltip will be shown when the icon is pressed
              },
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF72A7FE),
              Color(0xFF85BBFF),
              Color(0xFF89BFFE),
            ],
          ),
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 488,
                height: 712,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        'SIGN UP',
                        style: GoogleFonts.balooChettan2(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: const Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      const SizedBox(height: 70),
                      Container(
                        width: 340,
                        height: 50,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(223, 223, 223, 1),
                              width: 3,
                            ),
                          ),
                        ),
                        child: _buildFieldWithTooltip(
                          validator: _validateName,
                          controller: _nameController,
                          hintText: 'Type your name',
                          hasError: _submitted &&
                              _validateName(_nameController.text) != null,
                          errorText: _validateName(_nameController.text),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 340,
                        height: 50,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(223, 223, 223, 1),
                              width: 3,
                            ),
                          ),
                        ),
                        child: _buildFieldWithTooltip(
                          validator: _validateEmail,
                          controller: _emailController,
                          hintText: 'Type your email',
                          hasError: _submitted &&
                              _validateEmail(_emailController.text) != null,
                          errorText: _validateEmail(_emailController.text),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 340,
                        height: 50,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(223, 223, 223, 1),
                              width: 3,
                            ),
                          ),
                        ),
                        child: _buildFieldWithTooltip(
                          validator: _validatePassword,
                          controller: _passwordController,
                          hintText: 'Type your password',
                          obscureText: _obscurePassword,
                          onSuffixIconPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          hasError: _submitted &&
                              _validatePassword(_passwordController.text) !=
                                  null,
                          errorText:
                              _validatePassword(_passwordController.text),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 340,
                        height: 50,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(223, 223, 223, 1),
                              width: 3,
                            ),
                          ),
                        ),
                        child: _buildFieldWithTooltip(
                          validator: _validateConfirmPassword,
                          controller: _confirmPasswordController,
                          hintText: 'Confirm your password',
                          obscureText: _obscureConfirmPassword,
                          onSuffixIconPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                          hasError: _submitted &&
                              _validateConfirmPassword(
                                      _confirmPasswordController.text) !=
                                  null,
                          errorText: _validateConfirmPassword(
                              _confirmPasswordController.text),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 340,
                        height: 50,
                        margin: const EdgeInsets.only(left: 20),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color.fromRGBO(223, 223, 223, 1),
                              width: 3,
                            ),
                          ),
                        ),
                        child: _buildFieldWithTooltip(
                          validator: _validateVerificationCode,
                          controller: _verificationController,
                          hintText: 'Verification code',
                          hasError: _submitted &&
                              _validateVerificationCode(
                                      _verificationController.text) !=
                                  null,
                          errorText: _validateVerificationCode(
                              _verificationController.text),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          children: [
                            const SizedBox(width: 40),
                            CustomSwitchRemember(
                              value: _agreeTerms,
                              onChanged: (bool value) {
                                setState(() {
                                  _agreeTerms = value;
                                });
                              },
                            ),
                            const SizedBox(width: 23),
                            GestureDetector(
                              onTap: () {
                                // TODO: Navigate to terms and conditions page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        TextPage(), // Remplacer TextPage par votre page de texte
                                  ),
                                );
                              },
                              child: Text(
                                'I agree to all terms and conditions',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                  height: 19.36 / 16,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          _submitForm();
                        },
                        child: Container(
                          width: 340,
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF010483),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/logosite.png',
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sign up',
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Already have an account ? Login",
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: const Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder for the terms and conditions page
class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Center(
        child: Text('This is a placeholder for terms and conditions.'),
      ),
    );
  }
}
