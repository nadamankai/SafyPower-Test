import 'package:flutter/material.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/statistics.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/last_users_map.dart';
import 'package:fintech_dashboard_clone/layout/statistique_layout.dart';
import 'package:fintech_dashboard_clone/sections/statistique_section/expense_income_chart.dart';

class Statistique extends StatefulWidget {
  const Statistique({Key? key}) : super(key: key);

  @override
  State<Statistique> createState() => _StatistiqueState();
}

class _StatistiqueState extends State<Statistique> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final isMobile = maxWidth < 600;

    return Scaffold(
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
                        SizedBox(
                          height: isMobile
                              ? MediaQuery.of(context).size.height *
                                  0.6 // Hauteur souhaitée de la première section pour mobile
                              : MediaQuery.of(context).size.height * 0.4,
                          child: const ExpenseIncomeCharts(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: const StatisticsCharts(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height *
                              0.6, // Hauteur souhaitée de la deuxième section
                          child: LastUsersMap(),
                        ),
                        const SizedBox(
                          height: 30,
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
    );
  }
}
