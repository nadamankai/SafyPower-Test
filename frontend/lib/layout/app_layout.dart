import 'package:fintech_dashboard_clone/layout/navigation_panel.dart';
import 'package:fintech_dashboard_clone/layout/top_app_bar.dart';
import 'package:fintech_dashboard_clone/models/enums/navigation_items.dart';
import 'package:fintech_dashboard_clone/responsive.dart';
import 'package:flutter/cupertino.dart';

class AppLayout extends StatelessWidget {
  final Widget content;
  final activeTab;

  const AppLayout({Key? key, required this.content, this.activeTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: content),
                ],
              ),
            ),
          ),
          NavigationPanel(
            axis: Axis.horizontal,
            activeTab:activeTab,
          ),
        ],
      ),
      desktop: Row(
        children: [
          NavigationPanel(
            axis: Axis.vertical,
            activeTab: activeTab,
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: content),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
