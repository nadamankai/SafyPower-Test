import 'package:fintech_dashboard_clone/screen/settings_screen.dart';
import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/screen/profile_screen.dart';
import 'package:fintech_dashboard_clone/screen/statistique_screen.dart';
import 'package:fintech_dashboard_clone/screen/contact_us_screen.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.isActive = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: isActive
            ? Styles.defaultYellowColor
            : Styles.defaultLightWhiteColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          if (icon == Icons.person) {
            // Afficher ProfileScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          } else if (icon == Icons.bar_chart) {
            // Afficher statistiqueScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Statistique()),
            );
          } else if (icon == Icons.chat_rounded) {
            // Afficher ContactScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ContactUsScreen()),
            );
          } else if (icon == Icons.power) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const SettingsScreen()),
            );} else {
            // Exécuter l'action par défaut
            onPressed();
          }
        },
        icon: Icon(
          icon,
          size: 20,
          color: isActive ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

