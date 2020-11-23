import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmatiq/screens/uploaditems.dart';
import 'package:pharmatiq/screens/uploaditems1.dart';
import 'package:pharmatiq/screens/uploaditems2.dart';

import 'adminLogin.dart';

class option extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          centerTitle: true,
        backgroundColor:Color.fromRGBO(0, 170, 140, 1),
        actions: [
      FlatButton(
      child: Text("Logout",style: TextStyle(
        color: Colors.white,
        fontSize: 15.0,
      ),),
      onPressed: ()
      {
        Route route = MaterialPageRoute(builder: (c) => AdminPage());
        Navigator.pushReplacement(context, route);
      },
    ),
    ],),
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Container(
            child: Column(
              children: <Widget>[
                Container(),
                Padding(
                    padding: EdgeInsets.only(left: 30, top: 5, right: 30, bottom: 80),
                    //child: Column(
                        //children: <Widget>[
                         // Container(),
                        //]
                    //)
                  //Text('WELCOME',

                  //style: TextStyle(fontSize: 30),
                  //),
                  // ],
                ),
                Image(image: AssetImage("images/tab.png"),height:100),
                SizedBox(height: 15,),
                Container(
                    height: 40,
                    width: 200,

                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(0, 170, 140, 2),
                              Color.fromRGBO(0, 170, 140, 2)
                            ]
                        )
                    ),
                    //child: Image(image: AssetImage("images/tab.png"),height:250),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => UploadPage()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text('Tablets',
                          style: TextStyle(
                              color: Colors.white,fontSize: 20
                          ),
                        ),
                        color: Color.fromRGBO(0, 170, 140, 2)
                    ),),
                     SizedBox(height: 15,),
                Image(image: AssetImage("images/syr1.png"),height:100),
                     FlatButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => UploadPage1()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text('Syrups',
                          style: TextStyle(
                              color: Colors.white,fontSize: 20
                          ),
                        ),
                        color: Color.fromRGBO(0, 170, 140, 2)
                    ),
                SizedBox(height: 15,),
                Image(image: AssetImage("images/mask (1).png"),height:100),
                     FlatButton(
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => UploadPage2()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text('Covid Essentials',
                          style: TextStyle(
                              color: Colors.white,fontSize: 20
                          ),
                        ),
                        color: Color.fromRGBO(0, 170, 140, 2)
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  ],
                )
              ],
            )

        )
      //   ]
    );
    //)
    //);
  }
}
