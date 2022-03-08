//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:startup_try_2/animation.dart';
//import 'package:startup_try_2/auth_services.dart';
//import 'package:startup_try_2/homepage.dart';
//
//class LoginPhonePage extends StatefulWidget {
//  @override
//  _LoginPhonePageState createState() => _LoginPhonePageState();
//}
//
//class _LoginPhonePageState extends State<LoginPhonePage> {
//  final _phoneController = TextEditingController();
//  String phoneNo , verificationId,smsCode;
//  bool codeSent = false;
//
//  Future<void> verifyPhone(phoneNo) async {
//    final PhoneVerificationCompleted verified = (AuthCredential authResult){
//      AuthService().signIn(authResult);
//    };
//    final PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) async {
//      print("${authException.message}");
//    };
//    final PhoneCodeSent smsSent = (String verId, [int forceResend]){
//      this.verificationId = verId;
//      setState(() {
//        this.codeSent = true;
//      });
//    };
//    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId){
//      this.verificationId = verId;
//    };
//
//    await FirebaseAuth.instance.verifyPhoneNumber(
//        phoneNumber:phoneNo,
//        timeout: const Duration(seconds: 30),
//        verificationCompleted: verified,
//        verificationFailed: verificationFailed,
//        codeSent: smsSent,
//        codeAutoRetrievalTimeout: autoTimeout
//    );
//  }
//
//  @override
//  Widget _buildNumber(){
//    return Column(
//      children: <Widget>[
//        Padding(
//          padding: EdgeInsets.all(8.0),
//          child: TextFormField(
//            keyboardType: TextInputType.number,
//            controller: _phoneController,
//            onChanged: (value){
//              setState(() {
//                this.phoneNo = value;
//              });
//            },
//            decoration: InputDecoration(
//                prefix: Text("+91 "),
//                prefixIcon: Icon(Icons.phone,color: Colors.blue,),
//                hintText: "Enter Phone Number"
//            ),
//          ),
//        ),
//        codeSent ? Padding(
//          padding: EdgeInsets.all(8.0),
//          child: TextFormField(
//            keyboardType: TextInputType.number,
//            onChanged: (value){
//              setState(() {
//                this.smsCode = value;
//              });
//            },
//            decoration: InputDecoration(
//                prefixIcon: Icon(Icons.phone_forwarded,color: Colors.blue,),
//                hintText: "Enter OTP"
//            ),
//          ),
//        ) : Container(),
//      ],
//    );
//  }
//  Widget _buildLoginPhoneBtn(){
//    return Container(
//      height: 1.4*(MediaQuery.of(context).size.height/25),
//      width: 6*(MediaQuery.of(context).size.width/15),
//      child: RaisedButton(
//        onPressed: () {
//          codeSent
//              ? AuthService().signInWithOTP(smsCode, verificationId)
//              : verifyPhone(phoneNo);
//        },
//        elevation: 5.0,
//        color: Colors.blue,
//        shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(25)
//        ),
//        child: codeSent ? Text("Login",
//          style: TextStyle(
//            color: Colors.white,
//            letterSpacing: 1.1,
//            fontSize: MediaQuery.of(context).size.height/43,
//          ),
//        ) : Text("Verify",
//          style: TextStyle(
//            color: Colors.white,
//            letterSpacing: 1.1,
//            fontSize: MediaQuery.of(context).size.height/43,
//          ),
//        ),
//      ),
//    );
//  }
//  Widget _buildLoginWithPhone(){
//    return Padding(
//      padding: const EdgeInsets.symmetric(vertical: 200,
//        horizontal: 50,
//      ),
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.center,
//        children: <Widget>[
//          ClipRRect(
//            borderRadius: BorderRadius.all(
//              Radius.circular(40),
//            ),
//            child: FadeAnimation(2, Container(
//              height: MediaQuery.of(context).size.height*0.6,
//              width: MediaQuery.of(context).size.width*0.8,
//              color: Colors.white,
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text("Login",style: TextStyle(
//                        color: Colors.blue,
//                        fontWeight: FontWeight.bold,
//                        fontSize: MediaQuery.of(context).size.height/25,
//                      ),
//                      ),
//                    ],
//                  ),
//                  _buildNumber(),
//                  SizedBox(height: 20,),
//                  _buildLoginPhoneBtn(),
//                ],
//              ),
//            ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        resizeToAvoidBottomPadding: false,
//        body: SingleChildScrollView(
//          child: Stack(
//            children: <Widget>[
//              FadeAnimation(1.2, Container(
//                height: MediaQuery.of(context).size.height*0.6,
//                width: MediaQuery.of(context).size.width,
//                child: Container(
//                  decoration: BoxDecoration(
//                      gradient: LinearGradient(
//                          colors: [Colors.lightBlue, Colors.blue, Colors.indigo,]
//                      ),
//                      borderRadius: BorderRadius.only(
//                        bottomLeft: const Radius.circular(50),
//                        bottomRight: const Radius.circular(50),
//                      )
//                  ),
//                ),
//              ),
//              ),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  _buildLoginWithPhone(),
//                ],
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//
