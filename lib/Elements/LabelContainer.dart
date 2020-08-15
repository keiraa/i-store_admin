
import 'package:flutter/material.dart';
import 'package:istoreadmin/Elements/TextStyles.dart';

class LabelContainer extends StatelessWidget {
  LabelContainer({this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.025,left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05,bottom: MediaQuery.of(context).size.height*0.01),
      child: Text(
        label,
        style: kVLabelTextField,
      ),
    );
  }
}


class HintLabelContainer extends StatelessWidget {
  HintLabelContainer({this.hintLabel});
  final String hintLabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.005,left: MediaQuery.of(context).size.width*0.05,right: MediaQuery.of(context).size.width*0.05),
      child: Text(
        hintLabel,
        style: kHintText,
      ),
    );
  }
}

