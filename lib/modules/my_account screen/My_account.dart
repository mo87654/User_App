import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool status = false;
  PickedFile? _imageFile;
  String? image64;
  //final current = FirebaseAuth.instance;

  final user =  FirebaseAuth.instance.currentUser!;
  // final User =  FirebaseFirestore.instance
    //   .collection("users")
     //  .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      // .snapshots();

  Future<Object> getuserinfo() async {
    final CollectionReference users = FirebaseFirestore.instance.collection('Students');
     final String uid = user.uid;
     final result = await  users.doc(uid).get();
     return result.data()??['name'];

  }
  Future<void> savephoto(Path) async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", Path);


  }

  Future<void> loadimage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _imagepath= saveimage.getString("imagepath");
    });
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = basename(pickedFile.path);
      final savedImage = await File(pickedFile.path).copy('${appDir.path}/$fileName');
      setState(() {
        _imagepath = savedImage.path;
        print(_imagepath);
      });
      savephoto(_imagepath!); // حفظ الصورة المحددة
      final newImage = File(_imagepath!);
      final imageBytes = newImage.readAsBytesSync();
      final image64 = base64Encode(imageBytes);
      print(image64);
    }
  }
  void deletePhoto() async {
    setState(() {
      _imagepath = null;
    });
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.remove("imagepath");
  }
  String? _imagepath;
  final ImagePicker picker = ImagePicker();
  Color white = const Color.fromRGBO(254, 254, 254, 1.0);
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final gradController = TextEditingController();
  final addressController = TextEditingController();
  final busController = TextEditingController();
  @override
  void initState() {

    super.initState();
    initUser();
   // loadimage();
  }
  initUser() async {

    setState(() {
      getuserinfo();

    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadimage();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
               height: 260 ,
                width: double.infinity,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.bottomCenter,

                  children:<Widget> [
                    Align(


                      alignment: AlignmentDirectional.topStart,
                      child: CustomPaint(
                        painter: HeaderCurvedContainer(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,

                          child: const Align(
                            alignment: AlignmentDirectional.topCenter,
                            child: Padding(
                              padding: EdgeInsets.all(50),
                              child: Text(
                                "",
                                style: TextStyle(
                                  fontSize: 40,
                                  letterSpacing: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ),

                    Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                     clipBehavior: Clip.none,
                      children:<Widget>[
                        _imagepath != null?
                        CircleAvatar(backgroundImage: FileImage(File(_imagepath!)),radius: 80,)
                   :    GestureDetector(
                          onTap: () {
                            takePhoto(ImageSource.gallery);
                          },
                     child: CircleAvatar(
                           radius: 64,
                           backgroundImage: _imageFile == null ?
                           AssetImage("assets/images/User3.jpg")
                              : FileImage(File(_imageFile!.path)) as ImageProvider),
                   ),


                    CircleAvatar(
                      backgroundColor:  const Color(0xff515281),
                      radius: 19,
                      child: InkWell(
                        onTap: () {

                          setState(() {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (context) => bottomSheet(),

                            );
                          });
                        },
                        child: Icon(Icons.camera_alt_outlined, color: white),
                      ),
                    ),
          ]

          ),
                  ],
                ),
              ),

            ],

          ),





          Padding(
            padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
            child: SingleChildScrollView(


              child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25.0),
                      child:FutureBuilder(
                        future: getuserinfo(),
                        builder: (_, AsyncSnapshot snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          nameController.text = snapshot.data['name'].toString();
                          return TextFormField(

                            controller: nameController,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 1.0,
                                ),
                              ),
                              labelText: 'your name',
                            ),
                            readOnly: true,
                            style: TextStyle
                              (
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),

                          );
                        },
                      ),

                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: FutureBuilder(
                        future: getuserinfo(),
                        builder: (_, AsyncSnapshot snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          // تعيين النص المستلم من قاعدة البيانات في حقل Textformfield
                          emailController.text = snapshot.data['email'].toString();
                          return TextFormField(

                            controller: emailController,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                              ),
                              labelText: 'your email',
                            ),
                            readOnly: true,
                            style: TextStyle
                              (
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),

                          );
                        },
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(top:25.0),
                      child: FutureBuilder(
                        future: getuserinfo(),
                        builder: (_, AsyncSnapshot snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          gradController.text = snapshot.data['grad'].toString();
                          return TextFormField(

                            controller: gradController,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                              ),
                              labelText: 'your level',
                            ),
                            readOnly: true,
                            style: TextStyle
                              (
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),

                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top:25.0),
                      child: FutureBuilder(
                        future: getuserinfo(),
                        builder: (_, AsyncSnapshot snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          // تعيين النص المستلم من قاعدة البيانات في حقل Textformfield
                          addressController.text = snapshot.data['address'].toString();
                          return TextFormField(

                            controller: addressController,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                              ),
                              labelText: 'your address',
                            ),
                            readOnly: true,
                            style: TextStyle
                              (
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),

                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: FutureBuilder(
                        future: getuserinfo(),
                        builder: (_, AsyncSnapshot snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          busController.text = snapshot.data['Bus_number'].toString();
                          return TextFormField(

                            controller: busController,
                            enabled: false,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                              ),
                              labelText: 'Bus_number',
                            ),
                            readOnly: true,
                            style: TextStyle
                              (
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),

                          );
                        },
                      ),
                    ),
                  ]

              ),
            ),
          ),



        ],

      );








  }

  Widget bottomSheet() {
    return Container(
      color: const Color.fromRGBO(159, 148, 171, 1.0),
      height: 100,
     // width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose profile photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton.icon(

                  icon: const Icon(Icons.camera,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: const Text("Camera",
                    style: TextStyle(
                      color: Colors.black,

                    ),
                  ),
                ),
                OutlinedButton.icon(

                  icon: const Icon(Icons.image,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: const Text("Gallery",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),

                ),
                OutlinedButton.icon(

                  icon: const Icon(Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    deletePhoto();
                  },
                  label: const Text("delete",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),

                ),
              ],
            ),
          )
        ],
      ),
    );
  }




}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff515281);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}