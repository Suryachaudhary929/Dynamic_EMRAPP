import 'dart:io';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'package:dynamicemrapp/patientInfo.dart';

import 'DisplayPicture.dart';
import 'alert.dart';

class AddImage extends StatefulWidget {
  AddImage({Key? key}) : super(key: key);
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  late File _image;
  ImagePicker imagePicker = ImagePicker();
  String tempPath = "";
  String appDocPath = "";

  _imageFromCamera() async {
    try {
      Directory tempDir = await getTemporaryDirectory();
      tempPath = tempDir.path;
      print(tempPath);
      //output: /data/user/0/com.example.test/cache

      Directory appDocDir = await getApplicationDocumentsDirectory();
      final Directory appDocDirFolder =
          Directory('${appDocDir.path}/DynamicEmrScan/');
      final Directory appScanFolder =
          await appDocDirFolder.create(recursive: true);
      appDocPath = appScanFolder.path;
      print(appDocPath);
      XFile? capturedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      if (capturedImage == null) {
        showAlert(
            bContext: context,
            title: "Error choosing file",
            content: "No file was selected");
      } else {
        final File imagePath = File(capturedImage.path);
        String fileName = imagePath.path.split('/').last;
        String targetPath = '$appDocPath/$fileName';

        // final File newImage = await imagePath.copy('$appDocPath/$fileName');
        var result = await FlutterImageCompress.compressAndGetFile(
          imagePath.absolute.path,
          targetPath,
          minWidth: 2300,
          minHeight: 1500,
          quality: 50,
        );

        //    setState(() {
        //   _image = imagePath;
        // });
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => DisplayPicture(
        //               image: _image,
        //               context: context,
        //             )));
      }
    } catch (e) {
      showAlert(
          bContext: context,
          title: "Error capturing image file",
          content: e.toString());
    }
  }

  _imageFromGallery() async {
    XFile? uploadedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (uploadedImage == null) {
      showAlert(
          bContext: context,
          title: "Error choosing file",
          content: "No file was selected");
    } else {
      final File imagePath = File(uploadedImage.path);
      setState(() {
        _image = imagePath;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DisplayPicture(
                    image: _image,
                    context: context,
                  )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 214, 175, 212),
              Color.fromARGB(255, 161, 175, 225),
              //  Color.fromARGB(255, 81, 166, 205),
              Color.fromARGB(255, 161, 175, 225),
              Color.fromARGB(255, 214, 175, 212),

              // Color.fromRGBO(46, 25, 96, 1),
              // Color.fromRGBO(93, 16, 73, 1)
            ])),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:const Color.fromARGB(255, 35, 177, 196),
                        padding: EdgeInsets.symmetric(
                            vertical: 40, horizontal: 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: 60,
                          ),
                        ),
                        Text(
                          "Take Picture",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ]),
                      onPressed: () => {
                        _imageFromCamera(),
                      },
                    ),
                  
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:const Color.fromARGB(255, 35, 177, 196),
                        //  Color.fromRGBO(0, 0, 0, 0.1),
                        padding: EdgeInsets.symmetric(
                            vertical: 40, horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.photo_library_outlined,
                            size: 60,
                          ),
                        ),
                        Text(
                          "Upload Picture",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ]),
                      onPressed: () => {
                        //_imageFromGallery(),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientInfo())),
                      },
                    ),
                  ]),
            )));
  }
}
