import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:istoreadmin/Elements/LabelContainer.dart';
import 'package:istoreadmin/Elements/PicContainer.dart';
import 'package:istoreadmin/Elements/TextStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

import 'aPanel.dart';

class AddNewProduct extends StatefulWidget {
  @override
  _AddNewProductState createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  String dropDownValue = 'Grocery';
  List<String> dropDownValues = ['Grocery','Fashion','Pharma','Bakery','Food','Electronics'];
  String selectedImage = 'logo.png';
  Color isSelected = Color(0xffb6b6b6);

  double spinSize =0;

  TextEditingController fieldController;

  var storage = FirebaseStorage.instance;
  File file;
  final _auth = FirebaseAuth.instance;
  final firestoreInstance = Firestore.instance;

  // Details Variables:
  String sId,pName,url,category='Grocery',sTags,oPrice,rPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(bottom: 30),
        children: <Widget>[
          Stack(
            children: <Widget>[
              PicContainer(image: 'images/adminPanelBackground.png',h: 0.3,),
              PicContainer(image: 'images/LowerCurve.png',top: MediaQuery.of(context).size.height*0.1,h: 0.2,w: 0.4,),
              PicContainer(image: 'images/LowerCurve.png',top: MediaQuery.of(context).size.height*0.1,h: 0.2,w: 0.4,),
              PicContainer(left: MediaQuery.of(context).size.width*0.7,h: 0.15,w: 0.3,image: 'images/UpperCurve.png',),
              PicContainer(left: MediaQuery.of(context).size.width*0.7,h: 0.15,w: 0.3,image: 'images/UpperCurve.png',),
              Container(
                height: MediaQuery.of(context).size.height*0.3,
                child: Center(
                  child: Text(
                    'Add new product',
                    style: kHeaderStyle,
                  ),
                ),
              )
            ],
          ),
          LabelContainer(label: 'Store ID',),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: TextField(
              decoration: kVTextField,
              onChanged: (value){
                sId = value;
              },
            ),
          ),
          HintLabelContainer(hintLabel: 'This is auto generated',),
          LabelContainer(label: 'Product Name',),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: TextField(
              decoration: kVTextField.copyWith(
                hintText: '',
              ),
              onChanged: (value){
                pName = value;
              },
            ),
          ),
          HintLabelContainer(hintLabel: 'Please use your legal/known name',),
          LabelContainer(label: 'Url',),
          Container(
            height: MediaQuery.of(context).size.height*0.06,
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
                      color: Color(0xff555555),
                    ),
                    child: Center(
                      child: Text(
                        'https//:',
                        style: kHttps,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: TextField(
                    decoration: kVTextField.copyWith(
                      hintText: '',
                    ),
                    onChanged: (value){
                      url = value;
                    },
                  ),
                )
              ],
            ),
          ),
          HintLabelContainer(hintLabel: 'Please use URL for QR code',),
          LabelContainer(label: 'Category',),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            padding: EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 5),
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xfff1f1f1),
            ),
            child: DropdownButton(
              isExpanded: true,
              style: kDropDownText,
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 40,
                color: Color(0xff7b7b7b),
              ),
              value: dropDownValue,
              underline: SizedBox(),
              onChanged: (String value){
                setState(() {
                  dropDownValue=value;
                  category = value;
                });
              },
              items: dropDownValues.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          HintLabelContainer(hintLabel: 'Please select subcategories in fashion & Food and services ',),
          LabelContainer(label: 'Product Image',),
          GestureDetector(
            onTap: () async{
              file = await FilePicker.getFile();
              setState(() {
                selectedImage = basename(file.path);
                isSelected = Color(0xff555555);
                //TODO: add image file to a variable
              });
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
                padding: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
                width: MediaQuery.of(context).size.width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xfff1f1f1),
                ),
                child: ListTile(
                  title: Text(
                    selectedImage,
                    style: kFieldTextStyle.copyWith(
                      color: isSelected,
                    ),
                  ),
                  trailing: Icon(
                    Icons.file_upload,
                  ),
                )
            ),
          ),
          HintLabelContainer(hintLabel: '300X200 pixels, PNG/JPG',),
          LabelContainer(label: 'Search Tags',),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: TextField(
              maxLines: 5,
              keyboardType: TextInputType.multiline,
              decoration: kVTextField.copyWith(
                hintText: '',
              ),
              onChanged: (value){
                sTags = value;
              },
            ),
          ),
          HintLabelContainer(hintLabel: 'Minimum 5 separate with ";"',),
          LabelContainer(label: 'Offer Price',),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: TextField(
              decoration: kVTextField.copyWith(
                hintText: '',
              ),
              onChanged: (value){
                oPrice=value;
              },
            ),
          ),
          HintLabelContainer(hintLabel: 'INR',),
          LabelContainer(label: 'Regular Price',),
          Container(
            margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
            child: TextField(
              decoration: kVTextField.copyWith(
                hintText: '',
              ),
              onChanged: (value){
                rPrice=value;
              },
            ),
          ),
          HintLabelContainer(hintLabel: 'INR',),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          Center(
            child: InkWell(
              onTap: () async{
                setState(() {
                  spinSize = 20;
                });
                var firebaseUser = await FirebaseAuth.instance.currentUser();
                var uid = firebaseUser.uid;
                StorageTaskSnapshot snapshot = await storage.ref().child('pImages/$uid').putFile(file).onComplete;
                String downloadUrl;
                if(snapshot!=null)
                {
                  downloadUrl = await snapshot.ref.getDownloadURL();
                }
                firestoreInstance.collection('products').document(uid).setData({
                  'Store Id': sId,
                  'Product Name': pName,
                  'Url': url,
                  'Category': category,
                  'Search Tags': sTags,
                  'Offer Price': oPrice,
                  'Regular Price': rPrice,
                  'Product Image': downloadUrl,
                }).then((value){
                  setState(() {
                    spinSize = 0;
                  });
                  print('success!');
                  FlutterToast.showToast(
                    msg: 'Added Product Successfully',
                    gravity: ToastGravity.BOTTOM,
                    toastLength: Toast.LENGTH_SHORT,
                    timeInSecForIosWeb: 5,
                  );
                  Navigator.pop(context);
                  setState(() {
                    selectedImage='logo.png';
                    dropDownValue='Grocery';
                    category='Grocery';

                    isSelected = Color(0xffb6b6b6);
                  });
                });

              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xffefdf16),Color(0xffff9100)]),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Center(
                  child: Text('Add Product',style: kHttps,),
                ),
              ),
            ),
          ),
          Center(
            child: SpinKitThreeBounce(
              color: Color(0xffff9100),
              size: spinSize,
            ),
          )
        ],
      ),
    );
  }
}