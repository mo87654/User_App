import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);


  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  Future<void> _getSavedNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Notifications = prefs.getStringList('notifications') ?? [];
    //if (!Notifications.contains('Hello dear, Your child has boarded the bus to go school')) {
      Notifications.add('Hello dear, Your child has boarded the bus to go school');
      prefs.setStringList('notifications', Notifications);
   // }
  }

  @override
  void initState() {
    super.initState();
    _getSavedNotifications();
  }

  @override
  Future<void> dispose() async {
    // Clean up the notifications list
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('notifications');
    super.dispose();
  }

  @override
    bool isButtonVisible = true;
    bool isButtonVisible1 = true;
    bool isButtonVisible2 = true;
    bool isButtonVisible3 = true;
    bool isChecked = false;
    bool isChecked1 = false;
    bool isChecked2 = false;
    bool isChecked3 = false;
    Color textBackgroundColor = Colors.white;
    Color textBackgroundColor1 = Colors.white;
    Color textBackgroundColor2 = Colors.white;
    Color textBackgroundColor3 = Colors.white;
    String textMessage = 'Your child has boarded the bus to go home';
    String textMessage1 = 'Your child has left the bus heading home';
    String textMessage2 = 'Your child has boarded the bus to go home';
    String textMessage3 = 'Your child has left the bus heading home';

    void onButtonPressed() {
      setState(() {
        isButtonVisible = false;
        textBackgroundColor = Colors.grey[300]!;
        textMessage = 'Your child has now left the bus and headed to school';
        isChecked = true;
      });
    }
    void onButtonPressed1() {
      setState(() {
        isButtonVisible1 = false;
        textBackgroundColor1 = Colors.grey[300]!;
        textMessage1 = 'Your child has now left the bus and headed to school';
        isChecked1 = true;
      });
    }
    void onButtonPressed2() {
      setState(() {
        isButtonVisible2 = false;
        textBackgroundColor2 = Colors.grey[300]!;
        textMessage2 = 'Your child has now left the bus and headed to school';
        isChecked2 = true;
      });
    }

    void onButtonPressed3() {
      setState(() {
        isButtonVisible3 = false;
        textBackgroundColor3 = Colors.grey[300]!;
        textMessage3 = 'Your child has now left the bus and headed to school';
        isChecked3 = true;
      });
    }


    Timer mytimer = Timer.periodic(const Duration(seconds: 20), (timer) async {
      //code to run on every 5 seconds


      CollectionReference users = FirebaseFirestore.instance.collection(
          'Students');
      final user = FirebaseAuth.instance.currentUser!;
      final String uid = user.uid;
      var mac = await users.doc(uid).get().then((value) {
        return value.get('MAC-address');
        //print('////////////////////////////////////////////');
        // print(value.get('MAC-address'));
        // print('////////////////////////////////////////////');
      }
      );

      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('mac addresses').get();
      final List<String> fieldValues = [];
      for (final QueryDocumentSnapshot documentSnapshot in snapshot.docs) {
        final String fieldValue = documentSnapshot.get('mac');
        fieldValues.add(fieldValue);


        bool macFound = false;
        bool notificationShown = false;
        for (var fieldValue in fieldValues) {
          if (fieldValue == mac) {
            macFound = true;
            if (!notificationShown) { // التأكد من عدم عرض الإشعار مرة أخرى
              showNotification();

              notificationShown = true; // تعيين القيمة على true بعد عرض الإشعار
            }
            notificationShown = false;
          }
        }
        if (macFound) {
          print('$mac exists in the list!');
        } else {
          print('$mac does not exist in the list.');
        }
      }
    });


    Widget build(BuildContext context) {
      return Scaffold(
        body:
        ListView.builder(
          itemCount: Notifications.length,
          itemBuilder: (BuildContext context, int index) {
            final notification = Notifications[index];
            return Container(
              margin: EdgeInsetsDirectional.fromSTEB(2, 20, 2, 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: textBackgroundColor,
                  borderRadius: BorderRadius.circular(6.0)),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.message_outlined),
                        Text(
                          "smart tracking system",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff644f73),
                          ),
                        ),
                        CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.black38,
                        ),
                        Text(
                          formattedTime,
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              notification,
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: isButtonVisible,
                            child: TextButton(

                              onPressed: onButtonPressed,


                              style: TextButton.styleFrom(
                                primary: const Color(0xff515281),
                                backgroundColor: const Color(0xffE0E0E0),
                              ),
                              child: Text(
                                'OK',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Visibility(
                            visible: isChecked,
                            child: Icon(Icons.library_add_check_rounded,
                              color: Colors.lightBlueAccent[100],)),

                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),


      );
    }
  }

  List<String> Notifications = [];
  var scheduledTime = DateTime.now().add(Duration(seconds: 5));
String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(scheduledTime);


showNotification() async {
    final prefs = await SharedPreferences.getInstance();
    final hasNotificationShown = prefs.getBool('hasNotificationShown') ?? false;


    if (!hasNotificationShown) {
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

      const InitializationSettings initializationSettings =
      InitializationSettings(
        android: initializationSettingsAndroid,

      );

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          'your channel id',
          'your channel name',

          importance: Importance.high,
          priority: Priority.high,
          ticker: 'ticker');
      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationsPlugin.show(
          0,
          'Hello dear',
          'Your child has boarded the bus to go school',
          platformChannelSpecifics,
          payload: 'item x');
      /* notifications.add('Hello dear, '
        'Your child has boarded the bus to go school');*/

      await flutterLocalNotificationsPlugin.schedule(
        0,
        'Hello dear',
        'Your child has boarded the bus to go school',
        scheduledTime,
        platformChannelSpecifics,
      );
      await prefs.setBool('hasNotificationShown', true);
    }
  }


  Future onSelectNotification(String payload) async {
    // handle notification tap here
  }


