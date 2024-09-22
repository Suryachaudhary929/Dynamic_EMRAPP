import 'package:dynamicemrapp/AddImage.dart';
import 'package:dynamicemrapp/FaBarcodeScanner.dart';

import 'package:dynamicemrapp/check_connection.dart';

import 'package:flutter/material.dart';
import 'package:dynamicemrapp/signIn.dart';

import 'package:jwt_decode/jwt_decode.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'FaCardDetails.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DynamicEMR',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: AnimatedSplashScreen(
        animationDuration: Duration(seconds: 0),
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/dynamicemr.jpg",
                fit: BoxFit.cover, height: 270, width: 295),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       "Dynamic",
            //       style: TextStyle(
            //           color: Colors.purple.shade700,
            //           fontSize: 40,
            //           fontWeight: FontWeight.bold),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     Text(
            //       "EMR",
            //       style: TextStyle(
            //           color: Colors.greenAccent.shade700,
            //           fontSize: 40,
            //           fontWeight: FontWeight.w700),
            //     ),
            //   ],
            // )
          ],
        ),
        splashIconSize: 350,
        nextScreen: FutureBuilder(
            future: isJwtValid,
            builder: ((context, snapshot) {
              if (snapshot.data != null) {
                if (snapshot.data == true) {
                  return MyHomePage(title: 'DynamicEmr');
                } else {
                  return SignIn();
                }
              } else {
                return SignIn();
              }
            })),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
      ),

      //home: MyHomePage(title: 'Image'),
      // home: FutureBuilder(
      //     future: isJwtValid,
      //     builder: ((context, snapshot) {
      //       if (snapshot.data != null) {
      //         if (snapshot.data == true) {
      //           return MyHomePage(title: 'DynamicEmr');
      //         } else {
      //           return SignIn();
      //         }
      //       } else {
      //         return SignIn();
      //       }
      //     })),
    );
  }

  Future<bool> get isJwtValid async {
    final prefs = await SharedPreferences.getInstance();
    String jwtToken = (prefs.getString('DynamicEmrLoginToken') ?? "");
    if (jwtToken == "") {
      return false;
    }

    bool isExpired = Jwt.isExpired(jwtToken);
    String expiryDate = (prefs.getString('DyanmicEmrLoginExpiration') ?? "");
    DateTime todayDate = DateTime.now();
    if (expiryDate != "") {
      DateTime expiryDateTime = DateTime.parse((expiryDate));
      if (expiryDateTime.compareTo(todayDate) < 0) {
        isExpired = true;
      }
    }

    return !isExpired;
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void ShowImagePicker(BuildContext context) {
//   showBottomSheet(
//       context: context,
//       builder: (builder) {
//         return SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 4,
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () {},
//                 child: SizedBox(
//                   child: Column(
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black45,
//                           padding: EdgeInsets.symmetric(
//                               vertical: 40, horizontal: 60),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30)),
//                         ),
//                         child: Column(children: [
//                           Padding(
//                             padding: EdgeInsets.all(20),
//                             child: Icon(
//                               Icons.camera_alt_outlined,
//                               size: 60,
//                             ),
//                           ),
//                           Text(
//                             "Take Picture",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           )
//                         ]),
//                         onPressed: () => {
//                            _imageFromCamera(),
//                         },
//                       ),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black45,
//                           //  Color.fromRGBO(0, 0, 0, 0.1),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 40, horizontal: 50),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30)),
//                         ),
//                         child: Column(children: [
//                           Padding(
//                             padding: EdgeInsets.all(20),
//                             child: Icon(
//                               Icons.photo_library_outlined,
//                               size: 60,
//                             ),
//                           ),
//                           Text(
//                             "Upload Picture",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20,
//                               fontWeight: FontWeight.w300,
//                             ),
//                           )
//                         ]),
//                         onPressed: () => {
//                           //_imageFromGallery(),
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => PatientInfo())),
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       });
// }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 214, 175, 212),
            Color.fromARGB(255, 161, 175, 225),
            Color.fromARGB(255, 81, 166, 205),
            Color.fromARGB(255, 161, 175, 225),
            Color.fromARGB(255, 214, 175, 212),

            // Color.fromRGBO(46, 25, 96, 1),
            // Color.fromRGBO(93, 16, 73, 1)
          ])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text('Dynamic EMR'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.lock_person_rounded,
                  size: 30,
                ),
                tooltip: 'Log Out',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
              ),
            ],
          ),
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Scan Document",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 30),
                          child: Text(
                            "Take picture from camera and upload it to the server. Click Below to add Image",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.1),
                            padding: const EdgeInsets.symmetric(
                                vertical: 30, horizontal: 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: const Text(
                            "Add an Image",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                         
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>AddImage()))
                          },
                        ),
                      ],
                    )
                  ]),
            ),
          ),
          drawer: Drawer(
              child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                // child: Text('DynamicEMR',style: TextStyle(fontSize: 20,),),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.green),
                  accountName: Text(
                    "DynamicEMR",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("info@paailatechnologies.com"),
                  currentAccountPictureSize: Size.square(45),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "D",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ),
              ListTile(
                title: const Text('Document Scanner'),
                leading: Icon(Icons.document_scanner),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('FA Barcode Scanner'),
                leading: Icon(Icons.barcode_reader),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FaBarcodeScanner()));
                },
              ),
              ListTile(
                title: const Text('FA Details'),
                leading: Icon(Icons.details),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccordionPage()));
                },
              ),
              ListTile(
                title: const Text('Check User Connection'),
                leading: Icon(Icons.check_circle),
                onTap: () {
                  // Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckConnection()));
                },
              ),
            ],
          ))),
    );
  }
}
