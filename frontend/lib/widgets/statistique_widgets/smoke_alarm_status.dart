import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SmokeAlarmStatus extends StatelessWidget {
  final double smokeLevel; // Niveau de fumée détecté (en %)
  final double fireAlarmStatus; // Statut de l'alarme incendie (en % activée)

  const SmokeAlarmStatus({
    Key? key,
    required this.smokeLevel,
    required this.fireAlarmStatus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;
    final smokeLevelCritical = smokeLevel > 70 ;
    final fireAlarmStatusCritical =  fireAlarmStatus > 70;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),

          // Gauges Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildGaugeCard(
                  context,
                  "Smoke Detector",
                  smokeLevel,
                  Colors.redAccent,
                  smokeLevelCritical,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildGaugeCard(
                  context,
                  "Fire Alarm",
                  fireAlarmStatus,
                  Colors.orangeAccent,
                  fireAlarmStatusCritical,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGaugeCard(BuildContext context, String title, double value, Color needleColor, bool isCritical) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Card Title
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w600,
              color: isCritical ? Colors.red : Colors.blueGrey.shade700,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 20),

          // Gauge
          SizedBox(
            height: isMobile
                ? MediaQuery.of(context).size.height * 0.2
                : MediaQuery.of(context).size.height * 0.25,
            child: SfRadialGauge(
              axes: [
                RadialAxis(
                  minimum: 0,
                  maximum: 100,
                  axisLineStyle: const AxisLineStyle(
                    thickness: 20,
                    cornerStyle: CornerStyle.bothFlat,
                  ),
                  ranges: [
                    GaugeRange(
                      startValue: 0,
                      endValue: 70,
                      color: Colors.green.withOpacity(0.8),
                      startWidth: 20,
                      endWidth: 20,
                    ),
                    GaugeRange(
                      startValue: 70,
                      endValue: 90,
                      color: Colors.orange.withOpacity(0.8),
                      startWidth: 20,
                      endWidth: 20,
                    ),
                    GaugeRange(
                      startValue: 90,
                      endValue: 100,
                      color: Colors.red.withOpacity(0.8),
                      startWidth: 20,
                      endWidth: 20,
                    ),
                  ],
                  pointers: [
                    NeedlePointer(
                      value: value,
                      enableAnimation: true,
                      needleLength: 0.8,
                      needleColor: needleColor,
                      knobStyle: KnobStyle(
                        color: needleColor,
                        borderWidth: 2,
                        borderColor: Colors.white,
                      ),
                    ),
                  ],
                  annotations: [
                    GaugeAnnotation(
                      widget: Text(
                        "${value.toStringAsFixed(1)}%",
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                      positionFactor: 0.75,
                      angle: 90,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
