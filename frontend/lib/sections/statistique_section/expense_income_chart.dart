import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:fintech_dashboard_clone/widgets/statistique_widgets/bar_chart_with_title.dart';
import 'package:flutter/cupertino.dart';

class ExpenseIncomeCharts extends StatelessWidget {
  const ExpenseIncomeCharts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return !isMobile
        ? Row(
            children: [
              Flexible(
                child: BarChartWithTitle(
                  title: "Available Stations ",
                  stations: 568367,
                  barColor: Styles.defaultBlueColor,
                   data: [
             HourlyData(0, 1),
            HourlyData(1, 5),
            HourlyData(2, 3),
            HourlyData(3, 4),
            HourlyData(4, 5),
            HourlyData(5, 2),
            HourlyData(6, 3),
            HourlyData(7, 5),
            HourlyData(8, 1),
            HourlyData(9, 2),
            HourlyData(10, 3),
            HourlyData(11, 4),
            HourlyData(12, 1),
            HourlyData(13, 5),
            HourlyData(14,3),
            HourlyData(15,5),
            HourlyData(16, 1),
            HourlyData(17, 2),
            HourlyData(18, 3),
            HourlyData(19, 5),
            HourlyData(20, 1),
            HourlyData(21, 2),
            HourlyData(22, 3),
            HourlyData(23, 5),
          ],
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Flexible(
                child: BarChartWithTitle(
                  title: "Stations in use",
                  stations: 635767,
                  barColor: Styles.defaultRedColor,
                   data: [
            HourlyData(0, 1),
            HourlyData(1, 5),
            HourlyData(2, 3),
            HourlyData(3, 4),
            HourlyData(4, 5),
            HourlyData(5, 2),
            HourlyData(6, 3),
            HourlyData(7, 5),
            HourlyData(8, 1),
            HourlyData(9, 2),
            HourlyData(10, 3),
            HourlyData(11, 4),
            HourlyData(12, 1),
            HourlyData(13, 5),
            HourlyData(14,3),
            HourlyData(15,5),
            HourlyData(16, 1),
            HourlyData(17, 2),
            HourlyData(18, 3),
            HourlyData(19, 5),
            HourlyData(20, 1),
            HourlyData(21, 2),
            HourlyData(22, 3),
            HourlyData(23, 5),
          ],
                ),
              ),
            ],
          )
        : Column(
            children: [
              Flexible(
                child: BarChartWithTitle(
                  title: "Available Stations",
                  stations: 568367,
                  barColor: Styles.defaultBlueColor,
                   data: [
             HourlyData(0, 1),
            HourlyData(1, 5),
            HourlyData(2, 3),
            HourlyData(3, 4),
            HourlyData(4, 5),
            HourlyData(5, 2),
            HourlyData(6, 3),
            HourlyData(7, 5),
            HourlyData(8, 1),
            HourlyData(9, 2),
            HourlyData(10, 3),
            HourlyData(11, 4),
            HourlyData(12, 1),
            HourlyData(13, 5),
            HourlyData(14,3),
            HourlyData(15,5),
            HourlyData(16, 1),
            HourlyData(17, 2),
            HourlyData(18, 3),
            HourlyData(19, 5),
            HourlyData(20, 1),
            HourlyData(21, 2),
            HourlyData(22, 3),
            HourlyData(23, 5),
          ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: BarChartWithTitle(
                  title: "Stations in use",
                  stations: 635767,
                  barColor: Styles.defaultRedColor,
                   data: [
             HourlyData(0, 1),
            HourlyData(1, 5),
            HourlyData(2, 3),
            HourlyData(3, 4),
            HourlyData(4, 5),
            HourlyData(5, 2),
            HourlyData(6, 3),
            HourlyData(7, 5),
            HourlyData(8, 1),
            HourlyData(9, 2),
            HourlyData(10, 3),
            HourlyData(11, 4),
            HourlyData(12, 1),
            HourlyData(13, 5),
            HourlyData(14,3),
            HourlyData(15,5),
            HourlyData(16, 1),
            HourlyData(17, 2),
            HourlyData(18, 3),
            HourlyData(19, 5),
            HourlyData(20, 1),
            HourlyData(21, 2),
            HourlyData(22, 3),
            HourlyData(23, 5),
          ],
                ),
              ),
            ],
          );
  }
}
