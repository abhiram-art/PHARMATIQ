import 'package:flutter/material.dart';
import 'package:pharmatiq/screens/splashscreen.dart';
import 'package:pharmatiq/widgets/cartitemcounter.dart';
import 'package:pharmatiq/widgets/changeAddress.dart';
import 'package:pharmatiq/widgets/totalMoney.dart';
import './screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context)=>CartItemCounter()
        ),
        ChangeNotifierProvider(
            create: (context)=>CartItemCounter()
        ),
        ChangeNotifierProvider(
            create: (context)=>AddressChanger()
        ),
        ChangeNotifierProvider(
            create: (context)=>TotalAmount()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          HomePage2.routeName: (ctx) => HomePage2(),
        },
      ),
    );
  }
}
