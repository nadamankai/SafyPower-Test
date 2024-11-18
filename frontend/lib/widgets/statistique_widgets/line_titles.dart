import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData(int selectedDayIndex) => FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                color: Color(0xff68737d),
                fontWeight: FontWeight.normal,
                fontSize: 12,
              );
              Widget text;
              if (value % 1 == 0) {
                switch (value.toInt()) {
                  case 0:
                    text = const Text('Mon', style: style);
                    break;
                  case 1:
                    text = const Text('Tue', style: style);
                    break;
                  case 2:
                    text = const Text('Wed', style: style);
                    break;
                  case 3:
                    text = const Text('Thu', style: style);
                    break;
                  case 4:
                    text = const Text('Fri', style: style);
                    break;
                  case 5:
                    text = const Text('Sat', style: style);
                    break;
                  case 6:
                    text = const Text('Sun', style: style);
                    break;
                  default:
                    text = const Text('', style: style);
                    break;
                }
              } else {
                text = const Text('', style: style);
              }
              return SideTitleWidget(
                axisSide: meta.axisSide,
                space: 8.0,
                child: text,
              );
            },
           // margin: 0,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (double value, TitleMeta meta) {
              const style = TextStyle(
                color: Color(0xff67727d),
                fontWeight: FontWeight.normal,
                fontSize: 12,
              );
              Widget text;
              if (value % 1 == 0) {
                switch (value.toInt()) {
                  case 0:
                    text = const Text('0', style: style);
                    break;
                  case 1:
                    text = const Text('20', style: style);
                    break;
                  case 2:
                    text = const Text('40', style: style);
                    break;
                  case 3:
                    text = const Text('60', style: style);
                    break;
                  case 4:
                    text = const Text('80', style: style);
                    break;
                  case 5:
                    text = const Text('100', style: style);
                    break;
                  default:
                    text = const Text('', style: style);
                    break;
                }
              } else {
                text = const Text('', style: style);
              }
              return SideTitleWidget(
                axisSide: meta.axisSide,
                space: 8.0,
                child: text,
              );
            },
            reservedSize: 35,
            //margin: 12,
          ),
        ),
      );
}
