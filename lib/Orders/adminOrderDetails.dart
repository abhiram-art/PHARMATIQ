import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmatiq/screens/uploadItems.dart';
import 'package:pharmatiq/config.dart';
import 'package:pharmatiq/widgets//loadingWidget.dart';
import 'package:pharmatiq/widgets/orderCard.dart';
import 'package:pharmatiq/screens/address.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AdminOrderDetails extends StatelessWidget {
  final String orderId;
  final String orderBy;
  final String addressId;

  AdminOrderDetails({Key key,this.orderId,this.orderBy,this.addressId,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
    );
  }
}

class StatusBanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

class PaymentDetailsCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}

class ShippingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
    );
  }

}


class KeyText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}