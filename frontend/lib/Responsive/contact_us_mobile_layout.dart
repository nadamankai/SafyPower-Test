import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fintech_dashboard_clone/layout/contact_us_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUsMobileLayout extends StatefulWidget {
  const ContactUsMobileLayout({Key? key}) : super(key: key);

  @override
  State<ContactUsMobileLayout> createState() => _ContactUsMobileLayoutState();
}

class _ContactUsMobileLayoutState extends State<ContactUsMobileLayout> {
  @override
  Widget build(BuildContext context) {
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
                        horizontal: 20,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffA1DAFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'SafyPower',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -70),
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        padding: const EdgeInsets.only(
                            bottom: 40, left: 30, right: 30, top: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromRGBO(242, 246, 254, 1),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Contact Form',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 0),
                                  child: IconButton(
                                    onPressed: () {
// Ajoutez ici la logique pour fermer le pop-up
                                    },
                                    icon: const Icon(
                                      Icons.close_rounded,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.transparent,
                                  ),
                                  child: Column(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
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
                                                  vertical: 9,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Container(
                                            width: double.infinity,
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
                                                  vertical: 9,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 20),
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
                                                  vertical: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
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
                                                  vertical: 12,
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
                                          maxLines: 6,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            labelText: 'Type your message...',
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 2,
                                            ),
                                            alignLabelWithHint: true,
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            side: const BorderSide(
                                                color: Colors.grey,
                                                width:
                                                    1.0), // Autres options de style du bouton
                                          ),
                                          child: Text(
                                            'Send message',
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14,
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

                                // afficher le commentaire....................................
                              ],
                            ),
                            // Autres widgets
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -40),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Have a question for us?',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 36),
                            Text(
                              'In case of emergency contact us by phone.',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 36),
                            Row(
                              children: [
                                const Icon(Icons.phone),
                                const SizedBox(width: 10),
                                Text(
                                  '+33 651 741418',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            // Contenu de la deuxième box
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
