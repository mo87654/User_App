
import 'package:flutter/material.dart';
import '../../shared/component/buttons.dart';
import '../../shared/component/colors.dart';


class PersonalInfo extends StatefulWidget {
  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  var formkey = GlobalKey<FormState>();

  bool isLoading =false;

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
        backgroundColor: app_Color(),
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
                  keyboardType: TextInputType.visiblePassword,
                  textAlignVertical: TextAlignVertical.top,
                  textInputAction: TextInputAction.done,
                  validator: (value)
                  {
                    if (value!.isEmpty){
                      return 'phone number is required';
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
                  if (formkey.currentState!.validate()) {

                  }
                },
              ),
              SizedBox(
                height: 25,
              ),

              appButton(
                buttonColor:  Color(0xff818181),
                isLoading: isLoading,
                text: 'Cancel',
                function: (){
                  Navigator.pop(context);
                },

              ),



            ],
          ),
        ),
      ),
    );
  }
}
