import 'package:fintech_dashboard_clone/widgets/switch_botton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/layout/app_layout.dart';
import 'package:fintech_dashboard_clone/widgets/profile_widgets/profile_information.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/enums/navigation_items.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 1000;

    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          activeTab:  NavigationItems.users,
          content: SingleChildScrollView(
            padding: isMobile
                ? const EdgeInsets.all(0)
                : const EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Column(
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  height: screenHeight / 4.5,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffA1DAFF), Color(0xff80B9FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!isMobile)
                            Text(
                              'Mon Profil',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _showNotificationsDialog(context);
                                },
                                icon: Icon(
                                  Icons.notifications,
                                  size: isMobile ? 24 : 30,
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _showSettingsDialog(context);
                                },
                                icon: Icon(
                                  Icons.settings,
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
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: "Rechercher...",
                            hintStyle: TextStyle(fontSize: 16),
                            icon: Icon(CupertinoIcons.search),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Profile Information Section (Integrated)
                const ProfileInformation(
                  name: 'Emily Smith',
                  email: 'emilysmith@example.com',
                ),

                const SizedBox(height: 20),

                // Invoices Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invoices',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 15),
                      ListView.builder(
                        itemCount: invoices.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final invoice = invoices[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      invoice['date']!,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      invoice['number']!,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      invoice['amount']!,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.green,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    TextButton.icon(
                                      onPressed: () {},
                                      icon: Icon(Icons.picture_as_pdf, size: 16),
                                      label: Text(
                                        'View PDF',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Map<String, String>> invoices = [
    {
      'date': 'Mar, 10, 2023',
      'number': '#MS-30776',
      'amount': '\$250,000',
    },
    {
      'date': 'Feb, 20, 2023',
      'number': '#MS-30775',
      'amount': '\$150,000',
    },
    {
      'date': 'Jan, 15, 2023',
      'number': '#MS-30774',
      'amount': '\$100,000',
    },
    {
      'date': 'Feb, 23, 2023',
      'number': '#MS-32821',
      'amount': '\$200,000',
    },
    {
      'date': 'Jui, 07, 2023',
      'number': '#MS-34123',
      'amount': '\$210,000',
    },
  ];
}

//******************************************************** */

List<Comment> comments = [
  Comment(
    author: 'amyrobson',
    comment: 'Impressive! The design and responsiveness are well done!',
    number: 12,
  ),
  Comment(
    author: 'maxblagun',
    comment: 'Woah, your project looks awesome! How long have you been coding?',
    number: 8,
  ),
];

class Comment {
  String author;
  String comment;
  int number;
  bool isReplyVisible;

  Comment(
      {required this.author,
        required this.comment,
        required this.number,
        this.isReplyVisible = false});
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Comment> comments = [
    Comment(
        author: 'amyrobson',
        comment:
        'Impressive! Though it seems the drag feature could be improved. But overall it looks incredible. You’ve nailed the design and the responsiveness at various breakpoints works really well.', number: 12),
    Comment(
        author: 'amyrobson',
        comment:
        'Impressive! Though it seems the drag feature could be improved. But overall it looks incredible. You’ve nailed the design and the responsiveness at various breakpoints works really well.', number: 12),
    Comment(
        author: 'amyrobson',
        comment:
        'Woah, your project looks awesome! How long have you been coding for? I’m still new, but think I want to dive into React as well soon. Perhaps you can give me an insight on where I can learn React? Thanks!', number: 12),

    // Autres commentaires...
  ];


  void toggleReplyVisibility(int index) {
    setState(() {
      comments[index].isReplyVisible = !comments[index].isReplyVisible;
    });
  }

  void incrementNumber(int index) {
    setState(() {
      comments[index].number++; // Increment the number at the specified index
    });
  }

  void decrementNumber(int index) {
    setState(() {
      comments[index].number--; // Decrement the number at the specified index
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(comments.length, (index) {
        Comment comment = comments[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              width: double.infinity,
              margin: isMobile
                  ? const EdgeInsets.only(bottom: 20, right: 10)
                  : const EdgeInsets.only(bottom: 20, right: 45),
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  if (!isMobile)
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(245, 246, 250, 1),
                      ),
                      width: 50,
                      height: 100,
                      margin: const EdgeInsets.only(right: 24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              incrementNumber(index);
                            },
                            child: Text(
                              '+',
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w800,
                                fontSize: isMobile ? 14 : 20,
                                color: const Color.fromRGBO(83, 87, 182, 1),
                              ),
                            ),
                          ),
                          Text(
                            '${comment.number}',
                            style: GoogleFonts.rubik(
                              fontWeight: FontWeight.w500,
                              fontSize: isMobile ? 12 : 16,
                              color: const Color.fromRGBO(83, 87, 182, 1),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              onPressed: () {
                                decrementNumber(index);
                              },
                              child: Text(
                                '-',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w800,
                                  fontSize: isMobile ? 14 : 20,
                                  color: const Color.fromRGBO(83, 87, 182, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  Expanded(
                    child: Container(
                      height: isMobile ? null : 121,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 16,
                              ),
                              const SizedBox(width: 16),
                              Text(
                                comment.author,
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w500,
                                  fontSize: isMobile ? 14 : 16,
                                  color: const Color.fromRGBO(51, 66, 83, 1),
                                ),
                              ),
                              SizedBox(width: isMobile ? 50 : 16),
                              Text(
                                '1 month ago',
                                style: GoogleFonts.rubik(
                                  fontWeight: FontWeight.w400,
                                  fontSize: isMobile ? 14 : 16,
                                  color: const Color.fromRGBO(83, 87, 182, 1),
                                ),
                              ),
                              if (!isMobile) const SizedBox(width: 380),
                              if (!isMobile)
                                TextButton.icon(
                                  onPressed: () {
                                    toggleReplyVisibility(index);
                                    // Logic for the "Reply" button
                                  },
                                  icon: const Icon(
                                    Icons.reply,
                                    color: Color.fromRGBO(83, 87, 182, 1),
                                  ),
                                  label: Text(
                                    'Reply',
                                    style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      fontSize: isMobile ? 12 : 14,
                                      color:
                                      const Color.fromRGBO(83, 87, 182, 1),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Container(
                            width: isMobile ? double.infinity : 700,
                            height: isMobile ? null : 70,
                            margin: isMobile
                                ? const EdgeInsets.only(top: 15, right: 0)
                                : const EdgeInsets.only(top: 15, right: 30),
                            padding: isMobile
                                ? const EdgeInsets.only(right: 0)
                                : const EdgeInsets.only(right: 10),
                            child: Text(
                              comment.comment,
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                                color: const Color.fromRGBO(103, 114, 126, 1),
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          if (isMobile) const SizedBox(height: 20),
                          if (isMobile)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color:
                                    const Color.fromRGBO(245, 246, 250, 1),
                                  ),
                                  width: 80,
                                  height: 40,
                                  margin: isMobile
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(right: 24),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          // Logic for the "+" button
                                        },
                                        child: Text(
                                          '-',
                                          style: GoogleFonts.rubik(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14,
                                            color: const Color.fromRGBO(
                                                83, 87, 182, 1),
                                          ),
                                        ),
                                        style: TextButton.styleFrom(
                                          minimumSize: const Size(40, 40),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                      Text(
                                        '12',
                                        style: GoogleFonts.rubik(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: const Color.fromRGBO(
                                              83, 87, 182, 1),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(20)),
                                        child: TextButton(
                                          onPressed: () {
                                            // Logic for the "-" button
                                          },
                                          child: Text(
                                            '+',
                                            style: GoogleFonts.rubik(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14,
                                              color: const Color.fromRGBO(
                                                  83, 87, 182, 1),
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                            minimumSize: Size(40, 40),
                                            padding: EdgeInsets.zero,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    toggleReplyVisibility(index);
                                    // Logic for the "Reply" button
                                  },
                                  icon: const Icon(
                                    Icons.reply,
                                    color: Color.fromRGBO(83, 87, 182, 1),
                                  ),
                                  label: Text(
                                    'Reply',
                                    style: GoogleFonts.rubik(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color:
                                      const Color.fromRGBO(83, 87, 182, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (comment.isReplyVisible)
              Container(
                padding: const EdgeInsets.all(24),
                margin: const  EdgeInsets.only(bottom: 20, right: 45),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: isMobile ? double.infinity : 635,
                      child: TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Enter your reply',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 104,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          // Logic for the "Submit" button
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color(0xFF5357B6), // Background color
                          foregroundColor: Colors.white, // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadowColor: const Color(0xFFC5C6EF), // Hover color
                        ),
                        child: Text(
                          'REPLY',
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      }),
    );
  }
}

void _showNotificationsDialog(BuildContext context) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        // backgroundColor: Color.fromRGBO(0, 0, 0, 0.027),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: isMobile ? MediaQuery.of(context).size.width * 0.8 : 1100,
          height: 650,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.black),
            // boxShadow: [
            //   // BoxShadow(
            //   //   color: Colors.black.withOpacity(0.5),
            //   //   offset: Offset(0, 4),
            //   //   blurRadius: 8,
            //   // ),
            // ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: isMobile
                    ? const EdgeInsets.only(right: 15)
                    : const EdgeInsets.only(right: 35, top: 15),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    size: isMobile ? 40 : 60,
                  ),
                ),
              ),
              Container(
                height:
                isMobile ? MediaQuery.of(context).size.height * 0.75 : 480,
                padding: isMobile
                    ? const EdgeInsets.only(
                    left: 10, right: 0, top: 10, bottom: 10)
                    : const EdgeInsets.only(
                    left: 45, right: 0, top: 35, bottom: 35),
                margin: isMobile
                    ? const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 0)
                    : const EdgeInsets.only(
                    left: 70, right: 70, top: 35, bottom: 0),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 246, 254, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(child: MyWidget()),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showCustomDialog({
  required BuildContext context,
  required String title,
  required Widget childContent,
}) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: isMobile ? MediaQuery.of(context).size.width * 0.8 : 1100,
          height: 650,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            border: Border.all(color: Colors.black),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close Button
              Container(
                alignment: Alignment.centerRight,
                margin: isMobile
                    ? const EdgeInsets.only(right: 15)
                    : const EdgeInsets.only(right: 35, top: 15),
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close_rounded,
                    size: isMobile ? 40 : 60,
                  ),
                ),
              ),
              // Dialog Content
              Container(
                height: isMobile
                    ? MediaQuery.of(context).size.height * 0.75
                    : 480,
                padding: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 10, vertical: 10)
                    : const EdgeInsets.symmetric(horizontal: 45, vertical: 35),
                margin: isMobile
                    ? const EdgeInsets.symmetric(horizontal: 10, vertical: 20)
                    : const EdgeInsets.symmetric(horizontal: 70, vertical: 35),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 246, 254, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Text(
                            title,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: isMobile ? 18 : 24,
                            ),
                          ),
                        ),
                      childContent,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


void _showSettingsDialog(BuildContext context) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  _showCustomDialog(
    context: context,
    title: 'Settings',
    childContent: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Toggle Options
        _buildSettingsRow(
          isMobile: isMobile,
          label: 'Receiving notifications immediately.',
          value: true,
          onChanged: (value) {},
        ),
        const SizedBox(height: 28),
        _buildSettingsRow(
          isMobile: isMobile,
          label: 'Email me when my account is accessed from a new device.',
          value: false,
          onChanged: (value) {},
        ),
        const SizedBox(height: 28),
        // Additional Options
        _buildSettingsOption(
          context,
          icon: Icons.lock,
          text: 'Change Password',
          onTap: () {},
        ),
        const SizedBox(height: 28),
        _buildSettingsOption(
          context,
          icon: Icons.delete_forever,
          text: 'Deactivate Account',
          onTap: () {},
        ),
        const SizedBox(height: 28),
        _buildSettingsOption(
          context,
          icon: Icons.language,
          text: 'Change Language',
          onTap: () {},
        ),
      ],
    ),
  );
}

Widget _buildSettingsRow({
  required bool isMobile,
  required String label,
  required bool value,
  required ValueChanged<bool> onChanged,
}) {
  return Row(
    children: [
      CustomSwitch(value: value, onChanged: onChanged),
      SizedBox(width: isMobile ? 20 : 50),
      Flexible(
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: isMobile ? 14 : 16,
          ),
        ),
      ),
    ],
  );
}

Widget _buildSettingsOption(
    BuildContext context, {
      required IconData icon,
      required String text,
      required Function() onTap,
    }) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Icon(
          icon,
          size: isMobile ? 20 : 24,
        ),
        SizedBox(width: isMobile ? 20 : 50),
        Flexible(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
        ),
      ],
    ),
  );
}
