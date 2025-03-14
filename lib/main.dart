//Tolling app entry point
//
//Initializing WorkManager, i.e. background tasks, on app startup
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';
import 'services/toll_sync_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // Set to false in production
  );

  Workmanager().registerPeriodicTask(
    "syncTollData",
    "fetchLatestTollRates",
    frequency: Duration(hours: 12), // Runs every 12 hours
  );

  runApp(ToolApp());
}
