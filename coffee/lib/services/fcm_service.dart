
import 'dart:convert';

import 'package:http/http.dart' as http;

class FCMService {
  static const String FCMAPI =
      "AAAAWaXbeHM:APA91bGnkVPXD3RUSxLFDy5Z0zcf-hmBwyJA7VM0TDzGI3MoOkWbVfQEWxxuikGl5IuBynltUlkAYblO1X2Fo4ll760Lsd27JWXKpDSZKWoP76Ks4wxAT08zd4oVEraal8C0Wkc5z7c9";
  static String makePayLoadWithToken(String? token, Map<String, dynamic> data,
      Map<String, dynamic> notification) {
    return jsonEncode({
      'to': token,
      'data': data,
      'notification': notification,
    });
  }

  static String makePayLoadWithTopic(String? topic, Map<String, dynamic> data,
      Map<String, dynamic> notification) {
    return jsonEncode({
      'topic': topic,
      'data': data,
      'notification': notification,
    });
  }

  static Future<void> sendPushMessage(String? token, Map<String, dynamic> data,
      Map<String, dynamic> notification) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$FCMAPI'
        },
        body: makePayLoadWithToken(token, data, notification),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
}
