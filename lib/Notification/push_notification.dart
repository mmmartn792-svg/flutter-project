// import 'dart:developer';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushNotificationservice {
//   static FirebaseMessaging massaging = FirebaseMessaging.instance;
//   static Future inite() async {
//     await massaging.requestPermission();
//     String? token = await massaging.getToken();
//     log(token ?? "null");
//     FirebaseMessaging.onBackgroundMessage(handelbackgroundmessage);
//   }

//   @pragma('vm:entry-point')
//   static Future<void> handelbackgroundmessage(RemoteMessage message) async {
//     await Firebase.initializeApp();
//     log(message.notification!.title ?? "null");
//   }
// }
// //
