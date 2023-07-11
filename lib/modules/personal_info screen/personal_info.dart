import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_app/shared/component/buttons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class PersonalInfo extends StatefulWidget {
  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  var formkey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();

  TextEditingController _phoneNumberController = TextEditingController();

  final user = FirebaseAuth.instance.currentUser;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getUserData();


  }

  String getCurrentUserId(){
    final user = FirebaseAuth.instance.currentUser;
    return user!.uid;

  }

  void getUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    final userData = await FirebaseFirestore.instance
        .collection('Students')
        .doc(user!.uid)
        .get();
    _usernameController.text = userData['parent_name'];
    _phoneNumberController.text = userData['tele-num'];





   }

  void saveUserData() async {


    await FirebaseFirestore.instance.collection('Students').doc(user!.uid).update({
      'parent_name': _usernameController.text,
      'tele-num': _phoneNumberController.text,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        leading:  IconButton(icon:  Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text (
            'Personal Info'
        ),
       backgroundColor: Color(0xff515281),
       // backgroundColor: color(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              SizedBox(height: 80.0),
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
                    labelText:'User name',
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: TextInputAction.next,
                  controller: _usernameController,
                  validator: (value)
                  {
                    if (value!.isEmpty){
                      return 'User name required';
                    }
                    return null;
                  },

                ),
              ),
              SizedBox(height: 30.0),
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
                    labelText:'Tele_number',
                  ),
                  keyboardType: TextInputType.phone,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: TextInputAction.done,
                  controller: _phoneNumberController,
                  validator: (value)
                  {
                    if (value!.isEmpty){
                      return 'Tele_number required';
                    }
                    return null;
                  },

                ),
              ),
              SizedBox(height: 140.0),
              appButton(
                isLoading: isLoading,
                text: 'Save',
                function: ()async{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(backgroundColor: Colors.black38,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          content: Text("  your profile details has been changed  ",style: TextStyle(fontSize: 20),)),);

                    FirebaseFirestore.instance.collection("Students");
                    if (formkey.currentState!.validate())
                    {
                      saveUserData();
                    }

                },
              ),
              SizedBox(
                height: 25,
              ),
              appButton(
                buttonColor:  Color(0xff818181),
                text: 'Cancel',
                function: (){
                  Navigator.pop(context);
                },
              ),           //cancel



            ],
          ),
        ),
      ),
    );
  }
}

