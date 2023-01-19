import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();
  TextEditingController email = new TextEditingController();
  bool showPassword = false;
  final form = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> register() async {
    try {
      final user = _auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      if (user != null) {
        print("User Created");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green, content: Text("Register Success")));
        Navigator.of(context).pushReplacementNamed("/login");
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: (() {
              Navigator.of(context).pushNamed("/login");
            }),
          ),
          backgroundColor: Color.fromARGB(255, 235, 197, 197),
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 235, 197, 197),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: form,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Create an Account',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  Container(
                      margin: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: username,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Username is required";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          hintText: "Username",
                        ),
                      )),
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
                          hintText: " Email",
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
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: confirmPassword,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Confirm Password is required";
                        }
                        return null;
                      },
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(),
                          hintText: "Confirm Password",
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
                        register();
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("Login validation Success")
                        //     )
                        // );
                        // Navigator.of(context).pushNamed("/HomeScreen");
                      } else {
                        print("Invalid");
                      }
                    },
                    child: Text("Register"),
                  ),
                  Row(
                    children: <Widget>[
                      const Text("Already have an account?"),
                      TextButton(
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/login");
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
        ));
  }
}
