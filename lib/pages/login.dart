import 'dart:async';

import 'package:ecommerce/auth_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
   StreamSubscription<User> loginStateSubSubscription;
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen:false);
    authBloc.currentUser.listen((fbUser) {
      if(fbUser != null){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      }
     });
    super.initState();
  }
  @override
  void dispose() {
    loginStateSubSubscription.cancel();
    super.dispose();
  }
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  // SharedPreferences sharedPreferences;
  //  bool loading = false;
  // bool isLoggedIn = false;

//  final email = TextEditingController();
//  final password = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   isSignedIn();
  // }

  // // void signOutGoogle() async{
  // //   await googleSignIn.signOut();
  // //   print('User Signed Out');
  // // }

  // void isSignedIn() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   isLoggedIn = await googleSignIn.isSignedIn();
  //   if (isLoggedIn) {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }

  // Future handleSignIn() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     loading = true;
  //   });
  //   GoogleSignInAccount googleUser = await googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
    
  //   AuthCredential credential = GoogleAuthProvider.credential(
  //     idToken: googleSignInAuthentication.idToken,
  //     accessToken: googleSignInAuthentication.accessToken,
  //   );

  //  User firebaseUser =  FirebaseAuth.instance.currentUser;
  //   //  credential;
     
  //   if (firebaseUser != null) {
  //     final QuerySnapshot result = await FirebaseFirestore.instance.collection("users")
  //     .where("id", isEqualTo: firebaseUser.uid).get();

  //     final List<DocumentSnapshot> documents = result.docs;
      
  //     if(documents.length == 0){
  //       // insert the user to our collection

  //       FirebaseFirestore.instance.collection("users").doc(firebaseUser.uid).set({
  //         "id": firebaseUser.uid,
  //         "username": firebaseUser.displayName,
  //         "profilePicture":firebaseUser.photoURL
  //       });
  //       await sharedPreferences.setString("id", firebaseUser.uid);
  //       await sharedPreferences.setString("username", firebaseUser.displayName);
  //       await sharedPreferences.setString("profilePicture", firebaseUser.photoURL);
  //     } else{
  //       await sharedPreferences.setString("id", documents[0]['id']);
  //       await sharedPreferences.setString("username", documents[0]['username']);
  //       await sharedPreferences.setString("profilePicture", documents[0]['photoURl']);
  //     }

  //     Fluttertoast.showToast(msg: "Login was successful");
  //     setState((){
  //       loading = false;
  //     });
  //   }else {}

  //  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Stack(
        children:<Widget>[
          Center(
            child: FlatButton(
              onPressed:(){
                authBloc.loginGoogle();
              },
              child:Text("Sign in / Sign up with google"),
            ),
          ),

          // TextFormField(
          //   controller: email,
          //   decoration: InputDecoration(
          //     hintText: 'Enter Your Email',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          //   ),
          // ),
          // TextFormField(
          //   controller: password,
          //   decoration: InputDecoration(
          //     hintText: 'Enter Your Password',border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          //   ),
          // ),

          // Visibility(
          //   visible: loading ?? true,
          //   child: Center(
          //     child: Container(
          //       color:Colors.white.withOpacity(0.7),
          //       child:CircularProgressIndicator(
          //         valueColor:AlwaysStoppedAnimation<Color>(Colors.red),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}