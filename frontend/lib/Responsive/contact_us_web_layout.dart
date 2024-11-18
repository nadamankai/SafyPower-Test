import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fintech_dashboard_clone/layout/contact_us_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsWebLayout extends StatefulWidget {
  const ContactUsWebLayout({Key? key}) : super(key: key);

  @override
  State<ContactUsWebLayout> createState() => _ContactUsWebLayoutState();
}

class _ContactUsWebLayoutState extends State<ContactUsWebLayout> {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 780;
    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xffA1DAFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(!isMobile)
                          Expanded(
                            child: Text(
                              'SafyPower',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 36,
                                height: 43.57 / 36,
                              ),
                            ),
                          ),
                          if(isMobile)
                          Expanded(
                            child: Text(
                              'SafyPower',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                height: 43.57 / 36,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 300,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: const TextField(
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 19.36 /
                                            2), // Interligne / 2 pour ajuster l'espacement
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Type here...",
                                    icon: Icon(CupertinoIcons.search),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/svg/settings.svg',
                                  width: 50,
                                  colorFilter: const ColorFilter.mode(
                                      Colors.black, BlendMode.srcIn),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Stack(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                      'assets/svg/notif.svg',
                                      width: 50,
                                      colorFilter: const ColorFilter.mode(
                                          Colors.black, BlendMode.srcIn),
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, -70),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(40, 10, 25, 40),
                        padding: const EdgeInsets.only(
                            bottom: 20, left: 30, right: 30, top: 25),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromRGBO(242, 246, 254, 1),
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  child: Text(
                                    'Contact Form',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32,
                                      height: 28 /
                                          32, // Interligne / Taille de police
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: IconButton(
                                    onPressed: () {
                                      // Ajoutez ici la logique pour fermer le pop-up
                                    },
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      size: 50,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    labelText: 'Prénom',
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 12),
                                                    labelStyle: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18,
                                                      height: 28 / 18,
                                                    ),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    labelText: 'Nom',
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 12),
                                                    labelStyle: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18,
                                                      height: 28 /
                                                          18, // Calculating line height relative to font size
                                                    ),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    right: 10),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    labelText: 'E-mail',
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 12),
                                                    labelStyle: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18,
                                                      height: 28 /
                                                          18, // Calculating line height relative to font size
                                                    ),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.black,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    labelText: 'Phone N°',
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16,
                                                            vertical: 12),
                                                    labelStyle: TextStyle(
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 18,
                                                      height: 28 / 18,
                                                    ),
                                                    floatingLabelBehavior:
                                                        FloatingLabelBehavior
                                                            .always,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: TextFormField(
                                            maxLines: 7,
                                            style: const TextStyle(
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                              color: Color.fromRGBO(
                                                  173, 173, 173, 1),
                                            ),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              labelText: 'Type your message...',
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 12),
                                              alignLabelWithHint: true,
                                              floatingLabelBehavior:
                                                  FloatingLabelBehavior.always,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          width: double.infinity,
                                          child: OutlinedButton(
                                            onPressed: () {
                                              // Action lorsque le bouton est pressé
                                            },
                                            style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              side: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 1.0),

                                              // Autres options de style du bouton
                                            ),
                                            child: Text(
                                              'Send message',
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),

                                        // Première ligne contenant deux inputs
                                        // Ajoutez ici vos widgets pour les inputs
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 80),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.transparent,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Have a question for us?',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 32,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 36),
                                        Text(
                                          'In case of emergency contact us by phone.',
                                          style: GoogleFonts.inter(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 36),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.phone_callback_outlined),
                                            const SizedBox(width: 10),
                                           Expanded ( child: Text(
                                              '+33 651 741418',
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                            ),) 
                                          ],
                                        ),
                                        // Contenu de la deuxième box
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Autres widgets
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
