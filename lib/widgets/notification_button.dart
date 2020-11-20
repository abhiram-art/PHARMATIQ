import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class NotificationButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Badge(
        position: BadgePosition(
          start: 25,top: 8,
        ),
        badgeContent: Text("1",style: TextStyle(fontWeight: FontWeight.bold),),
        badgeColor: Colors.white,
        child: IconButton(icon: Icon(Icons.notifications_none,color: Colors.white,), onPressed: () {  },)
    );
  }
}
