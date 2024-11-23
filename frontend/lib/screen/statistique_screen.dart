import 'package:fintech_dashboard_clone/state/StationState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure you have this package added to your project
import 'package:fintech_dashboard_clone/layout/app_layout.dart';
import 'package:fintech_dashboard_clone/layout/top_app_bar.dart';

import '../models/enums/navigation_items.dart';
import '../sections/statistique_section/expense_income_chart.dart';
import '../sections/statistique_section/last_users_map.dart';
import '../sections/statistique_section/statistics.dart';
import '../widgets/statistique_widgets/smoke_alarm_status.dart';
import '../widgets/statistique_widgets/station_stat.dart';
import '../widgets/statistique_widgets/temperature_tracker.dart';

class Statistique extends StatefulWidget {
  const Statistique({Key? key}) : super(key: key);

  @override
  State<Statistique> createState() => _StatistiqueState();
}

class _StatistiqueState extends State<Statistique> {
  String selectedStation = "Station 1";

  @override
  Widget build(BuildContext context) {
    final stationState = Provider.of<StationsStates>(context); // Access state
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 720;

    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          activeTab:  NavigationItems.panel,

          content: Column(
            children: [
              const SizedBox(height: 20),
              const TopAppBar(title: 'Dashboard - Statistiques'),
              const SizedBox(height: 20),

              // Station Selector
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sélectionnez une station:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: selectedStation,
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.blueAccent),
                      items: stationState.stationData.keys
                          .map(
                            (station) => DropdownMenuItem(
                          value: station,
                          child: Text(station),
                        ),
                      )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedStation = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Main Tab Content
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      // Tab Bar
                      TabBar(
                        indicatorColor: Colors.blueAccent,
                        labelColor: Colors.blueAccent,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(icon: Icon(Icons.bar_chart), text: "Station Overview"),
                          Tab(icon: Icon(Icons.map), text: "Additional Stats"),
                        ],
                      ),

                      // Tab Views
                      Expanded(
                        child: TabBarView(
                          children: [
                            // First Tab: Locker Temperature Monitor, StationStats, SmokeAlarmStatus
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: maxWidth < 500 ? MediaQuery.of(context).size.height * 0.4 : MediaQuery.of(context).size.height * 0.5,
                                    child: SmokeAlarmStatus(
                                      smokeLevel: stationState.getStationSmokeLevel(selectedStation),
                                      fireAlarmStatus:
                                      stationState.getStationFireAlarmStatus(selectedStation),
                                    ),
                                  ),


                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    child: LockerTemperatureMonitor(
                                      temperatures: stationState.getStationTemperatures(selectedStation),
                                    ),
                                  ),

                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: isMobile
                                        ? MediaQuery.of(context).size.height * 0.9
                                        : MediaQuery.of(context).size.height * 0.6,
                                    child: StationStats(
                                      lockerUsageRates: stationState.getStationLockerUsageRates(selectedStation),
                                      averageUsageTime:
                                      stationState.getStationAverageUsageTime(selectedStation),
                                    ),

                                  ),
                                ],
                              ),
                            ),

                            // Second Tab: ExpenseIncomeCharts, StatisticsCharts, LastUsersMap
                            SingleChildScrollView(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.4,
                                    child: const ExpenseIncomeCharts(),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: maxWidth < 880 ? MediaQuery.of(context).size.height * 0.7 :MediaQuery.of(context).size.height * 0.5 ,
                                    child: StatisticsCharts(
                                      usedPercentage: stationState.getStationPieChartData(selectedStation)["used"] ?? 0.0,
                                      availablePercentage: stationState.getStationPieChartData(selectedStation)["available"] ?? 0.0,
                                    ),
                                  ),

                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * 0.5,
                                    child: LastUsersMap(),
                                  ),

                                ],
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
    );
  }
}
