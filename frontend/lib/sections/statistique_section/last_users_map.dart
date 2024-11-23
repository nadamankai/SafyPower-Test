import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:fintech_dashboard_clone/widgets/statistique_widgets/bar_chart_with_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/widgets/statistique_widgets/line_chart.dart';
import 'package:fintech_dashboard_clone/widgets/statistique_widgets/last_users.dart';
import 'package:fintech_dashboard_clone/widgets/statistique_widgets/map.dart';

class LastUsersMap extends StatelessWidget {
  const LastUsersMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return !isMobile
        ? Row(
            children: [
              Flexible(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: Styles.defaultBorderRadius,
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.6,

                  child: LastUser(),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Flexible(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: Styles.defaultBorderRadius,
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          'Maps',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        height:MediaQuery.of(context).size.height *0.3,
                        width: MediaQuery.of(context).size.width * 0.36,

                        margin:const EdgeInsets.only(left: 20, right: 20),
                        child: MapPage(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: Styles.defaultBorderRadius,
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: LastUser(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: Styles.defaultBorderRadius,
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 16, 0, 0),
                        child: Text(
                          'Maps',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height:MediaQuery.of(context).size.height *0.21,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: MapPage(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
