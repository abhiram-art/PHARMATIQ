import 'package:flutter/material.dart';
import 'package:pharmatiq/widgets/home_body.dart';
import '../screens/cart_screen.dart';

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 170, 140, 6),
          title: Text(''),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.shopping_cart, size: 30,color: Colors.white,),
                onPressed: ()=>Navigator.of(context).pushNamed(CartScreen.routeName))
          ],
        ),
        body: HomeBody()
    );
  }
}