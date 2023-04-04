import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_app/modules/AboutUs%20Screen/AboutUs.dart';
import '../modules/change_password screen/change_password.dart';
import '../modules/help screen/help_screen.dart';
import '../modules/home screen/home.dart';
import '../modules/login screen/login.dart';
import '../modules/my_account screen/My_account.dart';
import '../modules/notifications screen/notification.dart';
import '../modules/personal_info screen/personal_info.dart';
import '../shared/component/colors.dart';
import '../shared/component/components.dart';

class UserLayout extends StatefulWidget {
  const UserLayout({Key? key}) : super(key: key);

  @override
  State<UserLayout> createState() => _UserLayoutState();
}
final User =FirebaseAuth.instance.currentUser!;

Future<Object> getuserinfo() async {
  final CollectionReference users = FirebaseFirestore.instance.collection('users');
  final String uid = User.uid;
  final result = await  users.doc(uid).get();
  return result.data()??['uid'];

}


class _UserLayoutState extends State<UserLayout> {
  var currentIndex = 2;
  List<Widget> userScreens =[
    Homepage(),
    NotificationPage(),
    MyAccount(),
  ];
  List<String> title =[
    'Home',
    'Notifications',
    'My account'
  ];




  @override
  void initState() {

    super.initState();
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
      ),
      Builder(
          builder: (context) {
            return IconButton(icon: const Icon(Icons.menu), onPressed: () {  Scaffold.of(context).openDrawer(); },

            );
          }
      ),
    ];
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        backgroundColor: Color(0xff515281),
        leading: leadingicon[2 - currentIndex],
        title: Text(
          title[2 - currentIndex],
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer:   SafeArea(
        child: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.person),
                title: FutureBuilder(
                future: getuserinfo(),
               builder: (_ , AsyncSnapshot snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return Center(child: CircularProgressIndicator());
                 }
                 return Text(snapshot.data['name'].toString(),
                   style: TextStyle(
                     fontSize: 17,
                     fontWeight: FontWeight.bold,

                   ),
                 );

               },
                ),


                subtitle:  FutureBuilder(
                  future: getuserinfo(),
                  builder: (_ , AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Text(snapshot.data['email'].toString(),

                    );

                  },
                ),
                onTap: () {

                },
              ),
              const Padding(
                padding: EdgeInsets.only(right: 24,top: 24, bottom: 16),
                child: Divider(
                  color: Colors.black26,
                  height: 1,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.perm_contact_cal_outlined),
                title: const Text(' Profile Details ',
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),

                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => PersonalInfo()
                      )
                  );
                },
              ),

              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: const Icon(Icons.notification_important),
                      title: const Text('Notifications',
                        style: TextStyle(
                            fontSize: 17
                        ),

                      ),

                      onTap: () {
                        Navigator.pop(context);
                      },

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0),
                    child: Switch(onChanged: (bool value) {  }, value: true, activeColor: color(),),
                  ),
                ],
              ),

              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Change Password',
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),

                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => ChangePassword()
                      )
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: Colors.black26,
                  height: 1,
                ),
              ),

              ListTile(
                leading: const Icon(Icons.error),
                title: const Text('About us',
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),

                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => AboutUsScreen()
                      )
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.help),
                title: const Text('Help!',
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),

                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => HelpPage()
                      )
                  );
                },
              ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Log Out',
                  style: TextStyle(
                      fontSize: 17
                  ),
                ),

                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                },
              ),
            ],
          ),


        ),
      ),
      body: userScreens[2 - currentIndex],

      bottomNavigationBar: BottomNavigationBar(

          iconSize: 35,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          backgroundColor: color(),
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              currentIndex = index;
            });
          },
          items:[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box_outlined,
                ),
                label: ' ',
                activeIcon: Icon(
                  Icons.account_box,
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_none,
                ),
                label: ' ',
                activeIcon: Icon(
                    Icons.notifications
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: ' ',
                activeIcon: Icon(
                    Icons.home
                )
            ),
          ]
      ),
    );
  }
}
