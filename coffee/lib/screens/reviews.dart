import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _Reviews();
}

class _Reviews extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/more");
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Color.fromARGB(255, 235, 197, 197),
          elevation: 0,
          title: Text(
            "Reviews",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 235, 197, 197),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Any Reviews?',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 40,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'You Can Write here',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black87)),
              ),
              maxLines: 15,
              minLines: 3,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Submit Confirmation"),
                      content: Text("Are you sure you want to submit?"),
                      actions: [
                        ElevatedButton(
                          child: Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text("Submit"),
                          onPressed: () {
                            // Add your submit logic here
                            Navigator.of(context).pushNamed("/dashboard");

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Submitted Successfully"),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              label: Text(
                "Submit",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              icon: Icon(Icons.move_to_inbox),
            ),
          ],
        ),
      ),
    );
  }
}
