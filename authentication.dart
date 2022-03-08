import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_try_2/animation.dart';
import 'package:startup_try_2/login.dart';
import 'package:startup_try_2/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:startup_try_2/homepage.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  bool check = false;

  _login() async{
    try{
      await _googleSignIn.signIn();
      check = true;
    }
    catch(e){
      print(e);
    }
  }

  Widget _buildLoginBtn(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4*(MediaQuery.of(context).size.height/25),
          width: 6*(MediaQuery.of(context).size.width/15),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => LoginPage()));
            },
            elevation: 5.0,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)
            ),
            child: Text("Login",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.1,
                fontSize: MediaQuery.of(context).size.height/43,
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildSignUpBtn(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4*(MediaQuery.of(context).size.height/25),
          width: 6*(MediaQuery.of(context).size.width/15),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => SignUpPage()));
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
        ),
      ],
    );
  }
  Widget _buildBox(){
    return Padding(
      padding: const EdgeInsets.only(top: 50,bottom: 200,left: 50,right: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              child: FadeAnimation(2, Container(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width*0.8,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15,),
                    _buildLoginBtn(),
                    _buildSignUpBtn(),
                    Divider(
                      color: Colors.blue,
                    ),
                    Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blueGrey.shade200,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      child: FlatButton(onPressed: (){
                        _login();
                        if(check == true){
                          Navigator.push(context, new MaterialPageRoute(builder: (context) => HomePage()));
                        }
                      },
                        child: Text("Sign-In with Google"),
                    ),),
                  ],
                ),
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
                height: MediaQuery.of(context).size.height/1.25,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          //color: [Colors.lightBlue, Colors.blue, Colors.indigo,]
                        colors : [Colors.lightBlue, Colors.blue, Colors.indigo,],
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
                  SizedBox(
                    height: (MediaQuery.of(context).size.height)/8,
                  ),
                  Container(
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: (MediaQuery.of(context).size.height)/6,
                    ),
                  ),
                  // SizedBox(
                  //   height: (MediaQuery.of(context).size.height)/90,
                  // ),
                  _buildBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


