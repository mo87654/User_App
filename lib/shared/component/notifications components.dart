import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/modules/notifications%20screen/notification.dart';

Timer? timer;
late SharedPreferences prefs;
List<String> Notifications = [];
bool notificationDisplayed = false;
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
List<String> Notificationstime = [];



Future<String> getStateFromFirestore() async {

  final CollectionReference users =
  FirebaseFirestore.instance.collection('Students');
  final user = FirebaseAuth.instance.currentUser!;
  final String uid = user.uid;
  final DocumentSnapshot userSnapshot = await users.doc(uid).get();
  return userSnapshot.get('name');
}


void startTimer() {
  timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Students');
    final user = FirebaseAuth.instance.currentUser!;
    final String uid = user.uid;
    var state = await users.doc(uid).get().then((value) {
      return value.get('state');

    });

    final userRef = users.doc(user.uid);
    final userSnapshot = await userRef.get();
    var previousState = userSnapshot.get('previousState');

    print("Current state: $state");
    print("Previous state: $previousState");
    if (state != previousState) {
      if (state == "0") {
        showNotification();
        print("Your child is now at home");
      } else if (state == "1") {
        showSecondNotification();
        print("Your child is now on the bus");
      } else if (state == "2") {
        showThirdNotification();
        print("Your child is now at school");
      }

      // تحديث الحالة السابقة في Firestore
      await userRef.update({'previousState': state});

      previousState = state;
    }

  });
}
showNotification() async {
  var formattedTime = DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now());
  final String name = await getStateFromFirestore();
  var play = 'dear $name, '
      'Your child is now at home';


  await flutterLocalNotificationsPlugin.show(
      0,
      ' dear $name',
      'Your child is now at home',
      platformChannelSpecifics,
      payload: 'item x');


  Notifications.add(play);
  Notificationstime.add(formattedTime);



  await prefs.setStringList('notifications', Notifications);
  prefs.setStringList('notification_time', Notificationstime);

}

showSecondNotification() async {
  var formattedTime2 = DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now()); // تنسيق الوقت


  final String name = await getStateFromFirestore();

  var playload1 = 'dear $name, '
      'Your child is now in bus';
  //await flutterLocalNotificationsPlugin.cancelAll();

  await flutterLocalNotificationsPlugin.show(
      0,
      'dear $name',
      'Your child is now in bus',
      platformChannelSpecifics,
      payload: 'item x');


  Notifications.add(playload1);
  Notificationstime.add(formattedTime2);


  await prefs.setStringList('notifications', Notifications);


  prefs.setStringList('notification_time', Notificationstime);

}
showThirdNotification() async {
  var formattedTime3 = DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now()); // تنسيق الوقت
  final String name = await getStateFromFirestore();

  var playload = 'dear $name, '
      'Your child has arrived safely at school';
  //await flutterLocalNotificationsPlugin.cancelAll();

  await flutterLocalNotificationsPlugin.show(
      0,
      'dear $name',
      'Your child has arrived safely at school',
      platformChannelSpecifics,
      payload: 'item x');


  Notifications.add(playload);
  Notificationstime.add(formattedTime3);

  await prefs.setStringList('notifications', Notifications);
  prefs.setStringList('notification_time', Notificationstime);


}
