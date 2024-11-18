import 'package:fintech_dashboard_clone/widgets/switch_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInformation extends StatelessWidget {
  const ProfileInformation({
    Key? key,
    required this.name,
    required this.email,
  }) : super(key: key);

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: isMobile ? 24 : 30,
                  backgroundImage: const AssetImage('assets/logo.png'),
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: isMobile ? 20 : 24,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    SizedBox(
                      height: isMobile ? 10 : 15,
                    ),
                    Text(
                      email,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: isMobile ? 14 : 16,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),

                Expanded( child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/svg/edit.svg',
                    width: 16,
                  ),
                ),),
              ],
            ),
            const Expanded(
              child: SizedBox(height: 1),
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _showProfileSettingDialog(context);
                    },
                    child: Text(
                      isMobile ? 'settings' : 'Profile settings',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: (isMobile ||
                                (600 <= MediaQuery.of(context).size.width &&
                                    MediaQuery.of(context).size.width <= 1118))
                            ? 15
                            : 24,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      _showProfileInformationDialog(context);
                    },
                    child: Text(
                      isMobile ? 'informations' : 'Profile informations',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: (isMobile ||
                                (600 <= MediaQuery.of(context).size.width &&
                                    MediaQuery.of(context).size.width <= 1118))
                            ? 15
                            : 24,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showProfileSettingDialog(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    final List<Map<String, dynamic>> settings = [
      {
        'section': 'Account',
        'settings': [
          {
            'title': 'Email me when someone follows me.',
            'value': true,
          },
          {
            'title': 'Email me when someone answers my post.',
            'value': false,
          },
          {
            'title': 'Email me when someone mentions me.',
            'value': true,
          },
        ]
      },
      {
        'section': 'Application',
        'settings': [
          {
            'title': 'New launches and projects.',
            'value': false,
          },
          {
            'title': 'Monthly product changes.',
            'value': false,
          },
          {
            'title': 'Subscribe to the newsletter.',
            'value': true,
          },
        ]
      },
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: isMobile ? MediaQuery.of(context).size.width * 0.8 : 1100,
            height: isMobile ? 500 : 650,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    margin: isMobile
                        ? const EdgeInsets.only(right: 15)
                        : const EdgeInsets.only(right: 35),
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
                    padding: isMobile
                        ? const EdgeInsets.all(10)
                        : const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 35),
                    margin: isMobile
                        ? const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                        bottom: 20)
                        : const EdgeInsets.only(
                        left: 70, right: 70, top: 50, bottom: 0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 246, 254, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: settings.map((section) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                section['section'],
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: isMobile ? 18 : 24,
                                  height: 1.21,
                                ),
                              ),
                              const SizedBox(height: 17),
                              ...section['settings'].map<Widget>((setting) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 28),
                                  child: Row(
                                    children: [
                                      CustomSwitch(
                                        value: setting['value'],
                                        onChanged: (bool value) {},
                                      ),
                                      SizedBox(width: isMobile ? 20 : 50),
                                      Flexible(
                                        child: Text(
                                          setting['title'],
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: isMobile ? 14 : 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //*********************profile information dialog */
  void _showProfileInformationDialog(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    // Define profile fields in an array of objects
    final List<Map<String, String>> profileFields = [
      {'label': 'Fullname', 'value': 'Omar Hiopil'},
      {'label': 'Mobile phone', 'value': '+33 656 64 14 18'},
      {'label': 'Email', 'value': 'email.mail@gmail.fr'},
      {'label': 'Address', 'value': '23 voie du succès 3000'},
    ];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            width: isMobile ? MediaQuery.of(context).size.width * 0.8 : 1100,
            height: isMobile ? 500 : 650,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              border: Border.all(color: Colors.black),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Close button
                  Container(
                    alignment: Alignment.centerRight,
                    margin: isMobile
                        ? const EdgeInsets.only(right: 15)
                        : const EdgeInsets.only(right: 35),
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
                  // Profile container
                  Container(
                    padding: isMobile
                        ? const EdgeInsets.all(10)
                        : const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 35),
                    margin: isMobile
                        ? const EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 0)
                        : const EdgeInsets.only(
                        left: 70, right: 70, top: 50, bottom: 0),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(242, 246, 254, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        Text(
                          'Profile information',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 18 : 24,
                            height: 1.21,
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 40),

                        // Description
                        SizedBox(
                          width: isMobile ? double.infinity : 400,
                          child: const Text(
                            'Hi,\nI am contacting you following the charging of my battery which failed due to a bad placement of the battery. I am checking the placement of the battery to avoid wasting time.',
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: isMobile ? 40 : 40),

                        // Profile fields
                        ...profileFields.map((field) => Padding(
                          padding: EdgeInsets.only(bottom: isMobile ? 40 : 40),
                          child: Row(
                            children: [
                              Text(
                                '${field['label']}: ',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: isMobile ? 14 : 16,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  field['value']!,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: isMobile ? 14 : 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

