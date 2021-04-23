import 'package:firebase_auth/firebase_auth.dart';

class  AuthService{
 final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
 Future<UserCredential> handleSignIn( AuthCredential credential) async {
   firebaseAuth.signInWithCredential(credential);
 }
 Future<void> logOut() async {
   firebaseAuth.signOut();
 }
 Stream<User> get currentUser => firebaseAuth.authStateChanges();
}