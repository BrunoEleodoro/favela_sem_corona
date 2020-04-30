
import 'package:favelasemcorona/constants.dart';
import 'package:favelasemcorona/models/payment_confirmation_model.dart';
import 'package:flutter/material.dart';
class PaymentTx extends StatefulWidget{
  static const id ="paymentAmount";
  @override
  PaymentTxState createState() => PaymentTxState();
}
class PaymentTxState extends State<PaymentTx>{
  bool fetching =true;
  PaymentModel args;
  @override
  void initState() {
    Future.delayed(Duration.zero,() {
      args = ModalRoute.of(context).settings.arguments;
      setState(() {
        fetching= false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _wallet();
  }
  _wallet(){
    return Scaffold(
        backgroundColor: nearlyWhite,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: nearlyWhite,
          brightness: Brightness.light,
          title: Text("Wallet", style: TextStyle(color: Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: fetching?Center(
            child: Text("loading..")
        ):Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Transaction", style: TextStyle(color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8,),
                    child: Text("Details", style: TextStyle(color: appTheme,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8,),
                    child: Icon(Icons.check_circle, color:Colors.green),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Recipient Address: ",
                        style: TextStyle(color: Colors.black,)),
                    Text(
                        args.recpAddress, style: TextStyle(color: Colors.grey,))
                  ],
                )
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Sender address: ",
                        style: TextStyle(color: Colors.black,)),
                    Text(args.senderAddress, style: TextStyle(color: Colors.grey,))
                  ],
                )
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Amount:",
                        style: TextStyle(color: Colors.black,)),
                    Text(args.amount, style: TextStyle(color: Colors.grey,))
                  ],
                )
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 8, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Transaction Hash:",
                        style: TextStyle(color: Colors.black,)),
                    Text(args.tx, style: TextStyle(color: Colors.grey,))
                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                padding: EdgeInsets.all(12),
                color: appTheme,
                child: Text('Back', style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        )
    );
  }}