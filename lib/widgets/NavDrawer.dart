import 'package:pharmatiq/profile.dart';
import 'package:pharmatiq/authentication.dart';
import 'package:pharmatiq/screens/login.dart';
import '../screens/homedesign.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            //decoration: BoxDecoration(
                //color: Colors.green,
                //image: DecorationImage(
                    //fit: BoxFit.fill,
                    //image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Home',
              style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),),
            onTap: () => {  Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardPage()))},
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('Profile' ,style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),),
            onTap: () => {Navigator.push(context,MaterialPageRoute(builder: (context) => profile()))},
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Orders', style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback', style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout', style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),),
            onTap: () => {
              signOutUser().then((value) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => HomePage2()),
                        (Route<dynamic> route) => false);
              }),
            },
          ),
        ],
      ),
    );
  }
}