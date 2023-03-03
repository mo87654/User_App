import 'package:flutter/material.dart';
import '../../layout/user_layout.dart';
import '../../models/dataBase.dart';
import '../forgetPassword screens/forgetPassword1.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  bool showpassword = true;
  //String? selectedItem;
  List<UsersData> users = [
    UsersData(email: 'mohammad@user.com', password: 'mohammad111'),
    UsersData(email: 'ahmed@user.com', password: 'ahmed111'),
    UsersData(email: 'ali@user.con', password: 'ali111')
  ];
  List<UsersData> drivers = [
    UsersData(email: 'mohammad@driv.com', password: 'mohammad222'),
    UsersData(email: 'ahmed@driv.com', password: 'ahmed222'),
    UsersData(email: 'ali@driv.com', password: 'ali222')
  ];
  List<UsersData> admins = [
    UsersData(email: 'mohammad@admin.com', password: 'mohammad333'),
    UsersData(email: 'ahmed@admin.com', password: 'ahmed333'),
    UsersData(email: 'ali@admin.con', password: 'ali333')
  ];

  @override
  String? selectedItem = 'User';

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Image(
                  image: AssetImage('assets/images/bus.jpg'),
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                  end: 20
                ),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(),
                    labelText:'E-mail',
                    prefixIcon:Icon(
                        Icons.mail
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: TextInputAction.next,
                  controller: emailcontroller,
                  validator: (value)
                  {
                    if (value!.isEmpty){
                      return 'E-mail address required';
                    }

                  },
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                  end: 20
                ),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                      floatingLabelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      //contentPadding: EdgeInsetsDirectional.only(top: 10,start: 10,end: 10, bottom: 10 ),
                      border: OutlineInputBorder(),
                      labelText:'Password',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              showpassword = !showpassword;
                            });
                          },
                          icon: showpassword? Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ) :
                          Icon(
                            Icons.visibility,
                          )
                      )
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showpassword,
                  textAlignVertical: TextAlignVertical.top,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password required';
                    }
                  }
                ),
              ),
              SizedBox(
                height: 15,
              ),
                  Container(
                    alignment: AlignmentDirectional.centerEnd,
                    padding: EdgeInsetsDirectional.only(end: 20),
                    height: 35,
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>ForgetPassword1()
                            )
                        );
                      },
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                height: 45,
                width: double.infinity,
                padding: const EdgeInsetsDirectional.only(start: 20,end: 20),
                child: MaterialButton(
                  onPressed: (){
                    if (formkey.currentState!.validate())
                      {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context)=>UserLayout()
                            )
                        );
                      }
                  },
                  child:Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,

                    ),

                  ),
                  color: Color(0xff014EB8),
                  shape:RoundedRectangleBorder (
                    borderRadius: BorderRadius.circular (10.0), ),


                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
