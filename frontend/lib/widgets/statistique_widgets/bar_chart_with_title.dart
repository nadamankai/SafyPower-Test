import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// MockData class with custom hourly data
class MockData {
  static List<BarChartGroupData> getBarChartItems(
      List<HourlyData> data, Color barColor, {required int width, required int startHour, required int endHour}) {
    List<BarChartGroupData> items = [];
    for (int i = startHour; i < endHour; i++) {
      items.add(BarChartGroupData(
        x: i - startHour,
        barRods: [
          BarChartRodData(
            toY: data[i].value,
            color: barColor,
            width: width.toDouble(),
          ),
        ],
      ));
    }
    return items;
  }
}

// HourlyData class
class HourlyData {
  final int hour;
  final double value;

  HourlyData(this.hour, this.value);
}

// BarChartWithTitle widget
class BarChartWithTitle extends StatefulWidget {
  final String title;
  final Color barColor;
  final int stations;
  final List<HourlyData> data;

  const BarChartWithTitle({
    Key? key,
    required this.title,
    required this.barColor,
    required this.stations,
    required this.data,
  }) : super(key: key);

  @override
  _BarChartWithTitleState createState() => _BarChartWithTitleState();
}

// State class for BarChartWithTitle widget
class _BarChartWithTitleState extends State<BarChartWithTitle> {
  int startHour = 7;
  int endHour = 14;

  void _navigateLeft() {
    setState(() {
      if (startHour > 7) {
        startHour--;
        endHour--;
      }
    });
  }

  void _navigateRight() {
    setState(() {
      if (endHour < widget.data.length) {
        startHour++;
        endHour++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_left),
                    onPressed: _navigateLeft,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'per hour',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.arrow_right),
                    onPressed: _navigateRight,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipPadding: const EdgeInsets.all(8),
                    tooltipMargin: 8,
                    tooltipRoundedRadius: 8,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        rod.toY.toString(),
                        const TextStyle(color: Colors.white),
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  show: true,
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return const Text('0');
                          case 1:
                            return const Text('1');
                          case 2:
                            return const Text('2');
                          case 3:
                            return const Text('3');
                          case 4:
                            return const Text('4');
                          case 5:
                            return const Text('5');
                          default:
                            return const Text('');
                        }
                      },
                      interval: 1,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int hour = startHour + value.toInt();
                        if (hour >= 7 && hour < widget.data.length) {
                          return Text(hour < 12 ? '$hour am' : '${hour == 12 ? 12 : hour - 12} pm');
                        } else {
                          return const Text('');
                        }
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: MockData.getBarChartItems(
                  widget.data,
                  widget.barColor,
                  width: 20,
                  startHour: startHour,
                  endHour: endHour,
                ),
                gridData: const FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
