import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatefulWidget {
  @override
  _LineChartWidgetState createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  final List<Color> gradientColors = [
    const Color.fromRGBO(122, 192, 243, 1),
    const Color.fromRGBO(235, 105, 230, 1),
  ];

  bool isDialogOpen = false;
  String selectedInterval = 'day'; // Default to 'day'
  String selectedYear = '2024'; // Default to current year
  String selectedMonth = 'June'; // Default to June
  String selectedDay = '1';
  String selectedWeek = '1st week';

  void setSelectedInterval(String interval) {
    setState(() {
      selectedInterval = interval;
      isDialogOpen = false; // Close the dialog after selecting
    });
  }

  List<FlSpot> getDataPoints(String interval) {
    switch (interval) {
      case 'day':
        return [
          const FlSpot(0, 80),
          const FlSpot(1, 75),
          const FlSpot(2, 65),
          const FlSpot(3, 50),
          const FlSpot(4, 20),
          const FlSpot(5, 60),
          const FlSpot(6, 40),
        ];
      case 'months':
        return [
          const FlSpot(0, 80),
          const FlSpot(1, 75),
          const FlSpot(2, 65),
          const FlSpot(3, 60),
          const FlSpot(4, 20),
          const FlSpot(5, 30),
          const FlSpot(6, 40),
          const FlSpot(7, 50),
          const FlSpot(8, 85),
          const FlSpot(9, 78),
          const FlSpot(10, 100),
          const FlSpot(11, 60),
        ];
      case 'year':
        return [
          const FlSpot(0, 105),
          const FlSpot(1, 240),
          const FlSpot(2, 200),
          const FlSpot(3, 120),
          const FlSpot(4, 40),
          const FlSpot(5, 170),
          const FlSpot(6, 230),
          const FlSpot(7, 260),
          const FlSpot(8, 200),
          const FlSpot(9, 175),
        ];
      case 'week':
        return [
          const FlSpot(0, 80),
          const FlSpot(1, 70),
          const FlSpot(2, 70),
          const FlSpot(3, 30),
        ];
      default:
        return [
          const FlSpot(0, 80),
          const FlSpot(1, 70),
          const FlSpot(2, 70),
          const FlSpot(3, 30),
          const FlSpot(4, 30),
          const FlSpot(5, 40),
          const FlSpot(6, 40),
        ];
    }
  }

  double getMaxY(List<FlSpot> dataPoints) {
    double maxY = 0;
    for (var point in dataPoints) {
      if (point.y > maxY) {
        maxY = point.y;
      }
    }
    // Round maxY up to the nearest ten
    maxY = ((maxY ~/ 10) + 1) * 10.0;
    return maxY;
  }

  List<String> getXLabels(String interval) {
    switch (interval) {
      case 'day':
        return ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      case 'months':
        return [
          'Jan',
          'Feb',
          'Mar',
          'Apr',
          'May',
          'Jun',
          'Jul',
          'Aug',
          'Sep',
          'Oct',
          'Nov',
          'Dec'
        ];
      case 'year':
        return [
          '2014',
          '2015',
          '2016',
          '2017',
          '2018',
          '2019',
          '2020',
          '2021',
          '2022',
          '2023'
        ];
      case 'week':
        return ['1', '2', '3', '4'];
      default:
        return ['2am', '3am', '4am', '5am', '6am', '7am', '8am', '9am'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 530;
    final showMonth = screenWidth < 425;

    List<FlSpot> dataPoints = getDataPoints(selectedInterval);
    double maxY = getMaxY(dataPoints);
    List<String> xLabels = getXLabels(selectedInterval);

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 12, right: 16, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Total visits',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!isMobile)
                Visibility(
                  visible: selectedInterval == 'hour',
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(right: 4, left: 4),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFEAD5F4), width: 1),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedDay,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDay = newValue!;
                          });
                        },
                        items:
                            List.generate(31, (index) => (index + 1).toString())
                                .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              if (!isMobile)
                Visibility(
                  visible: selectedInterval == 'day',
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(right: 4, left: 4),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFEAD5F4), width: 1),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedWeek,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedWeek = newValue!;
                          });
                        },
                        items: <String>[
                          '1st week',
                          '2nd week',
                          '3rd week',
                          '4th week',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              if (!showMonth)
                Visibility(
                  visible: selectedInterval == 'week' ||
                      selectedInterval == 'day' ||
                      selectedInterval == "hour",
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(right: 4, left: 4),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xFFEAD5F4), width: 1),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedMonth,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedMonth = newValue!;
                          });
                        },
                        items: <String>[
                          'January',
                          'February',
                          'March',
                          'April',
                          'May',
                          'June',
                          'July',
                          'August',
                          'September',
                          'October',
                          'November',
                          'December'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              Visibility(
                visible: selectedInterval != 'year',
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  padding: const EdgeInsets.only(right: 4, left: 4),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFFEAD5F4), width: 1),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedYear,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedYear = newValue!;
                        });
                      },
                      items: List.generate(
                              11, (index) => (2024 - index).toString())
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.only(right: 4, left: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 144, 144, 144),
                      width: 1),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedInterval,
                    iconSize: 24,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? newValue) {
                      setSelectedInterval(newValue!);
                    },
                    items: <String>['hour', 'day', 'week', 'months', 'year']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          "Per " + value[0].toUpperCase() + value.substring(1),
                          style: const TextStyle(
                            fontSize: 14,
                          ), // Specify the font size here
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
            child: LineChart(
              mainData(dataPoints, maxY, xLabels),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(
      List<FlSpot> dataPoints, double maxY, List<String> xLabels) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 0.1,
          );
        },
        drawVerticalLine: true,
        verticalInterval: 1,
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 0.1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              if (value % 20 == 0) {
                return Text(value.toInt().toString(),
                    style: const TextStyle(
                      color: Color(0xff67727d),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ));
              }
              return const Text('');
            },
            //margin: 8,
            reservedSize: 30,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: (value, meta) {
              int index = value.toInt();
              if (index >= 0 && index < xLabels.length) {
                return Text(xLabels[index],
                    style: const TextStyle(
                      color: Color(0xff68737d),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ));
              }
              return const Text('');
            },
            interval: 1,
            //margin: 8,
            reservedSize: 30,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d), width: 1),
      ),
      minX: 0,
      maxX: dataPoints.length.toDouble() - 1,
      minY: 0,
      maxY: maxY,
      lineBarsData: [
        LineChartBarData(
          spots: dataPoints,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: true,
            getDotPainter: (spot, percent, barData, index) {
              return FlDotCirclePainter(
                radius: 4,
                strokeWidth: 2,
                strokeColor: const Color.fromRGBO(235, 105, 230, 1),
                color: Colors.white,
              );
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.1))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
