import 'package:flutter/material.dart';

class StationsStates extends ChangeNotifier {
  bool allOutletsOn = false;
  Map<int, bool> stationStates = {1: false, 2: false, 3: false, 4: false, 5: false};
  final Map<String, Map<String, dynamic>> _stationData = {
    "Station 1": {
      "smokeLevel": 85,
      "fireAlarmStatus": 36,
      "temperatures": [22.5, 24.0, 21.8, 23.4, 25.1, 22.9],
      "lockerUsageRates": [75.0, 60.0, 85.0, 50.0, 65.0, 70.0],
      "averageUsageTime": [30.0, 35.0, 40.0, 25.0, 20.0, 30.0],
      "pieChartData": {"used": 50.0, "available": 50.0},

    },
    "Station 2": {
      "smokeLevel": 45,
      "fireAlarmStatus": 5,
      "temperatures": [22.5, 24.0, 21.8, 23.4, 25.1, 22.9],
      "lockerUsageRates": [75.0, 60.0, 85.0, 50.0, 65.0, 70.0],
      "averageUsageTime": [30.0, 35.0, 40.0, 25.0, 20.0, 30.0],
      "pieChartData": {"used": 10.0, "available": 90.0},

    },
    "Station 3": {
      "smokeLevel": 15,
      "fireAlarmStatus": 5,
      "temperatures": [22.5, 24.0, 21.8, 23.4, 25.1, 22.9],
      "lockerUsageRates": [75.0, 60.0, 85.0, 50.0, 65.0, 70.0],
      "averageUsageTime": [30.0, 35.0, 40.0, 25.0, 20.0, 30.0],
      "pieChartData": {"used": 20.0, "available": 80.0},

    },
    // Add other stations here
  };

  // Expose raw data if necessary
  Map<String, Map<String, dynamic>> get stationData => _stationData;

  // Get smoke level
  double getStationSmokeLevel(String stationName) {
    return (_stationData[stationName]?["smokeLevel"] ?? 0).toDouble();
  }

  // Get fire alarm status
  double getStationFireAlarmStatus(String stationName) {
    return (_stationData[stationName]?["fireAlarmStatus"] ?? 0).toDouble();
  }

  // Get temperatures
  List<double> getStationTemperatures(String stationName) {
    return List<double>.from(_stationData[stationName]?["temperatures"] ?? []);
  }

  // Get locker usage rates
  List<double> getStationLockerUsageRates(String stationName) {
    return List<double>.from(_stationData[stationName]?["lockerUsageRates"] ?? []);
  }

  // Get average usage time
  List<double> getStationAverageUsageTime(String stationName) {
    return List<double>.from(_stationData[stationName]?["averageUsageTime"] ?? []);
  }

  // Get pie chart data
  Map<String, double> getStationPieChartData(String stationName) {
    // Use stationStates mapped by String keys
    bool stationState = stationStates[_getStationIdFromName(stationName)] ?? false;
    if(stationState) {
      return Map<String, double>.from(
          _stationData[stationName]?["pieChartData"]
      );
    }
    return {"used": 0.0, "available": 100.0} ;
  }

  void setAllOutletsOn(bool value) {
    allOutletsOn = value;
    stationStates.updateAll((key, _) => value);
    notifyListeners();
  }

  void setStationState(int stationId, bool value) {
    stationStates[stationId] = value;

    // Adjust `allOutletsOn` if all stations are ON/OFF
    allOutletsOn = stationStates.values.every((state) => state);
    notifyListeners();
  }

  bool? getStationState(int stationId) {
    return stationStates[stationId] ?? true;
  }

  // Helper function to map station names to IDs
  int _getStationIdFromName(String stationName) {
    switch (stationName) {
      case "Station 1":
        return 1;
      case "Station 2":
        return 2;
      case "Station 3":
        return 3;
      default:
        throw ArgumentError("Unknown station name: $stationName");
    }
  }
}
