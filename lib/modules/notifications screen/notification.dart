import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
  DateTime scheduledTime = DateTime.now();
  late SharedPreferences prefs;
  List<String> Notifications = [];
  bool notificationDisplayed = false;

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      Notifications = prefs.getStringList('notifications') ?? [];
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
    initPrefs();

  }
  showNotification() async {

      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      const InitializationSettings initializationSettings =
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      );

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      var play = 'Hello dear, '
          'Your child is now at home';
      //await flutterLocalNotificationsPlugin.cancelAll();
      if (!Notifications.contains(play)) {
        await flutterLocalNotificationsPlugin.show(
            0,
            'Hello dear',
            'Your child is now at home',
            platformChannelSpecifics,
            payload: 'item x');

        setState(() {
          Notifications.add(play);
        });

        await prefs.setStringList('notifications', Notifications);

    }
  }


  showSecondNotification() async {
    if (!notificationDisplayed) {
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      const InitializationSettings initializationSettings =
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      );

      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      final lastScheduledTimeMillis =
          prefs.getInt('lastScheduledTimeMillis') ?? DateTime.now().millisecondsSinceEpoch;
       scheduledTime = DateTime.fromMillisecondsSinceEpoch(lastScheduledTimeMillis);


      await prefs.setInt('lastScheduledTimeMillis', scheduledTime.millisecondsSinceEpoch);

      setState(() {
        scheduledTime = scheduledTime;
      });
      var play = 'Hello dear, '
          'Your child is now on the bus';
      //await flutterLocalNotificationsPlugin.cancelAll();
      if (!Notifications.contains(play)) {
        await flutterLocalNotificationsPlugin.show(
            0,
            'Hello dear',
            'Your child is now on the bus',
            platformChannelSpecifics,
            payload: 'item x');

        setState(() {
          Notifications.add(play);
        });

        await prefs.setStringList('notifications', Notifications);
        notificationDisplayed=true;
      }
    }
  }

  showThirdNotification() async {

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const InitializationSettings initializationSettings =
    InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    var play = 'Hello dear, '
        'Your child is now in school';
    //await flutterLocalNotificationsPlugin.cancelAll();
    if (!Notifications.contains(play)) {
      await flutterLocalNotificationsPlugin.show(
          0,
          'Hello dear',
          'Your child is now in school',
          platformChannelSpecifics,
          payload: 'item x');

      setState(() {
        Notifications.add(play);
      });

      await prefs.setStringList('notifications', Notifications);

    }
  }
  void clearNotifications() async {
    // Remove all notification ids, titles, and texts from SharedPreferences
    for (var play in Notifications) {
      await prefs.remove(play);
    }
    await prefs.remove('notifications');
    setState(() {
      Notifications.clear();
    });
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

  void startTimer() {
    Timer.periodic(const Duration(seconds: 15), (timer) async {
      //code to run on every 20 seconds
      CollectionReference users =
      FirebaseFirestore.instance.collection('Students');
      final user = FirebaseAuth.instance.currentUser!;
      final String uid = user.uid;
      var state = await users.doc(uid).get().then((value) {
        return value.get('state');
      });

      if (state == "0") {
        setState(() {}); // إعادة بناء واجهة المستخدم
        Future.delayed(Duration(milliseconds: 100), () {
          showNotification();
        });
        print("Your child is now at home");
      } else if (state == "1") {
        showSecondNotification();
        print("Your child is now on the bus");
      } else if (state == "2"){
        showThirdNotification();
        print("Your child is now at school");
      }
    });
  }

    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0,

          actions: [
            IconButton(
              icon: Icon(Icons.delete),
              color: Color(0xff515281),
              onPressed: clearNotifications,
            ),
          ],
        ),
        body: Notifications.isEmpty
            ? Center(
          child: Text(
            'No notifications yet',
            style: TextStyle(fontSize: 20),
          ),
        ):
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
                            DateFormat('yyyy-MM-dd HH:mm:ss').format(scheduledTime),
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 10
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
                                fontSize: 15,
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


//   var scheduledTime = DateTime.now().add(Duration(minutes: 5));
// String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(scheduledTime);


const AndroidNotificationDetails androidPlatformChannelSpecifics =
AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    importance: Importance.high,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,
    enableLights: true,
    visibility: NotificationVisibility.public,
    autoCancel: true,
    ticker: 'ticker');

const NotificationDetails platformChannelSpecifics =
NotificationDetails(android: androidPlatformChannelSpecifics);






// showThirdNotification() async {
//   final prefs = await SharedPreferences.getInstance();
//   final hasNotificationShown = prefs.getBool('hasNotificationShown') ?? false;
//
//   if (!hasNotificationShown) {
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
//     const InitializationSettings initializationSettings =
//     InitializationSettings(
//       android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//     );
//
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//     );
//
//     await flutterLocalNotificationsPlugin.show(
//         0,
//         'Hello dear',
//         'Your child is now in school',
//         platformChannelSpecifics,
//         payload: 'item x');
//     Notifications.add('Hello dear, '
//         'Your child is now in school');
//
//     await flutterLocalNotificationsPlugin.schedule(
//       0,
//       'Hello dear',
//       'Your child is now in school',
//       scheduledTime,
//       platformChannelSpecifics,
//     );
//     await prefs.setBool('hasNotificationShown', true);
//   }
// }
