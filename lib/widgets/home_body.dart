import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/all_pdts.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Center(
            child: Text(
          'Tablets',
          style: TextStyle(fontSize: 40, fontFamily:'Varela'),
        )),
        SizedBox(
          height: 40,
        ),
         Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
    child: Container(
    padding: EdgeInsets.only(left: 3.0),
    decoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.1),
    borderRadius: BorderRadius.circular(40.0)),
    child: TextField(
    decoration: InputDecoration(
    hintText: 'Search',
    hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
    border: InputBorder.none,
    fillColor: Colors.grey.withOpacity(0.5),
    prefixIcon: Icon(Icons.search, color: Colors.grey)),
    ))),
        SizedBox(
          height: 50,
        ),

        AllProducts()
      ],
    );
  }
}
