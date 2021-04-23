import 'package:flutter/material.dart';

import 'package:ecommerce/components/cart_component.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.red,
        title: Text('Cart'),
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.search, color: Colors.white,), 
              onPressed: (){}),
        ],
      ),

      body: Cart_Products(),

      bottomNavigationBar: Container(
        color:Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text('Total:'),
              subtitle: Text('\$230'),
            ),),
            Expanded(child: MaterialButton(
              onPressed: (){},
              color: Colors.red,
              child:Text('Check Out', style: TextStyle(color:Colors.white),),
            )),
          ],
        ),
      ),
    );
  }
}
