import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MockData {
  static BarChartGroupData makeGroupData(
      int x, double y1, Color barColor, double width) {
    return BarChartGroupData(
      barsSpace: 1,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: barColor,
          width: width,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ],
    );
  }

  static List<BarChartGroupData> getBarChartitems(Color color,
      {double width = 20}) {
    return [
      makeGroupData(0, 20000, color, width),
      makeGroupData(1, 60000, color, width),
      makeGroupData(2, 80000, color, width),
      makeGroupData(3, 50000, color, width),
      makeGroupData(4, 40000, color, width),
      makeGroupData(5, 80000, color, width),
      makeGroupData(6, 70000, color, width),
      makeGroupData(7, 90000, color, width),
    ];
  }
}
