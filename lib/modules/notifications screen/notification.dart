import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/modules/notifications%20screen/notificationpart2.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);


  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {



@override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPrefs();

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




  void clearNotifications() async {


    await prefs.remove('notifications');
    await prefs.remove('notification_time');
     setState(() {
  Notifications.clear();
  Notificationstime.clear();
           });
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();

setState(() {
  Notifications = prefs.getStringList('notifications') ?? [];
  Notificationstime = prefs.getStringList('notification_time') ?? [];
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

