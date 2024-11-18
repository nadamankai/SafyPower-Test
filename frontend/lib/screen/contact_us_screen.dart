import 'package:flutter/material.dart';

import 'package:fintech_dashboard_clone/Responsive/contact_us_web_layout.dart';
import 'package:fintech_dashboard_clone/Responsive/contact_us_mobile_layout.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return Scaffold(
      body: SafeArea(
        child: isMobile ? ContactUsMobileLayout() : ContactUsWebLayout(),
      ),
    );
  }
}
