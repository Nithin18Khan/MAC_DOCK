//Basic method to push notification through firebase cloud messaging






// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';





// class NotificationService extends GetxService {
//   Future<void> initFirebaseMessaging() async {
//     // Request permissions and initialize listeners
//     FirebaseMessaging.instance.requestPermission();
//     FirebaseMessaging.instance.getToken().then((token) {
//       print("FCM Token: $token"); // For testing purposes, to see the token
//     });

//     // Listen for foreground notifications
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       notificationMessage.value = message.notification?.body ?? '';
//       Get.snackbar('New Notification', notificationMessage.value);
//     });

//     listenToMessages();
//   }
// }
