import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmatiq/screens/homedesign.dart';
class Intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 124,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/green3.png'),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 30, top: 70, right: 30, bottom: 80),
                    child: Column(
                        children: <Widget>[
                          Container(
                              width: 300,
                              height: 250,
                              decoration:
                              BoxDecoration(image:DecorationImage(image:AssetImage('images/7.jpg'),fit: BoxFit.fitWidth), )
                          ),
                        ]
                    )
                  //Text('WELCOME',

                  //style: TextStyle(fontSize: 30),
                  //),
                  // ],
                ),
                Container(
                    width: 300,
                    height: 140,
                    child:Text('Know your Medicine',
                      style:GoogleFonts.ptSansCaption(textStyle: TextStyle(fontSize: 28)),
                    )
                ),
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
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => DashboardPage()));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text('Next',
                          style: TextStyle(
                              color: Colors.white,fontSize: 20
                          ),
                        ),
                        color: Color.fromRGBO(0, 170, 140, 2)
                    )

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