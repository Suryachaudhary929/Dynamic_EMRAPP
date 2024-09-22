import 'dart:convert';

import 'package:dynamicemrapp/model/patient_for_scanner_client_view_model.dart';
import 'package:dynamicemrapp/scan_document_master_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'model/branch.dart';
import 'model/login_response.dart';
import 'model/credential_model.dart';

class ApiClient {
  Future<List<Branch>> getBranches() async {
    final prefs = await SharedPreferences.getInstance();
    String basePath = (prefs.getString('DynamicEmrApiPath') ?? "");
    var url = Uri.parse(basePath + '/Api/Scanner/GetAllBranchForApi');

    var response = await http.get(url);

    print(response.body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Iterable l = json.decode(response.body);
      List<Branch> branches =
          List<Branch>.from(l.map((model) => Branch.fromJson(model)));
      branches.forEach((element) {
        print(element.toJson());
      });
      return branches;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load branch');
    }
  }

  Future<LoginResponse> login(CredentialModel crediential) async {
    print(crediential.toJson());
    final prefs = await SharedPreferences.getInstance();
    String basePath = (prefs.getString('DynamicEmrApiPath') ?? "");

    var url = Uri.parse(basePath + '/UserAdmin/LoginFromApi');
    print(url);
    try {
      var response = await http.post(url,
          body: json.encode(crediential.toJson()),
          headers: {'content-type': 'application/json'});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        LoginResponse loginResponse =
            LoginResponse.fromJson(json.decode(response.body));
        return loginResponse;
      } else {
        print(response.statusCode);
        throw Exception("Fail to login");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<PatientForScannerClientViewModel> getPatientByMrn(String mrn) async {
    final prefs = await SharedPreferences.getInstance();
    String basePath = (prefs.getString('DynamicEmrApiPath') ?? "");
    int branchId = (prefs.getInt("DyanmicEmrLoginBranchId") ?? 0);
    var url = Uri.parse(
        basePath + '/Api/Client/GetPatientByMrn/$mrn/${branchId.toString()}');
    print(url);
    final response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      PatientForScannerClientViewModel patientResposne =
          PatientForScannerClientViewModel.fromJson(json.decode(response.body));

      print("Ok success");
      return patientResposne;
    } else {
      print("Error occured");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load patient');
    }
  }

  Future<bool> uploadImages(
      int patientRegistrationid, ScanDocumentMasterDto dto) async {
    final prefs = await SharedPreferences.getInstance();
    String basePath = (prefs.getString('DynamicEmrApiPath') ?? "");
    String token = (prefs.getString('DynamicEmrLoginToken') ?? "");
    var url = Uri.parse(
        basePath + '/api/Scanner/${patientRegistrationid.toString()}');
    print(url);
    var jsonObj = json.encode(dto.toJson());

    var response = await http.post(url, body: jsonObj, headers: {
      "Authorization": 'Bearer $token',
      "Content-Type": "application/json"
    });

    if (response.statusCode == 200) {
      // print(json.decode(response.body));
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

  Future<bool> checkLoginA() async {
    final prefs = await SharedPreferences.getInstance();
    String basePath = (prefs.getString('DynamicEmrApiPath') ?? "");
    String token = (prefs.getString('DynamicEmrLoginToken') ?? "");
    var url = Uri.parse('$basePath/api/Scanner/CheckLoginA');
    print(url);

    var response = await http.post(url, body: null, headers: {
      "Authorization": 'Bearer $token',
      "Content-Type": "application/json"
    });

    if (response.statusCode == 200) {
      print(response);
      return true;
    } else {
      print(response);
      return false;
    }
  }

  Future<bool> checkLoginB() async {
    final prefs = await SharedPreferences.getInstance();
    String basePath = (prefs.getString('DynamicEmrApiPath') ?? "");
    String token = (prefs.getString('DynamicEmrLoginToken') ?? "");
    var url = Uri.parse(basePath + '/api/Scanner/CheckLoginB');
    print(url);

    var response = await http.post(url, body: null, headers: {
      "Authorization": 'Bearer $token',
      "Content-Type": "application/json"
    });

    if (response.statusCode == 200) {
      print(response);
      return true;
    } else {
      print(response);
      return false;
    }
  }
}




//   Future<List<PatientForScannerClientViewModel>> getPatientByMrn(
//       String mrn) async {
//     final prefs = await SharedPreferences.getInstance();
//     String basePath = (prefs.getString('DynamicEmrApiPath') ?? "");
//     int branchId = (prefs.getInt("DyanmicEmrLoginBranchId") ?? 0);
//     var url = Uri.parse(
//         basePath + '/Api/Client/GetPatientByMrn/$mrn/${branchId.toString()}');

//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       // If the server did return a 200 OK response,
//       // then parse the JSON.

//       Iterable l = json.decode(response.body);
//       List<PatientForScannerClientViewModel> patientVisits =
//           List<PatientForScannerClientViewModel>.from(l.map(
//               (model) => PatientForScannerClientViewModel.fromJson(model)));
//       patientVisits.forEach((element) {
//         print(element.toJson());
//       });
//       return patientVisits;

//       // return PatientForScannerClientViewModel.fromJson(
//       //     jsonDecode(response.body));
//     } else {
//       // If the server did not return a 200 OK response,
//       // then throw an exception.
//       throw Exception('Failed to load patient');
//     }
//   }
// }
