import 'package:coffee_shop/screens/login.dart';
import 'package:coffee_shop/screens/reviews.dart';
import 'package:flutter/material.dart';
import 'helpandsupport.dart';

class Option extends StatefulWidget {
  const Option({super.key});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/dashboard");
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Color.fromARGB(255, 235, 197, 197),
          elevation: 0,
          title: Text(
            "More",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 235, 197, 197),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: form,
              child: Column(children: [
                SizedBox(
                  height: 150,
                ),
                 GestureDetector(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(30)),
                        child: ListTile(
                          leading: Icon(
                            Icons.alarm_sharp,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Reviews",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Reviews(),
                                ));
                          },
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(left: 40),
                        ),
                      ),
                    ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Help & Support",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HelpAndSupport(),
                            ));
                      },
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 40),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/helpandsupport");
                  },

                  child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Logout'),
                                content: const Text(
                                    'Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ));
                                    },
                                    child: Text("Sign Out"),
                                  ),
                                  TextButton(
                                    child: const Text('No'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
