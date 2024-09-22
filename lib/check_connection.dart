import 'package:flutter/material.dart';
import 'model/credential_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'apiclient.dart';
import 'appSettings.dart';
import 'model/branch.dart';

class CheckConnection extends StatelessWidget {
  CheckConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Check User Conection';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: const CheckConnectionForm(), // body
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AppSetting()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.settings),
      ),
    );
  }
}

// Create a Form widget.
class CheckConnectionForm extends StatefulWidget {
  //const MyCustomForm({super.key});
  const CheckConnectionForm({Key? key}) : super(key: key);

  @override
  CheckConnectionFormState createState() {
    return CheckConnectionFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CheckConnectionFormState extends State<CheckConnectionForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final apiPathController = TextEditingController();
  final ApiClient _apiClient = ApiClient();

  CredentialModel formData = CredentialModel("", "", 0);

  String dropdownValue = 'One';

  @override
  void initState() {
    super.initState();
    //_loadBranches();
  }

  Future<void> _setJwtToken(loginResponse, int branchId) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('DynamicEmrLoginToken', loginResponse.token);
      prefs.setString(
          'DyanmicEmrLoginExpiration', loginResponse.expiration.toString());
      prefs.setInt('DyanmicEmrLoginBranchId', branchId);
    });
  }

  Future<List<Branch>> _loadBranchesAsync() async {
    List<Branch> branches = await _apiClient.getBranches();
    return branches;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    apiPathController.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<String>> get defaultDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Select One"), value: ""),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ...[
                TextButton(
                  child: const Text('Check A'),
                  onPressed: () async {
                    try {
                      bool response = await _apiClient.checkLoginA();
                      if (response) {
                        ScaffoldMessenger.of(this.context).showSnackBar(
                          const SnackBar(content: Text('Login Success')),
                        );
                      } else {
                        ScaffoldMessenger.of(this.context).showSnackBar(
                          const SnackBar(content: Text('Unable to login.')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Unable to login.')),
                      );
                    }
                  },
                ),
                TextButton(
                  child: const Text('Check B'),
                  onPressed: () async {
                    try {
                      bool response = await _apiClient.checkLoginB();
                      if (response) {
                        ScaffoldMessenger.of(this.context).showSnackBar(
                          const SnackBar(content: Text('Login Success')),
                        );
                      } else {
                        ScaffoldMessenger.of(this.context).showSnackBar(
                          const SnackBar(content: Text('Unable to login.')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Unable to login.')),
                      );
                    }
                  },
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
