import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
          backgroundColor: Color(0xff515281),
        ),
        body: const SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: 20), Text(
                    'Our Company',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "At ,Smart Student Tacking System  we are a dynamic and forward-thinking technology company dedicated to empowering connectivity and driving digital transformation. With a passion for innovation and a commitment to delivering exceptional solutions, we are at the forefront of revolutionizing the way businesses and individuals interact with technology",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Meet the Team',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/team_member_1.png'),
                            backgroundColor: Color(0xff515281),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Mohammed Hamdy',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'CEO',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/images/team_member_2.png'),
                            backgroundColor: Color(0xff515281),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Ahmed Adel',
                            
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'CTO',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Our Story',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Our Story: Bridging Connectivity with Innovation"

                  "Introduction:"
                  "At Smart Student Tacking System , we are passionate about harnessing the power of technology to create seamless connections and enhance user experiences. Our journey began with a vision to revolutionize the way people interact with hardware devices using the ESP32 microcontroller. Combined with the robustness of Firebase and the versatility of Flutter, we have crafted a trio of powerful apps: Admin, User, and Driver, that cater to diverse needs."

                  "Origin:"
                  "Our story started when our founding members recognized the immense potential of the ESP32 microcontroller in bridging the gap between hardware and software. Motivated by the desire to create a more connected world, we embarked on a mission to develop innovative solutions that would simplify and elevate user experiences."

                  "Mission and Values:"
                  "At the core of our organization lies a deep commitment to innovation, reliability, and user-centric design. We strive to empower individuals and businesses by providing cutting-edge hardware solutions that seamlessly integrate with modern software frameworks. Our mission is to enhance connectivity, efficiency, and convenience through intuitive technology."

                  "Key Milestones:"
                  "Throughout our journey, we have achieved several significant milestones. From successfully integrating the ESP32 microcontroller with Firebase's real-time database capabilities to developing three feature-rich Flutter applications, we have consistently pushed boundaries and delivered outstanding results. Each milestone represents a stepping stone towards our vision of creating a more connected and efficient world."

                  "Passionate and Expert Team:"
                    "Our success is attributed to the exceptional skills and dedication of our team. Comprising talented engineers, designers, and developers, each team member brings a unique blend of expertise and a shared passion for innovation. Together, we work tirelessly to create products that embody excellence and reliability, catering to the ever-evolving needs of our users."

                  "Customer Success Stories:"
                  "Our journey has been enriched by the stories of our customers, whose lives have been positively impacted by our technology. From empowering businesses with real-time tracking and analytics through our Admin app to providing users with seamless access to services and information via our User app, we have witnessed countless success stories that motivate us to continue pushing boundaries."

                    "Vision for the Future:"
                    "Looking ahead, our vision is to expand our hardware-software integration capabilities, offering even more advanced and interconnected solutions. We aim to forge partnerships with industry leaders, create customizable solutions for diverse sectors, and constantly innovate to meet the evolving needs of our users. By embracing emerging technologies and staying at the forefront of innovation, we envision a future where connectivity and efficiency are seamlessly intertwined."

                    "Join Our Journey:"
                    "We invite you to join us on this exciting journey of connectivity and innovation. Whether you are an entrepreneur seeking a robust and scalable solution, a user longing for convenience, or a driver looking for streamlined operations, our suite of apps – Admin, User, and Driver – are designed to enhance your experiences and simplify your interactions. Explore our products, engage with our community, and be a part of the future we are building together."

                    "Together, let's bridge connectivity with innovation and shape a more connected world. ",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email: SmartStudentTrackingSystem.com\nPhone: \nAddress: Sharkia_Zagazig, Kaft Atalla, EG,',
                    textAlign: TextAlign.center,
                  ),
                ]    )

        )
    );
  }
}