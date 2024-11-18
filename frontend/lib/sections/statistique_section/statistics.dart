import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:fintech_dashboard_clone/widgets/statistique_widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/widgets/statistique_widgets/percent_indicator.dart';

class StatisticsCharts extends StatelessWidget {
  const StatisticsCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 870;

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
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: LineChartWidget(),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Flexible(
                flex: 3,
                child: Container(
                  // padding: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    borderRadius: Styles.defaultBorderRadius,
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 0.4,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Padding(
                        padding:  EdgeInsets.only(left: 20, top: 24, right: 16, bottom: 0),
                        child: Text(
                          'Current station usage',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Center(
                        child: PieChart(
                          data:  [
                            PieChartData(Styles.defaultRedColor, 30),
                            PieChartData(Styles.defaultBlueColor, 70),
                          ],
                          radius: MediaQuery.of(context).size.width * 0.07,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '100%',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Styles.defaultRedColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '30% In use',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width:20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(

                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: Styles.defaultBlueColor,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                '70% Available',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      )),
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
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: LineChartWidget(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: Styles.defaultBorderRadius,
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                        child: Text(
                          'Current station usage',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: PieChart(
                          data: [
                            PieChartData( Styles.defaultRedColor, 30),
                            PieChartData( Styles.defaultBlueColor, 70),
                          ],
                          radius: isMobile ? 50 : 100,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '100%',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Styles.defaultRedColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '30% In use',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 12 : 14,
                              ),
                            ),
                            const SizedBox(width: 60),
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Styles.defaultBlueColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '70% Available',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: isMobile ? 12 : 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
