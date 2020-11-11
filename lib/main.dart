import 'package:flutter/material.dart';
import 'package:pharmatiq/models/orders.dart';
import 'package:pharmatiq/models/products.dart';
import 'package:pharmatiq/screens/pdt_detail_screen.dart';
import 'package:pharmatiq/screens/splashscreen.dart';
import 'package:pharmatiq/widgets/NavDrawer.dart';
import 'package:pharmatiq/widgets/cartitemcounter.dart';
import 'package:pharmatiq/widgets/changeAddress.dart';
import 'package:pharmatiq/widgets/totalMoney.dart';
import './screens/login.dart';
import 'package:provider/provider.dart';
import './models/cart.dart';
import './screens/cart_screen.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (c)=>CartItemCounter()),
        ChangeNotifierProvider( create: (c)=>CartItemCounter()),
        ChangeNotifierProvider( create: (c)=>AddressChanger()),
        ChangeNotifierProvider( create: (c)=>TotalAmount()),
          //value: Products(),
        //),
       // ChangeNotifierProvider.value(
         // value: Product(),
       // ),
        //ChangeNotifierProvider.value(
          //value: Cart(),
       // ),
        //ChangeNotifierProvider.value(
          //value: Orders(),
        //)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          HomePage2.routeName: (ctx) => HomePage2(),
          DetailPage.routeName: (ctx) => DetailPage(),
          CartScreen.routeName: (ctx) => CartScreen(),
          //NavDrawer.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
