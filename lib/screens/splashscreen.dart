import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SplashScreenState();

}

FirebaseAuth auth = FirebaseAuth.instance;

class _SplashScreenState extends State<SplashScreen>
{
  @override
  void initState(){
    super.initState();

    displaySplash();
  }

  displaySplash()
  {
    Timer(Duration(seconds: 2), () async{
        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => HomePage2()));
    });
  }
  Widget build(BuildContext context) {
    return Material(
        //child: Container(
            //decoration: new BoxDecoration(
                //gradient: new LinearGradient(
                  //colors: [Colors.white, Colors.greenAccent.],
                  //begin: const FractionalOffset(0.0, 0.0),
                  //end: const FractionalOffset(1.0, 0.0),
                  //stops: [0.0,1.0],
                  //tileMode: TileMode.clamp,
                //)
            //),
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/logo1.jpeg'),
                    SizedBox(height: 10.0,),
                    Text(
                      "PHARMATIq",
                      style: TextStyle(color: Colors.black,fontSize: 24.0,fontWeight: FontWeight.w400),
                    )
                  ],
                )
            )

        );
   // );
  }

}