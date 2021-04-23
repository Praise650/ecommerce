import 'package:flutter/material.dart';


import 'homepage.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails({
    this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture,
  });
}


class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.red,
          title: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
            },
              child: Text('Fashion App')),
          actions: <Widget>[
            new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          ],
        ),
        body: new ListView(
          children:<Widget>[
            new Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_picture),
                ),
                footer:Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading:new Text(widget.product_detail_name,
                      style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, ),),

                    title: new Row(
                      children: [
                        Expanded(
                          child: new Text("\$${widget.product_detail_old_price}",
                              style:TextStyle( decoration:TextDecoration.lineThrough,color: Colors.grey,)),
                        ),
                        Expanded(
                          child: new Text("\$${widget.product_detail_new_price}",
                            style:TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Colors.red, ),),
                        ),
                      ],
                    ),
                  ),
                )
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context, 
                      builder: (context){
                        return AlertDialog(
                          title: Text('Size'),
                          content: Text('Choose the Size'),
                          actions:[
                            new MaterialButton(onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text('close'),),
                          ],
                        );
                      });
                    },
                    color: Colors.white,
                    textColor:Colors.grey,
                    child:Row(
                    children:[
                      Expanded(
                        child: new Text('Size'),),
                      Expanded(
                        child: new Icon(Icons.arrow_drop_down,)),
                    ],
                  ),
                )
                ),
                Expanded(
                    child: MaterialButton(
                      onPressed: (){
                        showDialog(context: context, 
                        builder: (context){
                          return AlertDialog(
                            title: Text('Colors'),
                            content: Text('Choose the color'),
                            actions:[
                              new MaterialButton(onPressed: (){
                                Navigator.pop(context);
                              },
                              child: Text('close'),
                              ),
                            ]
                          );
                        });
                      },
                      color: Colors.white,
                      textColor:Colors.grey,
                      child:Row(
                        children:[
                          Expanded(
                            child: new Text('Color'),),
                          Expanded(
                              child: new Icon(Icons.arrow_drop_down,)),
                        ],
                      ),
                    )
                ),
                Expanded(
                    child: MaterialButton(
                      onPressed: (){
                        showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text('Quantity'),
                            content: Text('Choose the quantity'),
                            actions: [
                              new MaterialButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: Text('close'),
                              ),
                            ],
                          );
                        });
                      },
                      color: Colors.white,
                      textColor:Colors.grey,
                      child:Row(
                        children:[
                          Expanded(
                            child: new Text('Qty'),),
                          Expanded(
                              child: new Icon(Icons.arrow_drop_down,)),
                        ],
                      ),
                    )
                )
              ],
            ),


            // Buy now button

        Row (
          children: [
            Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.red,
                  textColor:Colors.white,
                  child: Text('Buy Now'),
                )
            ),
            IconButton(icon: Icon(Icons.add_shopping_cart),color:Colors.red, onPressed: (){}),
            IconButton(icon: Icon(Icons.favorite_border),color:Colors.red, onPressed: (){}),
          ]
        ),
        Divider(),

        new ListTile(
          title: Text('Products details'),
          subtitle: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap intoelectronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
        ),
        Divider(),
        new Row(
          children:[
            Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0,),
            child: Text('Product Name',style: TextStyle(color:Colors.grey),),),
            Padding(padding: EdgeInsets.all(5.0),
            child:new Text(widget.product_detail_name),)
          ],
        ),

        new Row(
          children:[
            Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0,),
            child: Text('Product Brand',style: TextStyle(color:Colors.grey),),),
            Padding(padding: EdgeInsets.all(5.0),
            child:new Text('Brand X'),)
          ],
        ),

          new Row(
            children:[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0,),
                child: Text('Product Condition',style: TextStyle(color:Colors.grey),),),
            Padding(padding: EdgeInsets.all(5.0),
              child:new Text('New'),)
            ],
          ),

            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Similar Products'),
            ),

            Container(
              height: 340.0,
              child: SimilarProducts(),
            ),
          ],
        ),
    );
  }
}


class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

  var product_list = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 70,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "old_price": 145,
      "price": 872,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return similar_single_prod(
            prod_name: product_list[index]['name'],
            prod_picture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  similar_single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: Text('hero 1'),
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProductDetails(
                    product_detail_name: prod_name,
                    product_detail_new_price: prod_price,
                    product_detail_old_price: prod_old_price,
                    product_detail_picture: prod_picture,
                  ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: Row(
                      children: [
                        Expanded(child: Text(prod_name, style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),),
                        Text("\$$prod_price", style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ],
                    ),
                  ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
