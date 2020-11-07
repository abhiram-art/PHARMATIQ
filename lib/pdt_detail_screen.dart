import 'package:flutter/material.dart';
import 'products.dart';
import'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPdt.name),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Image.network(loadedPdt.imgUrl),
            ),
          ),
          SizedBox(height: 20),
          Text(

            'Price: \$${loadedPdt.price}',
            style: TextStyle(

              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              '${loadedPdt.description}',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        
        onPressed: () {
          cart.addItem(productId, loadedPdt.name, loadedPdt.price);
        },
        child: Icon(
          Icons.shopping_cart,
          size: 30,
        ),
      ),
    );
  }
}

