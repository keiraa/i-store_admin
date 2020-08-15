import 'package:flutter/material.dart';

class PicContainer extends StatelessWidget {
  PicContainer({this.image,this.right=0,this.left=0,this.bottom=0,this.top=0,this.h=1,this.w=1});
  final double top,bottom,left,right,h,w;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top,bottom: bottom,left: left,right: right),
      height: MediaQuery.of(context).size.height*h,
      width: MediaQuery.of(context).size.width*w,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill,
          )
      ),
    );
  }
}