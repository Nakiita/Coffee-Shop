import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  DetailsPage({ Key? key,required this.name,required this.price,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Details")),
        body: Column(
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
          ],
        ));
  }
}
