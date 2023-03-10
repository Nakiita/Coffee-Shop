import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop/screens/dashboard.dart';
import 'package:coffee_shop/screens/detailscreen.dart';
import 'package:coffee_shop/services/notification_service.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

class DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter DateTimePicker Demo',
      home: MyHomePage(),
      localizationsDelegates: [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US')],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController address = TextEditingController();
  GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();
  late TextEditingController _dateController;
  late TextEditingController _timeController;

  @override
  void initState() {
    super.initState();
    Intl.defaultLocale = 'en_US';
    //_initialValue = DateTime.now().toString();

    _dateController = TextEditingController(text: DateTime.now().toString());

    String lsHour = TimeOfDay.now().hour.toString().padLeft(2, '0');
    String lsMinute = TimeOfDay.now().minute.toString().padLeft(2, '0');
    _timeController = TextEditingController(text: '$lsHour:$lsMinute');
  }

  Future<void> saveDateTime(String date, String time) async {
    await FirebaseFirestore.instance.collection("datesTime").add({
      'Date': date,
      'Time': time,
    }).catchError((e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 197, 197),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color.fromARGB(255, 235, 197, 197),
        elevation: 0,
        title: Text(
          'Delivery time',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Form(
          key: _oFormKey,
          child: Column(children: <Widget>[
            DateTimePicker(
              type: DateTimePickerType.date,
              dateMask: 'yyyy/MM/dd',
              controller: _dateController,
              //initialValue: _initialValue,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: Icon(Icons.event),
              dateLabelText: 'Date',
              locale: Locale('en', 'US'),
            ),
            DateTimePicker(
              type: DateTimePickerType.time,
              //timePickerEntryModeInput: true,
              controller: _timeController,
              // initialValue: '', //_initialValue,
              icon: Icon(Icons.access_time),
              timeLabelText: "Time",
              use24HourFormat: false,
              locale: Locale('en', 'US'),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Delivery Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  controller: address,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Address is required";
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.place),
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Delivery Address",
                  ),
                )),
            SizedBox(height: 100),
            Text(
              "Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  ' - Cash On Delivery',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 200),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                label: Text(
                  "Order Now",
                  style: TextStyle(color: Colors.black),
                ),
                icon: Icon(
                  Icons.delivery_dining,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  NotificationService.display(
                      "Order Acknowledgement",
                      "Your Order is acknowledge, we will contact you soon",
                      "Your order",
                      context);
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
