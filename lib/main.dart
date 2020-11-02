import 'splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'homedesign.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pharmatiq/authentication.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
  )
  );
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email;
  String password;
  GlobalKey<FormState> formkey = GlobalKey <FormState>();

  void login() {
    signin(email, password, context).then((value) {
      if (value != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardPage(uid: value.uid),
            ));
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
              children: <Widget>[
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/white1.jpg'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Container(
                          margin: EdgeInsets.only(top: 82),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 59),
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 170, 140, 1),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10)
                                  )
                                ]
                            ),

                            child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(bottom: BorderSide(
                                            color: Colors.grey[400]))

                                    ),
                                    child: TextFormField(
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            icon: Icon(Icons.account_circle_rounded),
                                            hintText: "Username",
                                            hintStyle: TextStyle(
                                                color: Colors.black)
                                        ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "This Field Is Required"),
                                          EmailValidator(errorText: "Invalid Email Address"),
                                        ]),
                                        onChanged: (value) {
                                          setState(() {
                                            email = value;
                                          });
                                        }
                                    ),
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    child: TextFormField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            icon: Icon(Icons.lock),
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.black)
                                        ),
                                        validator: MultiValidator([
                                          RequiredValidator(
                                              errorText: "Password Is Required"),
                                          MinLengthValidator(6,
                                              errorText: "Minimum 6 Characters Required"),
                                        ]),
                                        onChanged: (value) {
                                          setState(() {
                                            password = value;
                                          });
                                        }
                                    ),
                                  )
                                ]
                            )
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => SignHome()));
                          },
                          child: Text('Dont have an account? Signup',
                            style: TextStyle(
                                color: Colors.black

                            ),
                          ),

                        ),
                        SizedBox(height: 40,),
                        Container(
                            height: 50,
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
                                  login();
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Text('Login',
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                color: Color.fromRGBO(0, 170, 140, 2)
                            )
                        ),
                        SizedBox(height: 45,),
                        Container(
                            child: Center(
                              child: Text('or login with'),
                            )
                        ),
                        SizedBox(height: 35,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                googleSignIn().whenComplete(() async {
                                  FirebaseUser user = await FirebaseAuth.instance.currentUser();

                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (context) => DashboardPage(uid: user.uid)));
                                });
                              },
                              child:
                              Container(
                                width: 50,
                                height: 50,
                                child: Image.asset('images/gicon.png'),
                              ),

                            ),
                          ],
                        )
                      ],
                    )

                )
              ]
          ),
        )
    );
  }
}
