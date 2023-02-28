import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  int _current = 0;

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
          "Help And Support",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 235, 197, 197),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 8),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200,
                        viewportFraction: 1.0,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: [
                        Image.asset("assets/images/Last.jpg"),
                        Image.asset("assets/images/help.jpg"),
                        Image.asset("assets/images/Support.jpg"),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          i == _current
                              ? _buildDot(context, true)
                              : _buildDot(context, false),
                      ],
                    ),
                    SizedBox(height: 16),
                    Center(
                      child: Text(
                        "Help and Support",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        Text(
                          "Having Problem?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "We are 24hrs available at your service",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 8),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text(
                      "Support Provided",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Write a Mail on"),
                                  content: Text("nakita@gmail.com"),
                                );
                              },
                            );
                          },
                          child: _buildServiceTile(
                              "Write a mail", "assets/images/email.jpg"),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Make a call on"),
                                  content: Text("9841000000"),
                                );
                              },
                            );
                          },
                          child: _buildServiceTile(
                              "Make a call", "assets/images/call.jpg"),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Widget _buildDot(BuildContext context, bool isActive) {
    return Container(
      width: 8,
      height: 8,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Theme.of(context).primaryColor : Colors.grey,
      ),
    );
  }

  Widget _buildServiceTile(String title, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 8),
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(imagePath, width: 48, height: 48),
              SizedBox(height: 16),
              Text(title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          ),
        ),
      ],
    );
  }
}
