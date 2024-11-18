import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fintech_dashboard_clone/layout/statistique_layout_chart.dart';
import 'package:fintech_dashboard_clone/styles/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fintech_dashboard_clone/screen/statistique_screen.dart';

class StatsBYWRWidget extends StatefulWidget {
  @override
  _StatsBYWRWidgetState createState() => _StatsBYWRWidgetState();
}

class _StatsBYWRWidgetState extends State<StatsBYWRWidget> {
  final List<Color> gradientColors = [
    const Color.fromRGBO(52, 170, 254, 1),
    const Color.fromRGBO(255, 91, 239, 0),
  ];

  bool isContainerClosed = false;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;
    print(
      581 / MediaQuery.of(context).size.height,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
        scrollbarTheme: Styles.scrollbarTheme,
      ),
      home: Scaffold(
        body: SafeArea(
          child: AppLayout(
            content: Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Row(
                children: [
                  // Main Panel
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 0, right: 20),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          isContainerClosed
                              ? Container()
                              : Container(
                                  width: isMobile ? double.infinity : 1000,
                                  height: isMobile ? 400 : 600,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isContainerClosed = true;
                                            });
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Statistique()),
                                            );
                                          },
                                          child: Icon(
                                            Icons.close,
                                            color: Colors.black,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                      SizedBox(
                                        child: Center(
                                          child: Container(
                                            width: isMobile
                                                ? double.infinity
                                                : 900,
                                            height: isMobile ? 300 : 550,
                                            decoration: BoxDecoration(
                                              color: Color(0xfff2f6ff),
                                              border: Border.all(
                                                width: 1,
                                                color: Color(0xfff2f6ff),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(11),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      SizedBox(
                                        child: Center(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: isMobile
                                                    ? double.infinity
                                                    : 800,
                                                height: isMobile ? 200 : 450,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.white,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(11),
                                                ),
                                                child: CustomPaint(
                                                  painter: BarChartPainter(
                                                    barValues: [
                                                      80,
                                                      75,
                                                      65,
                                                      60,
                                                      20,
                                                      30,
                                                      40,
                                                      50,
                                                      85,
                                                      78
                                                    ],
                                                    gradientColors:
                                                        gradientColors,
                                                    minValue: 0,
                                                    maxValue: 100,
                                                    bottomTitles: [
                                                      '1',
                                                      '2',
                                                      '3',
                                                      '4',
                                                      '5',
                                                      '6',
                                                      '7',
                                                      '8',
                                                      '9',
                                                      '10'
                                                    ],
                                                    leftTitles: [
                                                      '0',
                                                      '20',
                                                      '40',
                                                      '60',
                                                      '80',
                                                      '100'
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 20,
                                                left: 20,
                                                child: Text(
                                                  'Number of users per weeks',
                                                  style: GoogleFonts.nunito(
                                                      fontSize:
                                                          isMobile ? 15 : 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xAA030229)),
                                                ),
                                              ),
                                            ],
                                          ),
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BarChartPainter extends CustomPainter {
  final List<double> barValues;
  final List<Color> gradientColors;
  final double minValue;
  final double maxValue;
  final List<String> bottomTitles;
  final List<String> leftTitles;

  BarChartPainter({
    required this.barValues,
    required this.gradientColors,
    required this.minValue,
    required this.maxValue,
    required this.bottomTitles,
    required this.leftTitles,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = (size.width - 60) / barValues.length;
    final maxBarHeight = size.height - 120;

    final xTitleStyle = TextStyle(
      color: Colors.grey,
      fontSize: 12,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
    );

    final xTitlePainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    for (int i = 0; i < barValues.length; i++) {
      final barHeight =
          (barValues[i] - minValue) / (maxValue - minValue) * maxBarHeight;

      final rect = Rect.fromLTRB(
        i * barWidth + barWidth / 4 + 20,
        size.height - barHeight - 60,
        (i + 1) * barWidth - barWidth / 4 + 20,
        size.height - 60,
      );

      final paint = Paint()
        ..shader = LinearGradient(
          colors: gradientColors,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          tileMode: TileMode.clamp,
        ).createShader(rect);

      canvas.drawRect(rect, paint);

      final xTitle = bottomTitles[i];
      final xTitleX = i * barWidth + barWidth / 2 + 20;
      final xTitleY = size.height - 20;

      xTitlePainter.text = TextSpan(
        text: xTitle,
        style: xTitleStyle,
      );
      xTitlePainter.layout();
      xTitlePainter.paint(
          canvas, Offset(xTitleX - xTitlePainter.width / 2, xTitleY));
    }

    final horizontalLinePaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final horizontalLineTitleStyle = TextStyle(
      color: Colors.grey,
      fontSize: 12,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
    );

    final horizontalLineTitlePainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
    );

    for (int i = 0; i < leftTitles.length; i++) {
      final y = size.height - 60 - i * maxBarHeight / (leftTitles.length - 1);

      canvas.drawLine(
        Offset(40, y),
        Offset(size.width - 20, y),
        horizontalLinePaint,
      );

      final horizontalLineTitle = leftTitles[i];
      final horizontalLineTitleX = 10.0;
      final horizontalLineTitleY = y - 8;

      horizontalLineTitlePainter.text = TextSpan(
        text: horizontalLineTitle,
        style: horizontalLineTitleStyle,
      );
      horizontalLineTitlePainter.layout();
      horizontalLineTitlePainter.paint(
          canvas, Offset(horizontalLineTitleX, horizontalLineTitleY));
    }

    final maxTitleStyle = TextStyle(
      color: Colors.grey,
      fontSize: 12,
      fontFamily: 'Nunito',
      fontWeight: FontWeight.w400,
    );

    final maxTitlePainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
    );

    final maxTitle = maxValue.toString();
    final maxTitleX = 10.0;
    final maxTitleY = size.height - 60 - maxBarHeight - 16;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
