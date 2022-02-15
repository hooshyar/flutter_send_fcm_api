import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationsService {
  //TODO: replace this with your own server serverKey, could be found from setting FCM section
  final String serverKey = "replace with your server key";

  // final String senderID = "214993471933";

  String _constructFCMPayload({
    required String token,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) {
    return jsonEncode({
      'to': token,
      'data': data,
      "collapse_key": "type_a",
      'notification': {'title': title, 'body': body, 'sound': "default"},
      "priority": "high",
      "apns": {
        "headers": {"apns-priority": "10"},
        "payload": {
          "aps": {
            "headers": {
              'apns-priority': '10',
            },
            "alert": {"body": "$title", "title": "$body"},
            "badge": 2,
            "sound": "default"
          }
        }
      },
      "android": {
        "priority": 'high',
        "notification": {
          "sound": 'default',
        }
      },
    });
  }

  Future<void> sendPushMessage({
    required List<String> tokens,
    required String title,
    required String body,
    Map<String, dynamic>? data,
  }) async {
    for (int i = 0; i < tokens.length; i++) {
      try {
        await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'key=$serverKey',
          },
          body: _constructFCMPayload(
              token: tokens[i], title: title, body: body, data: data),
        );
        print('FCM request for device sent!');
      } catch (e) {
        print(e);
      }
    }
  }
}
