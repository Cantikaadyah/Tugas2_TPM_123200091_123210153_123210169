import 'package:flutter/material.dart';
import 'package:tugastpm1/main.dart';
import 'package:tugastpm1/homepage.dart';


class GanjilGenap extends StatelessWidget {
  const GanjilGenap({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ganjil Genap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GanjilGenapPage(),
    );
  }
}

class GanjilGenapPage extends StatefulWidget {
  @override
  _GanjilGenapPageState createState() => _GanjilGenapPageState();
}

class _GanjilGenapPageState extends State<GanjilGenapPage> {
  TextEditingController _num1Controller = TextEditingController();
  double result = 0;
  var status = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan bilangan',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _check,
                  child: Text('Check'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '$status',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }

  void _check() {
    double num1 = double.tryParse(_num1Controller.text) ?? 0;
    setState(() {
      result = num1 % 2;
      if (result == 0) {
        status = "Genap";
      } else {
        status = "Ganjil";
      }
    });
  }

  void _logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  void _homePage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
