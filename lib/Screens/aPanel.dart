
import 'package:flutter/material.dart';
import 'package:istoreadmin/Elements/PicContainer.dart';
import 'package:istoreadmin/Elements/TextStyles.dart';
import 'package:istoreadmin/Screens/addNewProduct.dart';
import 'package:istoreadmin/Screens/addNewVendor.dart';


class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                'Admin Panel',
                style: kHeaderStyle,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.31),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        child: OptionCard(img: 'images/newVendor.png',name: 'Add New Vendor',),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewVendor()));
                        },
                      ),
                      OptionCard(img: 'images/searchVendor.png',name: 'Search Vendor',),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      OptionCard(img: 'images/add_notification.png',name: 'Add Notification',),
                      InkWell(
                        child: OptionCard(img: 'images/offers.png',name: 'Offers',),
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewProduct()));
                        },
                      ),
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  OptionCard({this.img,this.name});
  final String img,name;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Container(
        padding: EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height*0.22,
        width: MediaQuery.of(context).size.width*0.382,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Tab(
              icon: Image(
                image: AssetImage(img),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff797979),
                  fontSize: 15,
                  fontWeight: FontWeight.w400
              ),
            ),
          ],
        ),
      ),
    );
  }
}
