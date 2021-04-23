import 'package:flutter/material.dart';
import 'package:ecommerce/auth_bloc.dart';
import 'package:provider/provider.dart';    
import 'pages/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      Provider(
        create: (context) => AuthBloc(),
              child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title:"Ecommerce",
          home: Login(),
        ),
      )
  );
}

