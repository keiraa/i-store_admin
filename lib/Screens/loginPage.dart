
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:istoreadmin/Elements/TextStyles.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email,_password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05,vertical: MediaQuery.of(context).size.height*0.015),
          child: ListView(
            children: <Widget>[
              Text(
                'Sign in',
                style: kSignIn,
              ),
              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.56),
                child: CircleAvatar(
                  backgroundColor: Color(0xa1ffd21c),
                  radius: 25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.01,
              ),
              Center(
                child: Text(
                  'Super Admin',
                  style: kLoginHeader,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.08,
              ),
              TextField(
                onChanged: (value){
                  _email=value;
                },
                decoration: kLoginCredentials,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.025,
              ),
              TextField(
                onChanged: (value){
                  _password=value;
                },
                decoration: kLoginCredentials.copyWith(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.1,
              ),
              GestureDetector(
                onTap: (){
                  //signin(_email.trim(), _password.trim(), context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color(0xffffd21c),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/circle.png'),
                      ),
                      Center(
                        child: Text(
                          'Login',
                          style: kLoginStyle,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
