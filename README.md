# flutter_send_FCM_Api
Flutter code to send push notifications using Firebase Cloud Messaging easy way


## Packages 
add the http package to your project
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: 
```
## FCM Server Key
get your FCM server key form the firebase project setting FCM section

replace the serverKey string in fcm_sender_service.dart 

```dart
  final String serverKey = "replace your api with this string";
```
