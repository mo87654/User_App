//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class StateScreen extends StatefulWidget {
//
//   _StateScreenState createState() => _StateScreenState();
// }
//
// class _StateScreenState extends State<StateScreen> {
//   Color circleAvatarColor = Colors.green;
//   String text = "At Home";
//   Color textColor = Colors.green;
//   String imageAsset = 'assets/images/At home.png';
//   String getCurrentUserId() {
//     final user = FirebaseAuth.instance.currentUser;
//     return user!.uid;
//   }
//
//   void updateColorsAndImages(String state) {
//     switch (state) {
//       case "0":
//         circleAvatarColor = Colors.green;
//         text = "At Home";
//         textColor = Colors.green;
//         imageAsset = 'assets/images/At home.png';
//         break;
//       case "1":
//         circleAvatarColor = Colors.orange;
//         text = "In Bus";
//         textColor = Colors.orange;
//         imageAsset = 'assets/images/in Bus.png';
//         break;
//       case "2":
//         circleAvatarColor = Colors.blue;
//         text = "At School";
//         textColor = Colors.blue;
//         imageAsset = 'assets/images/At School.png';
//         break;
//       default:
//         circleAvatarColor = Colors.green;
//         text = "At Home";
//         textColor = Colors.green;
//         imageAsset = 'assets/images/At home.png';
//         break;
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       StreamBuilder<DocumentSnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('Students')
//           .doc(getCurrentUserId())
//           .snapshots(),
//       builder: (BuildContext context,
//           AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.hasData) {
//           DocumentSnapshot document = snapshot.data!;
//
//           if (document.exists) {
//             String state = document['state'];
//             updateColorsAndImages(state);
//           } else {
//             print('Document does not exist');
//           }
//         } else if (snapshot.hasError) {
//           print('Error retrieving user state: ${snapshot.error}');
//         }
//
//
//         return Container(
//           width: 400,
//           height: 115,
//           decoration: ShapeDecoration(
//             color: Color(0xFFD9D9D9),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(60),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 backgroundColor: circleAvatarColor,
//                 radius: 60,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 45,
//                 ),
//               ),
//               SizedBox(width: 25),
//               Text(
//                 "At Home",
//                 style: TextStyle(fontSize: 35, color: textColor),
//               ),
//               SizedBox(width: 30),
//               Container(
//                 width: 70,
//                 height: 70,
//                 margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(imageAsset),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// SizedBox(height: 16,),
// Center(
// child: Text("Current State",
// style: TextStyle(fontSize: 40,color: Colors.black54),),),
// Container(
// height: 1,
// margin: EdgeInsetsDirectional.fromSTEB(100,0, 100, 0),
// decoration: BoxDecoration(color: Colors.black38,),
//
// ),
// SizedBox(height: 50,),
//
//
//
// StreamBuilder<DocumentSnapshot>(
// stream: FirebaseFirestore.instance.collection('Students')
//     .doc(getCurrentUserId()).snapshots(),
// builder: (BuildContext context,
//
// AsyncSnapshot<DocumentSnapshot> snapshot) {
// if (snapshot.hasData) {
// DocumentSnapshot document = snapshot.data!;
//
// if (document.exists) {
// String state = document['state'];
// updateState(state);
// } else {
// print('Document does not exist');
// }
// } else if (snapshot.hasError) {
// print('Error retrieving user state: ${snapshot.error}');
// }
// return Container(
// width: 400,
// height: 115,
// decoration: ShapeDecoration(
// color: Color(0xFFD9D9D9),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(60),
// ),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// CircleAvatar(
// backgroundColor: circleAvatarColor,
// radius: 60,
// child: CircleAvatar(
// backgroundColor: Colors.white,
// radius: 45,
// ),
// ),
// SizedBox(width: 25),
// Text(
// text,
// style: TextStyle(fontSize: 35, color: textColor),
// ),
// SizedBox(width: 30),
// Container(
// width: 70,
// height: 70,
// margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
// decoration: BoxDecoration(
// image: DecorationImage(
// image: AssetImage(imageAsset),
// fit: BoxFit.fill,
// ),
// ),
// ),
// ],
// ),
// );
// },
// )


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';




class Homepage extends StatefulWidget{
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FirebaseAuth instance = FirebaseAuth.instance;


  @override
  void initState() {
    super.initState();

      }


  @override
  Widget build(BuildContext context) {
    //setState(() {
    //if(state == 0){

    // }else if(state == 1){

    //}else{

    // };

    //});
    //Widget build(BuildContext context) {

    return Center(
      child: Scaffold(


        body: SingleChildScrollView(
          child: Column(


            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 390,
                    height: 844,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Stack(

                      children: [


                        Positioned(
                          //left: 0,
                          //top: 55,
                          child: Container(
                            width: double.infinity,
                            height: 475,
                            decoration: BoxDecoration(color: Colors.black38),
                          ),
                        ),
                        Positioned(
                          left: 74,
                          top: 594,
                          child: Container(
                            width: 249.01,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 0.50,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                ),
                              ),
                            ),
                          ),
                        ), // line under current state
                        Positioned(
                          left: 82,
                          top: 545,
                          child: SizedBox(
                            width: 235,
                            height: 49,
                            child: Text(
                              'Current State',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 35,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ), // current state




                        Positioned(
                          left: 18,
                          top: 637,
                          right: 18,
                          child: Container(
                            width: 357,
                            height: 106,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),   //
                        Positioned(
                          left: 120,
                          top: 680,
                          child: SizedBox(
                            width: 169,
                            height: 103,
                            child: Text(
                              'At Home',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 26,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),  // at home
                        Positioned(
                          left: 20,
                          top: 640,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFCFEFC),
                              shape: OvalBorder(
                                side: BorderSide(width: 6, color: Color(0xFF91CC04)),
                              ),
                            ),
                          ),
                        ),   //
                        Positioned(

                          left: 302,
                          top: 655,
                          child: Container(
                            width: 54,
                            height: 54,

                            decoration: BoxDecoration(


                              image: DecorationImage(
                                image: AssetImage('assets/images/image_2023-06-21_23-16-28.png'),
                                fit: BoxFit.fill,
                              ),
                            ),

                          ),
                        ),  //






                          Positioned(
                          left: 18,
                          top: 637,
                          right: 18,
                          child: Container(
                            width: 357,
                            height: 106,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),   //
                        Positioned(
                          left: 120,
                          top: 680,
                          child: SizedBox(
                            width: 169,
                            height: 103,
                            child: Text(
                              'At bus',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 26,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),  // at bus
                        Positioned(
                          left: 20,
                          top: 640,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFCFEFC),
                              shape: OvalBorder(
                                side: BorderSide(width: 6, color: Colors.orange),
                              ),
                            ),
                          ),
                        ),   //
                        Positioned(

                          left: 302,
                          top: 655,
                          child: Container(
                            width: 54,
                            height: 54,

                            decoration: BoxDecoration(


                              image: DecorationImage(
                                image: AssetImage('assets/images/at_bus_state.png'),
                                fit: BoxFit.fill,
                              ),
                            ),

                          ),
                        ),  //





                          Positioned(
                          left: 18,
                          top: 637,
                          right: 18,
                          child: Container(
                            width: 357,
                            height: 106,
                            decoration: ShapeDecoration(
                              color: Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),   //
                        Positioned(
                          left: 120,
                          top: 680,
                          child: SizedBox(
                            width: 169,
                            height: 103,
                            child: Text(
                              'At School',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 26,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),  // at school
                        Positioned(
                          left: 20,
                          top: 640,
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: ShapeDecoration(
                              color: Color(0xFFFCFEFC),
                              shape: OvalBorder(
                                side: BorderSide(width: 6, color: Colors.lightBlue),
                              ),
                            ),
                          ),
                        ),   //
                        Positioned(

                          left: 302,
                          top: 655,
                          child: Container(
                            width: 54,
                            height: 54,

                            decoration: BoxDecoration(


                              image: DecorationImage(
                                image: AssetImage('assets/images/at_school_state.png'),
                                fit: BoxFit.fill,
                              ),
                            ),

                          ),
                        ),  //










                        Positioned(
                          // left: 0,
                          top: 0,
                          child: Container(
                            width: double.infinity,
                            height: 477,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/image_2023-06-21_23-16-28.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              )

            ],
          ),
        ),

      ),
    );




  }
}