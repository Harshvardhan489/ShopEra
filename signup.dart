import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/animation.dart';
import 'package:startup_try_2/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:startup_try_2/login.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  String name,email,password;

  FirebaseAuth _auth = FirebaseAuth.instance;
//  void sendverify () async {
//    FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//  }

  @override
//  Widget _buildName(){
//    return Padding(
//      padding: EdgeInsets.all(8.0),
//      child: TextFormField(
//        keyboardType: TextInputType.text,
//        onChanged: (value){
//          setState(() {
//            name=value;
//          });
//        },
//        decoration: InputDecoration(
//            prefixIcon: Icon(Icons.person,color: Colors.blue,),
//            hintText: "Enter Name"
//        ),
//      ),
//    );
//  }
  Widget _buildEmail(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value){
          setState(() {
            email=value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email,color: Colors.blue,),
            hintText: "Enter Email-Id"
        ),
      ),
    );
  }
  Widget _buildPassword(){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value){
          setState(() {
            password=value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_outline,color: Colors.blue,),
            hintText: "Enter Password"
        ),
      ),
    );
  }
//  Widget _buildConfirmPassword(){
//    return Padding(
//      padding: EdgeInsets.all(8.0),
//      child: TextFormField(
//        keyboardType: TextInputType.text,
//        obscureText: true,
//        onChanged: (value){
//          setState(() {
//            password=value;
//          });
//        },
//        decoration: InputDecoration(
//            prefixIcon: Icon(Icons.lock,color: Colors.blue,),
//            labelText: "Confirm Password"
//        ),
//      ),
//    );
//  }
  Widget _buildSignUpBtn(){
    return Container(
      height: 1.4*(MediaQuery.of(context).size.height/25),
      width: 6*(MediaQuery.of(context).size.width/15),
      child: RaisedButton(
        onPressed: () async{
          try{
         final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            if(newUser != null){
//              FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
              Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => LoginPage()));
            }
          }
          catch(e){
            print(e);
          }
        },
        elevation: 5.0,
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        child: Text("Sign Up",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.1,
            fontSize: MediaQuery.of(context).size.height/43,
          ),
        ),
      ),
    );
  }
  Widget _buildSignUp(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 200,
        horizontal: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            child: FadeAnimation(2, Container(
              height: MediaQuery.of(context).size.height*0.6,
              width: MediaQuery.of(context).size.width*0.8,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Sign Up",style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height/25,
                      ),
                      ),
                    ],
                  ),
                  //_buildName(),
                  _buildEmail(),
                  _buildPassword(),
                 // _buildConfirmPassword(),
                  SizedBox(height: 20,),
                  _buildSignUpBtn(),
                ],
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              FadeAnimation(1.2, Container(
                height: MediaQuery.of(context).size.height*0.6,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.lightBlue, Colors.blue, Colors.indigo,]
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(50),
                        bottomRight: const Radius.circular(50),
                      )
                  ),
                ),
              ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildSignUp(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
