import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:fintech_dashboard_clone/widgets/statistique_widgets/line_chart.dart';

import '../../widgets/statistique_widgets/percent_indicator.dart';

class StatisticsCharts extends StatelessWidget {
  final double usedPercentage;
  final double availablePercentage;

  const StatisticsCharts({
    Key? key,
    required this.usedPercentage,
    required this.availablePercentage,
  }) : super(key: key);

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
            height: MediaQuery.of(context).size.height * 0.6,
            child: LineChartWidget(),
          ),
        ),
        const SizedBox(width: 40),
        Flexible(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: Styles.defaultBorderRadius,
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.6,
            child: _buildPieChart(context),
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
            height: MediaQuery.of(context).size.height * 0.4,
            child: LineChartWidget(),
          ),
        ),
        const SizedBox(height: 20),
        Flexible(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: Styles.defaultBorderRadius,
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height * 0.4,
            child: _buildPieChart(context),
          ),
        ),
      ],
    );
  }

  Widget _buildPieChart(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Current Station Usage',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        PieChart(
          data: [
            PieChartData(Styles.defaultRedColor, usedPercentage??0),
            PieChartData(Styles.defaultBlueColor, availablePercentage),
          ],
          radius: MediaQuery.of(context).size.width * 0.07,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(usedPercentage + availablePercentage).toInt()}%',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegendItem(Styles.defaultRedColor, '$usedPercentage% In use'),
            const SizedBox(width: 20),
            _buildLegendItem(Styles.defaultBlueColor, '$availablePercentage% Available'),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
