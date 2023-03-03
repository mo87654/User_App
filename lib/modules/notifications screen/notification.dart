import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  bool isButtonVisible = true;
  bool isButtonVisible1 = true;
  bool isButtonVisible2 = true;
  bool isButtonVisible3 = true;
  bool isChecked = false;
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  Color textBackgroundColor = Colors.white;
  Color textBackgroundColor1 = Colors.white;
  Color textBackgroundColor2 = Colors.white;
  Color textBackgroundColor3 = Colors.white;
  String textMessage = 'Your child has boarded the bus to go home';
  String textMessage1 = 'Your child has left the bus heading home';
  String textMessage2 = 'Your child has boarded the bus to go home';
  String textMessage3 = 'Your child has left the bus heading home';

  void onButtonPressed() {
    setState(() {
      isButtonVisible = false;
      textBackgroundColor = Colors.grey[300]!;
      textMessage = 'Your child has now left the bus and headed to school';
      isChecked = true;

    });
  }
  void onButtonPressed1() {
    setState(() {
      isButtonVisible1 = false;
      textBackgroundColor1 = Colors.grey[300]!;
      textMessage1 = 'Your child has now left the bus and headed to school';
      isChecked1 = true;
    });
  }
  void onButtonPressed2() {
    setState(() {
      isButtonVisible2 = false;
      textBackgroundColor2 = Colors.grey[300]!;
      textMessage2 = 'Your child has now left the bus and headed to school';
      isChecked2 = true;
    });
  }

  void onButtonPressed3() {
    setState(() {
      isButtonVisible3 = false;
      textBackgroundColor3 = Colors.grey[300]!;
      textMessage3 = 'Your child has now left the bus and headed to school';
      isChecked3 = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(2, 20, 2, 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: textBackgroundColor,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.message_outlined),
                            Text(
                              "App name ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff644f73),
                              ),
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: Colors.black38,
                            ),
                            Text(
                              "  07:00",
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
                                  "${textMessage}",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Visibility(
                                visible: isButtonVisible,
                                child: TextButton(

                                  onPressed: onButtonPressed,


                                  style: TextButton.styleFrom(
                                    primary: const Color(0xff515281),
                                    backgroundColor: const Color(0xffE0E0E0),
                                  ),
                                  child:  Text(
                                    'OK',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Visibility(
                                visible: isChecked,
                                child: Icon(Icons.library_add_check_rounded,
                                color: Colors.lightBlueAccent[100],)),

                          ],
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(2, 20, 2, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: textBackgroundColor1,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.message_outlined),
                            Text(
                              "App name ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff515281),
                              ),
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: Colors.black38,
                            ),
                            Text(
                              "  07:00",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children:  [
                              Expanded(
                                child: Text(
                                  "$textMessage1",
                                  style: TextStyle(fontSize: 15,),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Visibility(
                                      visible: isButtonVisible1,
                                      child: TextButton(
                                        onPressed: onButtonPressed1,
                                        style: TextButton.styleFrom(
                                          primary: const Color(0xff515281),
                                          backgroundColor: const Color(0xffE0E0E0),
                                        ),
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Visibility(
                                      visible: isChecked1,
                                      child: Icon(Icons.library_add_check_rounded,
                                        color: Colors.lightBlueAccent[100],)),

                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(2, 20, 2, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: textBackgroundColor2,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.message_outlined),
                            Text(
                              "App name ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff515281),
                              ),
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: Colors.black38,
                            ),
                            Text(
                              "  07:00",
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
                                  "$textMessage2",
                                  style: TextStyle(fontSize: 15,),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Visibility(
                                      visible: isButtonVisible2,
                                      child: TextButton(
                                        onPressed: onButtonPressed2,
                                        style: TextButton.styleFrom(
                                          primary: const Color(0xff515281),
                                          backgroundColor: const Color(0xffE0E0E0),
                                        ),
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Visibility(
                                      visible: isChecked2,
                                      child: Icon(Icons.library_add_check_rounded,
                                        color: Colors.lightBlueAccent[100],)),

                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsetsDirectional.fromSTEB(2, 20, 2, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: textBackgroundColor3,
                      borderRadius: BorderRadius.circular(6.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.message_outlined),
                            Text(
                              "App name ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff515281),
                              ),
                            ),
                            CircleAvatar(
                              radius: 2,
                              backgroundColor: Colors.black38,
                            ),
                            Text(
                              "  07:00",
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
                                  "$textMessage3",
                                  style: TextStyle(fontSize: 15,),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Visibility(
                                      visible: isButtonVisible3,
                                      child: TextButton(
                                        onPressed: onButtonPressed3,
                                        style: TextButton.styleFrom(
                                          primary: const Color(0xff515281),
                                          backgroundColor: const Color(0xffE0E0E0),
                                        ),
                                        child: const Text(
                                          'OK',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Visibility(
                                      visible: isChecked3,
                                      child: Icon(Icons.library_add_check_rounded,
                                        color: Colors.lightBlueAccent[100],)),

                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}