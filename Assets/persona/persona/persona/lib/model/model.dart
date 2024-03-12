import 'package:persona/model/local_notifications.dart';
import 'package:persona/screens/util.dart';
import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';

class Approval {
  final String activityId;
  final String dateCreated;
  final String serviceLevelMonitor;
  final String processId;
  final String processName;
  final String due;
  final String activityName;
  final String description;
  final String id;
  final String label;
  final int processVersion;

  const Approval({
    required this.activityId,
    required this.dateCreated,
    required this.serviceLevelMonitor,
    required this.processId,
    required this.processName,
    required this.due,
    required this.activityName,
    required this.description,
    required this.id,
    required this.label,
    required this.processVersion,
  });

  factory Approval.fromJson(Map<String, dynamic> json) {
    return Approval(
      activityId: json['activityId'] as String,
      dateCreated: json['dateCreated'] as String,
      serviceLevelMonitor: json['serviceLevelMonitor'] as String,
      processId: json['processId'] as String,
      processName: json['processName'] as String,
      due: json['due'] as String,
      activityName: json['activityName'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      label: json['label'] as String,
      processVersion: json['processVersion'] as int,
    );
  }
}


class BackgroundService {
  static Future <void> onStart() async{
    await LocalNotifications.init();
    await fetchDataFromRepository();
    LocalNotifications.showSimpleNotification(title: 'test', body: 'bambang', payload: 'bimbing');

    Timer.periodic(Duration(minutes: 15), (timer) async {
      await LocalNotifications.init();
      // await fetchDataFromRepository();
      LocalNotifications.showSimpleNotification(title: 'test', body: 'bambang', payload: 'bimbing');
      // showSimpleNotification
    });
  }
}