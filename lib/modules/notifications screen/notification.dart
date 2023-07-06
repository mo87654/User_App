import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);


  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {


Timer? timer;
  late SharedPreferences prefs;
  List<String> Notifications = [];
  bool notificationDisplayed = false;
  String previousState = "";
  List<String> Notificationstime = [];
  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      Notifications = prefs.getStringList('notifications') ?? [];
      Notificationstime = prefs.getStringList('notification_time') ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    initPrefs();

  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  InitializationSettings initializationSettings =
  InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  );

  showNotification() async {
    var formattedTime = DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now());


    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    var play = 'Hello dear, '
        'Your child is now at home';


    await flutterLocalNotificationsPlugin.show(
        0,
        'Hello dear',
        'Your child is now at home',
        platformChannelSpecifics,
        payload: 'item x');

    setState(() {
      Notifications.add(play);
      Notificationstime.add(formattedTime);
    });

    await prefs.setStringList('notifications', Notifications);
    prefs.setStringList('notification_time', Notificationstime);


  }

  showSecondNotification() async {
    var formattedTime2 = DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now()); // تنسيق الوقت


    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    var playload1 = 'Hello dear, '
        'Your child is now in bus';
    //await flutterLocalNotificationsPlugin.cancelAll();

    await flutterLocalNotificationsPlugin.show(
        0,
        'Hello dear',
        'Your child is now in bus',
        platformChannelSpecifics,
        payload: 'item x');

    setState(() {
      Notifications.add(playload1);
      Notificationstime.add(formattedTime2);
    });

    await prefs.setStringList('notifications', Notifications);
    prefs.setStringList('notification_time', Notificationstime);


  }
  showThirdNotification() async {
    var formattedTime3 = DateFormat('yyyy-MM-dd hh:mm a').format(DateTime.now()); // تنسيق الوقت


    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    var playload = 'Hello dear, '
        'Your child has arrived safely at school';
    //await flutterLocalNotificationsPlugin.cancelAll();

    await flutterLocalNotificationsPlugin.show(
        0,
        'Hello dear',
        'Your child has arrived safely at school',
        platformChannelSpecifics,
        payload: 'item x');

    setState(() {
      Notifications.add(playload);
      Notificationstime.add(formattedTime3);
    });

    await prefs.setStringList('notifications', Notifications);
    prefs.setStringList('notification_time', Notificationstime);


  }


  bool isButtonVisible = true;

  bool isChecked = false;

  Color textBackgroundColor = Colors.white;



  void onButtonPressed() {
    setState(() {
      isButtonVisible = false;
      textBackgroundColor = Colors.grey[300]!;
      isChecked = true;
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 15), (timer) async {
      CollectionReference users = FirebaseFirestore.instance.collection('Students');
      final user = FirebaseAuth.instance.currentUser!;
      final String uid = user.uid;
      var state = await users.doc(uid).get().then((value) {
        return value.get('state');
      });

      print("Current state: $state");
      print("Previous state: $previousState");
      if (    state != previousState && state == "0") {
        setState(() {});
        showNotification();
        print("Your child is now at home");
        setState(() {
          previousState = state;
        });
      } else if (  state != previousState && state == "1") {
        setState(() {});
        showSecondNotification();
        print("Your child is now on the bus");
        setState(() {
          previousState = state;
        });
        // previousState = "1";
      } else if ( state != previousState && state == "2"){
        setState(() {});
        showThirdNotification();
        print("Your child is now at school");
        setState(() {
          previousState = state;
        });
        //  previousState = "2";
      }
      // setState(() {
      //   previousState = state;
      // });
    });
  }
  void clearNotifications() async {


    await prefs.remove('notifications');
    await prefs.remove('notification_time');

    setState(() {
      Notifications.clear();
      Notificationstime.clear();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications',
          style: TextStyle(
              color: Color(0xff515281)
          ),
        ),
        backgroundColor: Colors.white,
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
        //reverse: true,
        itemCount: Notifications.length,
        itemBuilder: (BuildContext context, int index) {
          final notification = Notifications[index];
          final notificationtime = index < Notificationstime.length ? Notificationstime[index] : "";
          return Container(
            margin: EdgeInsetsDirectional.fromSTEB(2, 20, 2, 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[300]!,
                borderRadius: BorderRadius.circular(6.0)),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.message_outlined, color: Colors.lightBlue,),
                      SizedBox(width: 6,),
                      Text(
                        "smart tracking system",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff644f73),
                        ),
                      ),
                      SizedBox(width: 6,),
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: Colors.black38,
                      ),
                      SizedBox(width: 6,),
                      Text(
                        notificationtime,
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.library_add_check_rounded,
                        color: Colors.green,),

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
    //autoCancel: true,
    ticker: 'ticker');


const NotificationDetails platformChannelSpecifics =
NotificationDetails(android: androidPlatformChannelSpecifics);

