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
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: 70, // Header height
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffA1DAFF), Color(0xff80B9FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Dynamic Title
              Text(
                title,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: isMobile ? 18 : 22,
                  color: Colors.white,
                ),
              ),
              // Search Bar or Icon (depending on screen size)
              if (isMobile && screenWidth < 450)
              // Show search icon if screen width < 450
                IconButton(
                  onPressed: () {
                    // Show modal bottom sheet when clicked
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                autofocus: true,
                                decoration: InputDecoration(
                                  hintText: "Search for help...",
                                  hintStyle: const TextStyle(fontSize: 14),
                                  icon: Icon(CupertinoIcons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    CupertinoIcons.search,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              if (!isMobile || screenWidth >= 450)
              // Display search bar directly on larger screens
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search for help...",
                        hintStyle: const TextStyle(fontSize: 14),
                        icon: Icon(CupertinoIcons.search),
                        border: InputBorder.none,
                      ),
                    ),
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
                      size: isMobile ? 24 : 28,
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
                      size: isMobile ? 24 : 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
