import 'package:coffee_shop/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final email = TextEditingController();

  @override
  void dispose() {
    email.dispose(); // TODO: implement dispose
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            //has to be valid email address for receiving the email
            content: Text(' Check your email.'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 197, 197),
        body: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Forgot Password',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: Text(
                      'Enter your email and we will send you a password reset link.',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                        color: const Color(0xffB4B4B4).withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Center(
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      passwordReset();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      child: Text(
                        "Reset Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => LoginScreen(),
                          ));
                        },
                        child: Text(
                          "Back to login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
