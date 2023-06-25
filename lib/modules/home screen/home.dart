// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class MapScreen1 extends StatefulWidget {
//   @override
//   _MapScreen1State createState() => _MapScreen1State();
// }
//
// class _MapScreen1State extends State<MapScreen1> {
//   late GoogleMapController mapController;
//   late Stream<QuerySnapshot<Map<String, dynamic>>> _driversStream;
//   Set<Marker> markers = {};
//
//   String getCurrentUserId() {
//     final user = FirebaseAuth.instance.currentUser;
//     return user!.uid;
//   }
//
//   Future<String?> getStudBusNumber() async {
//     final userId = getCurrentUserId();
//     final studentSnapshot = await FirebaseFirestore.instance
//         .collection('Students')
//         .doc(userId)
//         .get();
//
//     final studentData = studentSnapshot.data();
//     if (studentData != null && studentData.containsKey('Bus_number')) {
//       var studentBusNum = studentData['Bus_number'];
//       print(studentBusNum.toString());
//       print("______________________________");
//       return studentBusNum.toString();
//     }
//     print("Can't find the bus number");
//     return null;
//   }
//
//   Future<void> updateLocation() async {
//     final busNumber = await getStudBusNumber();
//
//     if (busNumber != null) {
//       final snapshot = await FirebaseFirestore.instance
//           .collection('Drivers')
//           .where('Bus_number', isEqualTo: busNumber)
//           .get();
//
//       setState(() {
//         markers.clear();
//         snapshot.docs.forEach((doc) {
//           final latitude = doc.data()['latitude'] as double;
//           final longitude = doc.data()['longitude'] as double;
//           print(latitude.toString() + " " + longitude.toString());
//           print("++++++++++++++++++++++++++");
//
//           final marker = Marker(
//             markerId: MarkerId(doc.id),
//             position: LatLng(latitude, longitude),
//           );
//           markers.add(marker);
//         });
//       });
//     }
//   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       mapController = controller;
//     });
//   }
//    update() async {
//      final busNumber = await getStudBusNumber();
//      return busNumber.toString();
//    }
//   @override
//   void initState() {
//     super.initState();
//     updateLocation();
//
//     _driversStream = FirebaseFirestore.instance
//         .collection('Drivers')
//         .where('Bus_number', isEqualTo: update())
//         .snapshots();
//     if ('Bus_number' != update()){
//       markers.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//               stream: _driversStream,
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//
//                 List<Marker> markers = [];
//
//                 snapshot.data!.docs.forEach((doc) {
//                   double latitude = doc['latitude'];
//                   double longitude = doc['longitude'];
//                   print(latitude.toString() + " " + longitude.toString());
//                   print("++++++++++++++++++++++++++++++++++++");
//
//                   Marker marker = Marker(
//                     markerId: MarkerId(doc.id),
//                     position: LatLng(latitude, longitude),
//                     // You can customize the marker's appearance here
//                   );
//
//                   markers.add(marker);
//                 });
//
//                 return Stack(
//                   children: [
//                     GoogleMap(
//                       mapType: MapType.normal,
//                       initialCameraPosition: const CameraPosition(
//                         target: LatLng(30.045447, 31.233975),
//                         zoom: 6.0,
//                       ),
//                       markers: Set<Marker>.from(markers),
//                       onMapCreated: _onMapCreated,
//                     ),
//                     Positioned(
//                       top: 16,
//                       left: 16,
//                       child: FloatingActionButton(
//                         onPressed: updateLocation,
//                         child: Icon(Icons.refresh),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapScreen1 extends StatefulWidget {
  @override
  _MapScreen1State createState() => _MapScreen1State();
}

class _MapScreen1State extends State<MapScreen1> {
  final driverBusNumber =  FirebaseFirestore.instance.collection("Drivers").get();

  Color circleAvatarColor = Color(0xFF91CC04);
  String text = "At Home";
  Color textColor = Color(0xFF91CC04);
  String imageAsset = 'assets/images/At home.png';
  late GoogleMapController mapController;
  Set<Marker> markers = {};
  Timer? timer;

  String getCurrentUserId() {
    final user = FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  Future<String?> getStudBusNumber() async {
    final userId = getCurrentUserId();
    final studentSnapshot = await FirebaseFirestore.instance
        .collection('Students')
        .doc(userId)
        .get();

    final studentData = studentSnapshot.data();
    if (studentData != null && studentData.containsKey('Bus_number')) {
      var BusNum = studentData['Bus_number'];
      print(BusNum.toString());
      print("______________________________");
      return BusNum.toString();
    }
    print("Can't find the bus number");
    return null;
  }

  Future<void> updateLocation() async {
    final studentbusNumber = await getStudBusNumber();

    if (studentbusNumber != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection('Drivers')
          .where('Bus_number', isEqualTo: studentbusNumber)
          .get();
        setState(() {
          markers.clear();

          snapshot.docs.forEach((doc) {
            final latitude = doc.data()['latitude'] as double;
            final longitude = doc.data()['longitude'] as double;
            print(latitude.toString() + " " + longitude.toString());
            print("++++++++++++++++++++++++++");

            final marker = Marker(
              markerId: MarkerId(doc.id),
              position: LatLng(latitude, longitude),
            );
            markers.add(marker);
          });
        });

      }


  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void updateState(String state) {
    switch (state) {
      case "0":
        circleAvatarColor = Color(0xFF91CC04);
        text = "At Home";
        textColor = Color(0xFF91CC04);
        imageAsset = 'assets/images/At home.png';
        break;
      case "1":
        circleAvatarColor = Colors.orange;
        text = "In the Bus";
        textColor = Colors.orange;
        imageAsset = 'assets/images/in Bus.png';
        break;
      case "2":
        circleAvatarColor = Colors.lightBlue;
        text = "At School";
        textColor = Colors.lightBlue;
        imageAsset = 'assets/images/At School.png';
        break;
      default:
        circleAvatarColor = Color(0xFF91CC04);
        text = "At Home";
        textColor = Color(0xFF91CC04);
        imageAsset = 'assets/images/At home.png';
        break;
    }
  }




  @override
  void initState() {
    super.initState();
    updateLocation();

    timer = Timer.periodic(Duration(seconds: 3,), (timer) {
      updateLocation();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 530,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(30.045447, 31.233975),
                      zoom: 7.0,
                    ),
                    markers: Set<Marker>.from(markers),
                    onMapCreated: _onMapCreated,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: FloatingActionButton(
                    onPressed: updateLocation,
                    child: Icon(Icons.refresh),
                  ),
                ),
              ],
            ),


            SizedBox(height: 16,),


             Center(
               child: Text("Current State",
           style: TextStyle(fontSize: 40,color: Colors.black54),),),
            Container(
              height: 1,
              margin: EdgeInsetsDirectional.fromSTEB(100,0, 100, 0),
              decoration: BoxDecoration(color: Colors.black38,),

            ),
            SizedBox(height: 50,),



            StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance.collection('Students')
                  .doc(getCurrentUserId()).snapshots(),
              builder: (BuildContext context,

                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData) {
                  DocumentSnapshot document = snapshot.data!;

                  if (document.exists) {
                    String state = document['state'];
                    updateState(state);
                  } else {
                    print('Document does not exist');
                  }
                } else if (snapshot.hasError) {
                  print('Error retrieving user state: ${snapshot.error}');
                }
                return Container(
                  width: 430,
                  height: 120,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: circleAvatarColor,
                        radius: 60,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 45,
                        ),
                      ),
                      SizedBox(width: 25),
                      Text(
                        text,
                        style: TextStyle(fontSize: 35, color: textColor),
                      ),
                      SizedBox(width: 33),
                      Container(
                        width: 95,
                        height: 95,
                        // margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imageAsset),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                },
            )

          ],
        ),
      ),
    );
  }
}