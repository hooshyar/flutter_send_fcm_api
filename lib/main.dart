import 'package:flutter/material.dart';
import 'package:flutter_send_fcm_api/services/fcm_sender_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final NotificationsService _notificationsService = NotificationsService();
  final TextEditingController _tokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FCM send notif',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _tokenController,
                minLines: 3,
                maxLines: 5,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('target device token')),
              ),
              Divider(
                color: Colors.transparent,
                height: 50,
              ),
              ElevatedButton(
                child: Text('send a notif'),
                onPressed: () {
                  debugPrint(_tokenController.value.text);
                  _notificationsService.sendPushMessage(
                      tokens: [
                        _tokenController.value.text
                      ], // you can add mutltiple tokens here
                      title: "title",
                      body: "body",
                      data: {'screen': 'users'});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
