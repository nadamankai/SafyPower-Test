import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fintech_dashboard_clone/responsive.dart';

import '../screen/profile_screen.dart';

class TopAppBar extends StatelessWidget {
  final String title;

  const TopAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight / 4.5, // Adjust header height
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffA1DAFF), Color(0xff80B9FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Dynamic Title
              Text(
                title,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 20 : 24,
                  color: Colors.white,
                ),
              ),
              // Notification and Profile Icons
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Handle notification action
                    },
                    icon: Icon(
                      Icons.notifications,
                      size: isMobile ? 24 : 30,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileScreen()),
                      );
                    },
                    icon: Icon(
                      Icons.person,
                      size: isMobile ? 24 : 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for help...",
                hintStyle: const TextStyle(fontSize: 16),
                icon: Icon(CupertinoIcons.search),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
