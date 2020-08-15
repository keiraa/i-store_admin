import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:istoreadmin/Screens/aPanel.dart';

final _auth = FirebaseAuth.instance;
final firestoreInstance = Firestore.instance;

signin(email,password,context) async {
  final user =
  await _auth.signInWithEmailAndPassword(email: email, password: password);
  if (user != null) {
    FlutterToast.showToast(
        msg: "signed in  successfully ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AdminPanel()),
    );
  } else {
    FlutterToast.showToast(
        msg: "invalid details",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5);
    return 1;
  }

}