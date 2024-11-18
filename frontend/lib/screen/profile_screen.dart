import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fintech_dashboard_clone/widgets/profile_widgets/profile_billing_informations.dart';
import 'package:fintech_dashboard_clone/widgets/profile_widgets/profile_feedbacks.dart';
import 'package:fintech_dashboard_clone/widgets/profile_widgets/profile_invoices.dart';
import 'package:fintech_dashboard_clone/widgets/profile_widgets/profile_information.dart';
import 'package:fintech_dashboard_clone/widgets/switch_botton.dart';
import 'package:fintech_dashboard_clone/layout/profile_layout.dart';

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
    final paddingValue = isMobile ? 0.0 : 10.0;
    final marginValue = isMobile ? 0.0 : 15.0;

    return Scaffold(
      body: SafeArea(
        child: ProfileLayout(
          content: Padding(
            padding: EdgeInsets.all(paddingValue),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: isMobile ? 0.0 : 30.0),
                child: Column(
                  children: [
                    _buildProfileHeader(isMobile, screenHeight),
                    _buildProfileContent(isMobile, marginValue),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(bool isMobile, double screenHeight) {
    return Container(
      width: double.infinity,
      height: isMobile ? screenHeight / 4.8647 : screenHeight / 3.8647,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xffA1DAFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile)
            Expanded(
              child: Text(
                'Profile',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
            ),
          _buildSearchAndActions(isMobile),
        ],
      ),
    );
  }

  Widget _buildSearchAndActions(bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildSearchBar(isMobile),
        if (!isMobile) ...[
          const SizedBox(width: 20),
          _buildSettingsButton(),
          const SizedBox(width: 30),
          _buildNotificationButton(),
        ],
        if (isMobile)
          const Row(
            children: [
              Text('Emily Smith'),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
      ],
    );
  }

  Widget _buildSearchBar(bool isMobile) {
    return Container(
      width: isMobile ? 150 : 250,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: const TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: "Type here...",
          hintStyle: TextStyle(fontSize: 16),
          icon: Icon(CupertinoIcons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSettingsButton() {
    return IconButton(
      onPressed: () {
        _showSettingsDialog(context);
      },
      icon: SvgPicture.asset(
        'assets/svg/settings.svg',
        width: 50,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            _showNotificationsDialog(context);
          },
          icon: SvgPicture.asset(
            'assets/svg/notif.svg',
            width: 50,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileContent(bool isMobile, double marginValue) {
    return Transform.translate(
      offset: const Offset(0, -70),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: marginValue),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
        ),
        child: isMobile ? _buildMobileContent() : _buildDesktopContent(),
      ),
    );
  }

  Widget _buildDesktopContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          children: [
            const ProfileInformation(
              name: 'Emily Smith',
              email: 'emilysmith@example.com',
            ),
            const SizedBox(width: 20),
            ProfileInvoices(invoices: invoices),
          ],
        ),
        const SizedBox(height: 25),
        // Other widgets
      ],
    );
  }

  Widget _buildMobileContent() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          height: 170,
          width: double.infinity,
          child: const ProfileInformation(
            name: 'Emily Smith',
            email: 'emilysmith@example.com',
          ),
        ),
        const SizedBox(height: 25),
        Container(
          height: 250,
          width: double.infinity,
          child: ProfileInvoices(invoices: invoices),
        ),
        // Other widgets
      ],
    );
  }

  List<Map<String, String>> invoices = [
    {'date': 'Mar, 10, 2023', 'number': '#MS-30776', 'amount': '\$250,000'},
    {'date': 'Feb, 20, 2023', 'number': '#MS-30775', 'amount': '\$150,000'},
    {'date': 'Jan, 15, 2023', 'number': '#MS-30774', 'amount': '\$100,000'},
    {'date': 'Feb, 23, 2023', 'number': '#MS-32821', 'amount': '\$200,000'},
    {'date': 'Jui, 07, 2023', 'number': '#MS-34123', 'amount': '\$210,000'},
  ];


}

//******************************************************** */
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
                                backgroundImage: AssetImage('user.png'),
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


void _showSettingsDialog(BuildContext context) {
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
                height: isMobile
                    ? MediaQuery.of(context).size.height * 0.75
                    : 480,
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Settings',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 18 : 24,
                          height: 1.21,
                        ),
                      ),

                      const SizedBox(height: 17),
                      Row(
                        children: [
                          CustomSwitch(
                            value: true,
                            onChanged: (bool value) {},
                          ),
                          SizedBox(width: isMobile ? 20 : 50),
                          Flexible(
                            child: Text(
                              'Receiving notifications immediately.',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          CustomSwitch(
                            value: false,
                            onChanged: (bool value) {},
                          ),
                          SizedBox(width: isMobile ? 20 : 50),
                          Flexible(
                            child: Text(
                              'Email me when my account is accessed from a new device.',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: isMobile ? 14 : 16,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),
                      _buildSettingsOption(
                        context,
                        icon: Icons.lock,
                        text: 'Change Password',
                        onTap: () {
                          // Add change password functionality here
                        },
                      ),
                      const SizedBox(height: 28),
                      _buildSettingsOption(
                        context,
                        icon: Icons.delete_forever,
                        text: 'Deactivate Account',
                        onTap: () {
                          // Add deactivate account functionality here
                        },
                      ),
                      const SizedBox(height: 28),
                      _buildSettingsOption(
                        context,
                        icon: Icons.language,
                        text: 'Change Language',
                        onTap: () {
                          // Add change language functionality here
                        },
                      ),
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

Widget _buildSettingsOption(BuildContext context,
    {required IconData icon, required String text, required Function() onTap}) {
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
