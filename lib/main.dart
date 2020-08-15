import 'package:flutter/material.dart';
import 'package:istoreadmin/Screens/aPanel.dart';
import 'package:istoreadmin/Screens/addNewVendor.dart';
import 'package:istoreadmin/Screens/loginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddNewVendor(),
    );
  }
}
