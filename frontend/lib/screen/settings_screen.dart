import 'package:fintech_dashboard_clone/state/StationState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fintech_dashboard_clone/layout/app_layout.dart';
import 'package:fintech_dashboard_clone/layout/top_app_bar.dart';

import '../models/enums/navigation_items.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    final stationState = Provider.of<StationsStates>(context);

    return Scaffold(
      body: SafeArea(
        child: AppLayout(
          activeTab:  NavigationItems.settings,
          content: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const TopAppBar(title: 'Settings'),
                const SizedBox(height: 20),

                // General Settings Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "General Settings",
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Global ON/OFF Switch
                      Card(
                        elevation: 4,
                        child: ListTile(
                          leading: Icon(
                            stationState.allOutletsOn
                                ? Icons.power
                                : Icons.power_off,
                            color: stationState.allOutletsOn
                                ? Colors.green
                                : Colors.red,
                          ),
                          title: Text(
                            stationState.allOutletsOn
                                ? "Turn OFF All Outlets"
                                : "Turn ON All Outlets",
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                          trailing: Switch(
                            value: stationState.allOutletsOn,
                            onChanged: (value) {
                              _showConfirmationDialog(
                                context,
                                isGlobal: true,
                                stationId: null,
                                newValue: value,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Station Controls Section
                      Text(
                        "Station Controls",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Individual Station Controls
                      ...stationState.stationStates.entries.map((entry) {
                        final stationId = entry.key;
                        final isOn = entry.value;

                        return Card(
                          elevation: 3,
                          child: ListTile(
                            leading: Icon(
                              isOn ? Icons.power : Icons.power_off,
                              color: isOn ? Colors.green : Colors.red,
                            ),
                            title: Text(
                              "Station $stationId",
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                            trailing: Switch(
                              value: isOn,
                              onChanged: (value) {
                                _showConfirmationDialog(
                                  context,
                                  isGlobal: false,
                                  stationId: stationId,
                                  newValue: value,
                                );
                              },
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, {
        required bool isGlobal,
        int? stationId,
        required bool newValue,
      }) {
    final actionTitle = newValue ? "Turn ON" : "Turn OFF";
    final target = isGlobal ? "all outlets" : "Station ${stationId.toString()}";

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$actionTitle Confirmation"),
          content: Text(
            "Are you sure you want to $actionTitle $target?",
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                final stationState = Provider.of<StationsStates>(
                  context,
                  listen: false,
                );
                if (isGlobal) {
                  stationState.setAllOutletsOn(newValue);
                } else if (stationId != null) {
                  stationState.setStationState(stationId, newValue);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
