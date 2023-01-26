import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  int _quantity = 0;

  final String name;
  final String price;
  final String image;
  final String description;

  DetailsPage(
      {Key? key,
      required this.name,
      required this.price,
      required this.image,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 197, 197),
      appBar: AppBar(
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 235, 197, 197),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                "assets/images/$image.jpg",
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                price,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Description ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 100),
              RawMaterialButton(
                onPressed: () {
                  if (_quantity > 0) {
                    _quantity--;
                  }
                },
                constraints:
                    BoxConstraints().tighten(height: 30.0, width: 30.0),
                elevation: 7.0,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 30.0,
                ),
                fillColor: Colors.white24,
              ),
              SizedBox(
                width: 20.0,
              ),
              RawMaterialButton(
                onPressed: () {
                  if (_quantity < 10) {
                    _quantity++;
                  }
                },
                constraints:
                    BoxConstraints().tighten(height: 30.0, width: 30.0),
                elevation: 7.0,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30.0,
                ),
                fillColor: Colors.white24,
              ),
              ElevatedButton(
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: () {},
              ),
              SizedBox(
                width: 30,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {},
                  child: Text(
                    "Buy Now",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
