import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/pages/cart.dart';
import 'package:carousel_pro/carousel_pro.dart';
//my imports
import 'package:ecommerce/components/horizontal_listview.dart';
import 'package:ecommerce/components/products.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:provider/provider.dart';
import '../auth_bloc.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription<User> loginStateSubSubscription;
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen:false);
    authBloc.currentUser.listen((fbUser) {
      if(fbUser == null){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
      }
     });
    super.initState();
  }
  @override
  void dispose() {
    loginStateSubSubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images:[
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/IMG_1266.JPG'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds:1000,),
        dotSize: 3.5,
        indicatorBgPadding: 6.0,
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text('Fashion App'),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
          })
        ],
      ),
      drawer: new Drawer(
        child: StreamBuilder<User>(
          stream: authBloc.currentUser,
          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasData)
            return  ListView(
              children: <Widget>[
                new UserAccountsDrawerHeader(accountName: Text(snapshot.data.displayName,),
                  accountEmail: Text(snapshot.data.email,),
                  currentAccountPicture: GestureDetector(child:
                  new CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data.photoURL,),
                    radius: 60.0,
                    backgroundColor:Colors.grey,
                  ),
                  ),
                ),

                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
                  } ,
                  child: ListTile(
                    title: Text('Home Page'),
                    leading: Icon(Icons.home, color: Colors.red,),
                  ),
                ),
                InkWell(
                  onTap:(){} ,
                  child: ListTile(
                    title: Text('My Account'),
                    leading: Icon(Icons.person, color: Colors.red,),
                  ),
                ),
                InkWell(
                  onTap:(){} ,
                  child: ListTile(
                    title: Text('My Orders'),
                    leading: Icon(Icons.shopping_basket, color: Colors.red,),
                  ),
                ),
                InkWell(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Cart()));
                  } ,
                  child: ListTile(
                    title: Text('Shopping Cart'),
                    leading: Icon(Icons.shopping_cart, color: Colors.red,),
                  ),
                ),
                InkWell(
                  onTap:(){} ,
                  child: ListTile(
                    title: Text('Favourites'),
                    leading: Icon(Icons.favorite, color: Colors.red,),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap:(){} ,
                  child: ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings, color: Colors.red,),
                  ),
                ),
                InkWell(
                  onTap:(){} ,
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.help, color: Colors.red,),
                  ),
                ),
                InkWell(
                  onTap:(){
                    authBloc.logOut();
                  } ,
                  child: ListTile(
                    title: Text('Log Out'),
                    leading: Icon(Icons.login_outlined, color: Colors.red,),
                  ),
                ),
              ],
            );
          }
        ),
      ),
      body: new ListView(
        children: <Widget>[
          imageCarousel,
          new Padding(padding: const EdgeInsets.all(8.0),
            child: new Text('Categories'),),

          HorizontalList(),

          new Padding(padding: const EdgeInsets.only(top:8.0, left:8.0, right:0.0, bottom:0.0,),
            child: new Text('Recent Products'),),

          //grid view
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}