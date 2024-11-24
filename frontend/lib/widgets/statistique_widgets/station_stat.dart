import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StationStats extends StatelessWidget {
  final List<double> lockerUsageRates;
  final List<double> averageUsageTime;

  const StationStats({
    Key? key,
    required this.lockerUsageRates,
    required this.averageUsageTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          screenWidth > 700
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildSectionCard(
                  context,
                  title: "Locker Usage Rates",
                  chart: _buildBarChart(context),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildSectionCard(
                  context,
                  title: "Average Locker Usage Time",
                  chart: _buildLineChart(context),
                ),
              ),
            ],
          )
              : Column(
            children: [
              _buildSectionCard(
                context,
                title: "Locker Usage Rates",
                chart: _buildBarChart(context),
              ),
              const SizedBox(height: 16),
              _buildSectionCard(
                context,
                title: "Average Locker Usage Time",
                chart: _buildLineChart(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context, {required String title, required Widget chart}) {
    return Card(
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.1),
      color: Colors.white, // Set the card background to white
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 16),
            chart,
          ],
        ),
      ),
    );
  }




  Widget _buildBarChart(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 20,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "${value.toInt()}%",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "casier ${value.toInt() + 1}",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          barGroups: List.generate(
            lockerUsageRates.length,
                (index) => BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: lockerUsageRates[index],
                  color: Colors.blue.shade300,
                  width: 20,
                  borderRadius: BorderRadius.circular(8),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white, // Set the background color
        ),
      ),
    );
  }

  Widget _buildLineChart(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: 20,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: 20,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "${value.toInt()}m",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    "${value.toInt()}",
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                averageUsageTime.length,
                    (index) => FlSpot(index.toDouble(), averageUsageTime[index]),
              ),
              isCurved: true,
              color: Colors.blue.shade400,
              barWidth: 4,
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.shade100.withOpacity(0.5),
              ),
              dotData: FlDotData(show: true),
            ),
          ],
          backgroundColor: Colors.white, // Set the background color
        ),
      ),
    );
  }

}
