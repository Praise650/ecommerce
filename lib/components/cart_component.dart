
import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {

  var Products_on_the_cart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": 85,
      "size": "M",
      "color": "Black",
      "quantity": 1,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "price": 50,
      "size": "7",
      "color": "Red",
      "quantity": 1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index){
          return Single_Cart_Product(
              cart_prod_name:Products_on_the_cart[index]["name"],
              cart_prod_picture:Products_on_the_cart[index]["picture"],
              cart_prod_price:Products_on_the_cart[index]["price"],
              cart_prod_size:Products_on_the_cart[index]["size"],
              cart_prod_color:Products_on_the_cart[index]["color"],
              cart_prod_qty:Products_on_the_cart[index]["quantity"],

          );
        });
  }
}

class Single_Cart_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_Cart_Product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child:ListTile(
          // =========Leading Section===========
        leading: Image.asset(cart_prod_picture,
          width: 100.0,
          height: 100.0,),

        // =========Title Section===========
        title: Text(cart_prod_name),
        subtitle: Column(
          children: [
          Row(
              children: <Widget>[
                Padding(
                  padding:  EdgeInsets.all(0.0),
                  child: Text("Size:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,),),
                ),
                Padding(
                  padding:  EdgeInsets.all(4.0),
                  child: Text(cart_prod_size),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text('Color:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,),),
                ),
                Padding(
                  padding:  EdgeInsets.all(4.0),
                  child: Text(cart_prod_color),
                ),
              ],
          ),

            // =========Product Price Section===========
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$${cart_prod_price}",
                style: TextStyle(
                  fontSize: 16.0,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
