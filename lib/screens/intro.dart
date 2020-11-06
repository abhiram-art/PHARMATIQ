import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmatiq/screens/intro2.dart';
class Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
              children: <Widget>[
                Container(
                  height: 135,
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
                          height: 270,
                          decoration:
                        BoxDecoration(image:DecorationImage(image:AssetImage('images/3.jpeg'),fit: BoxFit.fitWidth), )
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
                          height: 160,
                          child:Text('Get your pharmacy at your doorstep',
                          style:GoogleFonts.ptSansCaption(textStyle: TextStyle(fontSize: 22)),
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
                                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => Intro2()));
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