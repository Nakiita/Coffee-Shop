import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool showPassword = false;
  final form = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> login() async {
    try {
      final user = (await _auth.signInWithEmailAndPassword(
              email: email.text, password: password.text))
          .user;
      if (user != null) {
        Navigator.of(context).pushReplacementNamed("/login");
      }
      if (user != null) {
        print("Login Success");
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 197, 197),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: form,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Log Into Your Account',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 50,
                ),
                Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: email,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        hintText: "Email",
                      ),
                    )),
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: password,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: "Password",
                        suffixIcon: showPassword
                            ? InkWell(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Icon(Icons.panorama_fish_eye))
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                                child: Icon(Icons.remove_red_eye))),
                  ),
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      if (form.currentState!.validate()) {
                        login();
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("Login validation Success")
                        //     )
                        // );
                        // Navigator.of(context).pushNamed("/HomeScreen");
                      } else {
                        print("Invalid");
                      }
                    },
                    child: Text("Log In")),
                SizedBox(
                  height: 150,
                ),
                Row(
                  children: <Widget>[
                    const Text("Does not have account?"),
                    TextButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/register");
                        //signup screen
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showBaselines() {
  debugPaintBaselinesEnabled = true;
}
