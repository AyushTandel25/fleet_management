import 'package:fleet_management/InputFormField.dart';
import 'package:fleet_management/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static String id = "/LoginScreen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color clr = Colors.grey[200];
  String countryCode, passWord, userId;
  bool visibility = true;
  bool showSpiner = false;
  final controller = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  void hideKb() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.blue[800],
                  Colors.lightBlue[500],
                  Colors.blue[200],
                ]),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ModalProgressHUD(
            inAsyncCall: showSpiner,
            child: SingleChildScrollView(
              child: Form(
                key: _loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Hero(
                      tag: 'logoAnimation',
                      child: Image.asset(
                        "assets/images/fleet.png",
                        // height: 200.0,
                        // width: 200.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: InputFormField(
                        validator: MultiValidator([
                          RequiredValidator(
                            errorText: "Please Enter Username",
                          ),
                        ]),
                        prefixIcon: Icon(
                          Icons.verified_user,
                          color: Colors.lightBlueAccent,
                        ),
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          userId = value;
                        },
                        hintText: "Username",
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: [
                          InputFormField(
                            validator: MultiValidator([
                              RequiredValidator(
                                  errorText: "Please Enter Password"),
                            ]),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.lightBlueAccent,
                            ),
                            obscureText: visibility,
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visibility = !visibility;
                                });
                              },
                              icon: visibility
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              color: Colors.black,
                            ),
                            onSave: (value) {
                              passWord = value;
                            },
                            textInputAction: TextInputAction.done,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightBlueAccent),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          )),
                        ),
                        onPressed: () async {
                          setState(() {
                            showSpiner = true;
                          });
                          var form = _loginFormKey.currentState;
                          if (form.validate()) {
                            form.save();
                            hideKb();
                            await Future.delayed(Duration(seconds: 1));
                            setState(() {
                              showSpiner = false;
                            });
                            Navigator.pushNamed(context, DashBoard.id);
                          } else {
                            setState(() {
                              showSpiner = false;
                            });
                          }
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
