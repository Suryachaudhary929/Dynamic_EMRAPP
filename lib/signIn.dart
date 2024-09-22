import 'package:flutter/material.dart';
import 'model/credential_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'apiclient.dart';
import 'appSettings.dart';
import 'model/branch.dart';
import 'model/login_response.dart';
import 'main.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SignIn extends StatelessWidget {
  //const AppSetting({super.key});
  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Sign In';
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 241, 225),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(appTitle),
      ),
      body: const SignInForm(), // body
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        mouseCursor: MouseCursor.defer,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AppSetting()));
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Create a Form widget.
class SignInForm extends StatefulWidget {
  //const MyCustomForm({super.key});
  const SignInForm({Key? key}) : super(key: key);

  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class SignInFormState extends State<SignInForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final apiPathController = TextEditingController();
  final ApiClient _apiClient = ApiClient();
  //List<DropdownMenuItem<String>> menuItems = [];
  // late Future<List<Branch>> futureBranch;

  CredentialModel formData = CredentialModel("", "", 0);

  String dropdownValue = 'One';

  @override
  void initState() {
    super.initState();
    //_loadBranches();
    _isobscured = true;
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

  // List<DropdownMenuItem<String>> get dropdownItems {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     DropdownMenuItem(child: Text("Branch 1"), value: "Branch 1"),
  //     DropdownMenuItem(child: Text("Branch 2"), value: "Branch 2"),
  //     DropdownMenuItem(child: Text("Branch 3"), value: "Branch 3"),
  //     DropdownMenuItem(child: Text("Branch 4"), value: "Branch 4"),
  //   ];
  //   return menuItems;
  // }

  List<DropdownMenuItem<String>> get defaultDropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
        child: Text("Select One"),
        value: "",
      ),
    ];
    return menuItems;
  }

  var _isobscured;

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
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/images/login.png",
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      // filled: true,
                      hintText: 'Username',
                      // labelText: 'username',
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
                      formData.username = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      prefixIcon: Icon(Icons.password),
                      // filled: true,
                      // labelText: 'Password',
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isobscured = !_isobscured;
                            });
                          },
                          icon: _isobscured
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility))),
                  obscureText: _isobscured,
                  onChanged: (value) {
                    formData.password = value;
                  },
                ),
                // DropdownButtonFormField(
                //   decoration: const InputDecoration(
                //     filled: true,
                //     labelText: 'Branch',
                //   ),
                //   items: menuItems,
                //   hint: Text("Branch"),
                //   onChanged: (value) {
                //     setState(() {});
                //   },
                // ),
                SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<Branch>>(
                  future: _loadBranchesAsync(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return DropdownButtonHideUnderline(
                        child: DropdownButtonFormField(
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
                            hint: Text("Select One"),
                            isDense: true,
                            isExpanded: true,
    
                            // dropdownStyleData: DropdownStyleData(
                            //   maxHeight: 530,
                            //   width: 400,
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: Colors.white,
                            //   ),
                            //    offset: const Offset(-20, 0),
                            //   scrollbarTheme: ScrollbarThemeData(
                            //     radius: const Radius.circular(40),
                            //     thickness:
                            //         MaterialStateProperty.all<double>(6),
                            //     thumbVisibility:
                            //         MaterialStateProperty.all<bool>(true),
                            //   ),
                            // ),  
                            // menuItemStyleData: const MenuItemStyleData(
                            //   height: 45,
                            //   padding: EdgeInsets.only(left: 14, right: 14),
                            // ),
                            items: snapshot.data
                                ?.map(
                                    (Branch item) => DropdownMenuItem<String>(
                                        child: Text(
                                          item.branchName,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        value: item.id.toString()))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                formData.branchId =
                                    int.parse(value.toString());
                              });
                            }),
                      );
                    } else {
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
                        // hint: Text("Select One"),
                        value: "",
                        isDense: true,
                        isExpanded: true,
                        items: defaultDropdownItems,
                        onChanged: (value) {
                          setState(() {});
                        },
                        // dropdownStyleData: DropdownStyleData(
                        //   maxHeight: 200,
                        //   width: 370,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Colors.white,
                        //   ),
                        //   offset: const Offset(-20, 0),
                        //   scrollbarTheme: ScrollbarThemeData(
                        //     radius: const Radius.circular(40),
                        //     thickness:
                        //         MaterialStateProperty.all<double>(6),
                        //     thumbVisibility:
                        //         MaterialStateProperty.all<bool>(true),
                        //   ),
                        // ),
                        // menuItemStyleData: const MenuItemStyleData(
                        //   height: 50,
                        //   padding: EdgeInsets.only(left: 14, right: 14),
                        // ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 15,
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
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    onPressed: () async {
                      try {
                        LoginResponse loginResponse =
                            await _apiClient.login(formData);
                        _setJwtToken(loginResponse, formData.branchId);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
    
                        print(loginResponse);
    
                        //String responseJson = json.encode(loginResponse.toJson());
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Unable to login.')),
                        );
                      }
    
                      // Use a JSON encoded string to send
                      // var result = await widget.httpClient!.post(
                      //     Uri.parse('https://example.com/signin'),
                      //     body: json.encode(formData.toJson()),
                      //     headers: {'content-type': 'application/json'});
    
                      // if (result.statusCode == 200) {
                      //   _showDialog('Successfully signed in.');
                      // } else if (result.statusCode == 401) {
                      //   _showDialog('Unable to sign in.');
                      // } else {
                      //   _showDialog('Something went wrong. Please try again.');
                      // }
                    },
                  ),
                ),
              ].expand(
                (widget) => [
                  widget,
                  // const Sizedbox(
                  //   height: 24,
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
