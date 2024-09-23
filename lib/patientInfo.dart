import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dynamicemrapp/apiclient.dart';
import 'package:dynamicemrapp/model/patient_for_scanner_client_view_model.dart';
import 'package:dynamicemrapp/scan_document_master_dto.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'main.dart';
import 'model/patient_registration_for_scanner_client_view_model.dart';
import 'scan_document_dto.dart';
import 'alert.dart';
import 'package:intl/intl.dart';

class PatientInfo extends StatelessWidget {
  PatientInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Select Patient';

    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 230, 241, 225),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(appTitle),
      ),
      body: const PatientInfoForm(), // body
    );
  }
}

// Create a Form widget.
class PatientInfoForm extends StatefulWidget {
  //const MyCustomForm({super.key});
  const PatientInfoForm({Key? key}) : super(key: key);

  @override
  PatientInfoFormState createState() {
    return PatientInfoFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class PatientInfoFormState extends State<PatientInfoForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  //final apiPathController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  final patientNameTextField = TextEditingController();
  final scrollController = ScrollController();
  String dropdownValue = 'One';
  int _patientRegistrationId = 0;
  String _serviceType = "";
  String _pictureSource = "";
  String _pictureType = "";
  String _isScanComplete = "";

  late Future<List<PatientRegistrationForScannerClientViewModel>> visits;

  // manage state of modal progress HUD widget
  bool _isInAsyncCall = false;

  @override
  void initState() {
    super.initState();

    _loadForm();
  }

  Future<void> _loadForm() async {
    List<PatientRegistrationForScannerClientViewModel> visitList =
        <PatientRegistrationForScannerClientViewModel>[];

    this.visits = Future.sync(() => visitList);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    //apiPathController.dispose();
    patientNameTextField.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Branch 1"), value: "Branch 1"),
      DropdownMenuItem(child: Text("Branch 2"), value: "Branch 2"),
      DropdownMenuItem(child: Text("Branch 3"), value: "Branch 3"),
      DropdownMenuItem(child: Text("Branch 4"), value: "Branch 4"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get serviceTypeDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("OPD"), value: "OPD"),
      DropdownMenuItem(child: Text("IPD"), value: "IPD"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get pictureSourceDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("NA"), value: "NA"),
      DropdownMenuItem(child: Text("OPD"), value: "OPD"),
      DropdownMenuItem(child: Text("IPD"), value: "IPD"),
      DropdownMenuItem(child: Text("OT"), value: "OT"),
      DropdownMenuItem(child: Text("Diagnostic"), value: "Diagnostic"),
      DropdownMenuItem(child: Text("Lab"), value: "Lab"),
      DropdownMenuItem(child: Text("Subspecialty"), value: "Subspecialty"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get pictureTypeDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("NA"), value: "NA"),
      DropdownMenuItem(child: Text("OPDCARD"), value: "OPDCARD"),
      DropdownMenuItem(child: Text("DISCHARGECARD"), value: "DISCHARGECARD"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get isScanCompleteDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("No"), value: "No"),
      DropdownMenuItem(child: Text("Yes"), value: "Yes"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get defaultDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select One"), value: ""),
    ];
    return menuItems;
  }

  Future<void> _loadPatientAsync(String mrn) async {
    PatientForScannerClientViewModel patientVisits =
        await _apiClient.getPatientByMrn(mrn);

    patientNameTextField.text = patientVisits.fullName;

    List<PatientRegistrationForScannerClientViewModel> visitlist =
        List<PatientRegistrationForScannerClientViewModel>.from(
            patientVisits.visits.map((model) =>
                PatientRegistrationForScannerClientViewModel.fromJson(model)));

    this.visits = Future.sync(() => visitlist);

    setState(() {});
  }

  Future<List<FileSystemEntity>> dirContents(Directory dir) {
    var files = <FileSystemEntity>[];
    var completer = Completer<List<FileSystemEntity>>();
    var lister = dir.list(recursive: false);
    lister.listen((file) => files.add(file),
        // should also register onError
        onDone: () => completer.complete(files));
    return completer.future;
  }

  @override
  //  Widget build(BuildContext context) {
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ...[
                TextFormField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  decoration:  InputDecoration(
                    // filled: true,
                    hintText: 'Mrno',
                    // labelText: 'Mrno',
                     enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      print(value);
                      _loadPatientAsync(value);
                    });
                    //   setState(() {});
                    //formData.email = value;
                  },
                ),
                FutureBuilder<
                    List<PatientRegistrationForScannerClientViewModel>>(
                  future: visits,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        return DropdownButtonFormField(
                           decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                              ),
                            items: snapshot.data
                                ?.map((PatientRegistrationForScannerClientViewModel
                                        item) =>
                                    DropdownMenuItem<String>(
                                        child: Text(
                                            "[Visit:${item.visitCount.toString()}] ${DateFormat('MM/dd/yyyy').format(item.registrationDate)}  [${item.registrationTypeName}] \n [Dpt: ${item.department}]"),
                                        value: item.registrationId.toString()))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _patientRegistrationId =
                                    int.parse(value.toString());
                                //formData.branchId = int.parse(value.toString());
                              });
                            });
                      } else {
                        return DropdownButtonFormField(
                            items: defaultDropdownItems,
                            onChanged: (value) {
                              setState(() {});
                            });
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                TextFormField(
                  controller: patientNameTextField,
                  readOnly: true,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    // filled: true,
                    hintText: 'Patient Name',
                    // labelText: 'Patient Name',
                  ),
                  onChanged: (value) {
                    //formData.email = value;
                  },
                ),
                DropdownButtonFormField(
                  decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    // filled: true,
                    hintText: 'Service Type',
                  ),
                  items: serviceTypeDropdownItems,
                  hint: Text("Service Type"),
                  onChanged: (value) {
                    setState(() {
                      _serviceType = value.toString();
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    // filled: true,
                    // labelText: 'Picture Source',
                  ),
                  items: pictureSourceDropdownItems,
                  hint: Text("Picture Source"),
                  onChanged: (value) {
                    setState(() {
                      _pictureSource = value.toString();
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    // filled: true,
                    // labelText: 'Picture Type',
                  ),
                  items: pictureTypeDropdownItems,
                  hint: Text("Picture Type"),
                  onChanged: (value) {
                    setState(() {
                      _pictureType = value.toString();
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                    // filled: true,
                    // labelText: 'Is Scan Complete',
                  ),
                  items: isScanCompleteDropdownItems,
                  hint: Text("Is Scan Complete"),
                  onChanged: (value) {
                    setState(() {
                      _isScanComplete = value.toString();
                    });
                  },
                ),
                Container(
                   margin: EdgeInsets.symmetric(vertical: 10),
                    height: 55,
                    width: 700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.cyan.shade700,
                    ),
                  child: MaterialButton(
                    child: const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 16),),
                    onPressed: () async {
                      // Get all files from the folder
                  
                      String appDocPath = "";
                      Directory appDocDir =
                          await getApplicationDocumentsDirectory();
                      final Directory appDocDirFolder =
                          Directory('${appDocDir.path}/DynamicEmrScan/');
                      final Directory appScanFolder =
                          await appDocDirFolder.create(recursive: true);
                      appDocPath = appScanFolder.path;
                  
                      List<FileSystemEntity> folderFiles =
                          await dirContents(appScanFolder);
                      // List<String> base64Images = [];
                      List<ScanDocumentDto> docs = [];
                      var fileIndex = 0;
                      if (folderFiles != null && folderFiles.length > 0) {
                        for (var entity in folderFiles) {
                          if (await FileSystemEntity.isFile(entity.path)) {
                            var f = File(entity.path);
                            List<int> imageBytes = await f.readAsBytes();
                            String base64Image = base64Encode(imageBytes);
                            // base64Images.add(base64Image);
                            ScanDocumentDto docDto = new ScanDocumentDto(
                                base64Image, fileIndex, _patientRegistrationId);
                            docs.add(docDto);
                          }
                        }
                      } else {
                        showAlert(
                            bContext: context,
                            title: "No file to upload",
                            content: "No file to upload");
                      }
                  
                      ScanDocumentMasterDto parameterObj =
                          new ScanDocumentMasterDto(docs, _serviceType,
                              _pictureSource, _isScanComplete, _pictureType);
                  
                      var isSuccess = await _apiClient.uploadImages(
                          _patientRegistrationId, parameterObj);
                      print(isSuccess);
                      if (isSuccess == true) {
                        if (folderFiles != null && folderFiles.length > 0) {
                          for (var entity in folderFiles) {
                            if (await FileSystemEntity.isFile(entity.path)) {
                              var f = File(entity.path);
                              await f.delete();
                            }
                          }
                        }
                  
                        showAlert(
                            bContext: context,
                            title: "Success",
                            content: "Success");
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      } else {
                        showAlert(
                            bContext: context,
                            title: "Error",
                            content: "could not upload");
                      }
                    },
                  ),
                ),
              ].expand(
                (widget) => [
                  widget,
                  const SizedBox(
                    height: 24,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
