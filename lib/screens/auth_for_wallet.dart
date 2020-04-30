import 'package:favelasemcorona/constants.dart';
import 'package:favelasemcorona/screens/wallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends StatefulWidget{
  static const id ="auth";
  @override
  AuthState createState() => AuthState();
}

class AuthState extends State<Auth>{
  bool otpUi=false;
  TextEditingController otp = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: nearlyWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: nearlyWhite,
        brightness: Brightness.light,
        title: Text("Create New Wallet", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: Image.network('https://raw.githubusercontent.com/itsencrypted/favela_sem_corona_api/master/images/logo.png'),
              height:MediaQuery.of(context).size.height*0.35,),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05 ,
            ),
            RaisedButton(
              onPressed: ()async{
                final GoogleSignIn _googleSignIn = GoogleSignIn();
                final FirebaseAuth _auth = FirebaseAuth.instance;
                final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
                final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
                final AuthCredential credential = GoogleAuthProvider.getCredential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken,
                );
                final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
                SharedPreferences prefs = await SharedPreferences.getInstance();
                print(user.email);
                prefs.setString(prefEmail,user.email);
                prefs.setString(prefUser, user.displayName);
                Navigator.pop(context);
              },
              color: Colors.red,
              child: Text("Login with Google",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      )
    );
  }

}