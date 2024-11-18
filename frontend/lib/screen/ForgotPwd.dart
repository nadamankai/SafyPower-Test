import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgotpwd extends StatefulWidget {
  const Forgotpwd({Key? key}) : super(key: key);

  @override
  State<Forgotpwd> createState() => _ForgotpwdState();
}

class _ForgotpwdState extends State<Forgotpwd> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _loading = false;

  void _showSuccessPopup(BuildContext context) {
    setState(() {
      _loading = true; // Show spinner
    });

    // Simulate a delay of 2 seconds before showing success dialog
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _loading = false; // Hide spinner
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: Text('The change password URL is sent to ${_emailController.text}'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
          ),
          Center(
            child: Container(
              width: 488,
              height: 441,
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
                      'Forgot password',
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
                      child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Type your email',
                          hintStyle: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            height: 19.36 / 16,
                            color: Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _showSuccessPopup(context);
                          }
                        },
                        child: Container(
                          width: 392,
                          height: 53,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color(0xFF010483),
                          ),
                          child: _loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/logosite.png',
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Send instructions',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: const Color.fromRGBO(255, 255, 255, 1),
                                      ),
                                    )
                                  ],
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
