import 'package:coffee_shop/screens/detailscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemsWidget extends StatelessWidget {
  List img = [
    'Latte',
    'Expresso',
    'Black Coffee',
    'Cold Coffee',
    'Cappuccino',
    'Americano',
  ];
  List prices = [
    'Rs. 80',
    'Rs. 90',
    'Rs. 100',
    'Rs. 110',
    'Rs. 120',
    'Rs. 130',
  ];
  List description = [
    '   A type of coffee made with espresso and hot steamed milk, milkier than a cappuccino',
    '   A type of strong black coffee made by forcing steam through ground coffee beans',
    '   Espresso Ristretto Doppio (a double espresso and considered by many coffee drinkers to be the standard shot) Short black Long black Americano Instant coffee (made without milk or cream)',
    '   A type of brewed beverage that is prepared after coffee beans are left to soak in room temperature water for at least a day.',
    '   A type of coffee made with espresso and milk that has been frothed up with pressurized steam.',
    '   A drink of espresso coffee diluted with hot water.'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 195),
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(
                                  name: img[i],
                                  price: prices[i],
                                  image: img[i],
                                  description: description[i],
                                )));
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/${img[i]}.jpg",
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          img[i],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prices[i],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
