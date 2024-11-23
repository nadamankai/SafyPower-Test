import 'package:flutter/material.dart';

enum NavigationItems {
  panel,
  users,
  contact,
  settings
}

extension NavigationItemsExtensions on NavigationItems {
  IconData get icon {
    switch (this) {
      // case NavigationItems.home:
      // return Icons.home;
      case NavigationItems.panel:
        return Icons.bar_chart;

      case NavigationItems.users:
        return Icons.person;

      case NavigationItems.contact:
        return Icons.chat_rounded;
      case NavigationItems.settings:
        return Icons.power;
    }
  }
}
