import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import '../modules/home screen/home.dart';
import '../modules/my_account screen/My_account.dart';
import '../modules/notifications screen/notification.dart';
import '../shared/component/components.dart';

class UserLayout extends StatefulWidget {
  const UserLayout({Key? key}) : super(key: key);

  @override
  State<UserLayout> createState() => _UserLayoutState();
}
final User =FirebaseAuth.instance.currentUser!;

Future<Object> getuserinfo() async {
  final CollectionReference users = FirebaseFirestore.instance.collection('Students');
  final String uid = User.uid;
  final result = await  users.doc(uid).get();
  return result.data()??['uid'];

}

Future<void> checkLocationService ()async{

  Location location = new Location();


  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
   //LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      SystemNavigator.pop();
      print("no location service");

    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      SystemNavigator.pop();
      print("no location permission");
    }
  }
}

// Future<String?> loadimage() async {
//   SharedPreferences saveimage = await SharedPreferences.getInstance();
//   return saveimage.getString("imagepath");
// }
class _UserLayoutState extends State<UserLayout> {
  var currentIndex = 2;
  List<Widget> userScreens =[
    MapScreen1(),
    NotificationPage(),
    MyAccount(),
  ];
  List<String> title =[
    'Home',
    'Notifications',
    'My account'
  ];
  int _currentIndex = 2;
  final List<IconData> _iconList = [
    Icons.person,
    Icons.notifications,
    Icons.home,

  ];




  @override
  void initState() {
    super.initState();
    checkLocationService();
    initUser();
  }
  initUser() async {
    getuserinfo();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> leadingicon = [
      Text(' '),
      driverLeading(
          onpressedfun: (){
            Navigator.pop(context);
          }
      ), Builder(
          builder: (context) {
            return IconButton(icon: const Icon(Icons.menu), onPressed: () {  Scaffold.of(context).openDrawer(); },

            );
          }
      ),

    ];
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      // appBar: AppBar(automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: Color(0xff515281),
      //   leading: leadingicon[2 - _currentIndex],
      //   title: Text(
      //     title[2 - _currentIndex],
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),

      body: userScreens[2 - _currentIndex],

      bottomNavigationBar: AnimatedBottomNavigationBar(
        height: 70,
        splashRadius: 50,
        iconSize: 37,
        inactiveColor: Colors.white,
        activeColor: Colors.amber,
        backgroundColor: Color(0xff515281),
        splashColor: Colors.cyan,
        icons: _iconList,
        activeIndex: _currentIndex,
        splashSpeedInMilliseconds: 500,
        gapLocation: GapLocation.none,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        notchSmoothness: NotchSmoothness.defaultEdge,
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 15,
          spreadRadius: 0.7,
          color: Color(0xff515281),
        ),


        onTap: (index) => setState(() => _currentIndex = index),

      ),
    );
  }
}
