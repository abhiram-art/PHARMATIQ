import 'package:flutter/material.dart';
import 'package:pharmatiq/home_body.dart';
import 'cart_screen.dart';

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: Drawer(),
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Text('Flutter E-com'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart, size: 30,color: Colors.black,),
              onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName))
        ],
      ),
      body: HomeBody()
    );
  }
}