import 'package:fintech_dashboard_clone/layout/navigation_panel.dart';
import 'package:fintech_dashboard_clone/models/enums/navigation_items.dart';
// import 'package:fintech_dashboard_clone/layout/top_app_bar.dart';
import 'package:fintech_dashboard_clone/responsive.dart';
import 'package:flutter/cupertino.dart';

class ProfileLayout extends StatelessWidget {
  final Widget content;

  const ProfileLayout({Key? key, required this.content}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Column(
        children: [
          // const TopAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: content,
            ),
          ),
          const NavigationPanel(
            axis: Axis.horizontal,
            activeTab: NavigationItems.users,
          ),
        ],
      ),
      desktop: Row(
        children: [
          const NavigationPanel(
            axis: Axis.vertical,
            activeTab: NavigationItems.users,
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(
                  //   height: 100,
                  //   child: TopAppBar(),
                  // ),
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