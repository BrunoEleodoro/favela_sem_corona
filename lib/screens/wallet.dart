import 'dart:typed_data';

import 'package:favelasemcorona/constants.dart';
import 'package:favelasemcorona/models/payment_confirmation_model.dart';
import 'package:favelasemcorona/screens/payment_amount.dart';
import 'package:favelasemcorona/utils/ethWrapper.dart';
import 'package:favelasemcorona/utils/keyInterface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:qrscan/qrscan.dart' as scanner;
import 'package:toast/toast.dart';

import 'auth_for_wallet.dart';
class Wallet extends StatefulWidget{
  static const id ="wallet";
  @override
  WalletState createState() => WalletState();
}
class WalletState extends State<Wallet>{
  Uint8List addressBytes = Uint8List(0);
  bool walletStatus = false;
  String privateKey = "";
  String address="";
  var walletBalance = "0";
  _checkWalletStatus() async {
    print("inside check status");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString(prefEmail)==null||prefs.getString(prefEmail)==""){
      await Navigator.pushNamed(context, Auth.id);
      prefs = await SharedPreferences.getInstance();
    }
    var key = prefs.getString(prefPrivateKey);
    if(key =="" || key ==null){
      await Firestore.instance
          .collection('walletUsers')
          .document(prefs.getString(prefEmail))
          .get()
          .then((DocumentSnapshot ds)async  {
        if(!ds.exists){
          String keygen = await KeyInterface.generateKey();
          print("pvtkey:$keygen");
          var addr = prefs.getString(prefAddress);
          await Firestore.instance.collection('walletUsers').document(prefs.getString(prefEmail))
              .setData({ prefPrivateKey: keygen,prefAddress: addr});

          setState(() {
            address = addr;
            privateKey = keygen;
          });
        }else {
          await prefs.setString(prefPrivateKey, ds[prefPrivateKey]);
          await prefs.setString(prefAddress, ds[prefAddress]);

          print("fstore"+ds[prefAddress].toString());
          setState(() {

            address = ds[prefAddress];
            privateKey = ds[prefPrivateKey];
          });
        }
      });

    }
    else {
      var addr = prefs.getString(prefAddress);
      setState(() {
        address = addr;
        privateKey = key;
      });
    }
  }


  _fetchBalance()async {
    var string = await EthWrapper.checkBalanceRopsten();
   // Uint8List result = await scanner.generateBarCode(address);
    setState(() {
    //  addressBytes  = result;
      walletBalance = string;
      walletStatus = true;
    });
  }
  @override
  void initState() {
    _checkWalletStatus().then((val){
      _fetchBalance();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return walletStatus?_wallet():_cerateWallet();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,5,5,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Your balance",style: TextStyle(fontSize:25,color: grey, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: OutlineButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            color: Colors.orange,
                            child: Text("Refresh"),
                            onPressed: (){
                              setState(() {
                                walletStatus = false;
                              });
                              _fetchBalance();
                              setState(() {
                                walletStatus =true;
                              });
                            },
                          ),
                        )
                      ],
                    )
                  ),
                  Center(child: Text(walletBalance, style: TextStyle(color: secondAppTheme, fontSize: 30, fontWeight: FontWeight.bold),)),
                  Center(child: Text("USD", style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),)),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,15,5,10),
                    child: Text("Scan to get paid",style: TextStyle(fontSize:25,color: grey, fontWeight: FontWeight.bold),),
                  ),
                  Center(
                    child: SizedBox(height:MediaQuery.of(context).size.height*0.3,width: MediaQuery.of(context).size.width*0.5,child:QrImage(
                      data: address,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),) ,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,15,5,10),
                    child: Text("Scan to get paid",style: TextStyle(fontSize:25,color: grey, fontWeight: FontWeight.bold),),
                  ),
                  Center(
                    child: OutlineButton(
                      color: secondAppTheme,
                      highlightedBorderColor: secondAppTheme,
                      borderSide: BorderSide(color: secondAppTheme, style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text("Scan QR to pay Someone"),
                      onPressed: ()async{
                        String qrResult = await BarcodeScanner.scan();
                        print(qrResult);
                        RegExp reg = RegExp(r'^0x([A-Fa-f0-9]{40})$');
                        if(reg.hasMatch(qrResult)){
                          var str = await _asyncInputDialog(context);
                          if(str!="cancel"){
                            setState(() {
                              walletStatus =true;
                            });
                            var tx =await EthWrapper.transferToken(qrResult, double.parse(str));
                             await Navigator.pushNamed(
                              context,
                              PaymentTx.id,
                              arguments: PaymentModel(
                                  recpAddress: qrResult,
                                  senderAddress: address,
                                  amount: str,
                                  tx: tx,
                              ),
                            ).then((val){
                              _fetchBalance();
                             });
                          }
                        }
                        else{
                          Toast.show("Invalid QR", context, duration: Toast.LENGTH_LONG);
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
        ),
      )
    );
  }
  _cerateWallet(){
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitCubeGrid(
              size: 50,
              color: appTheme,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.05,
            ),
            Text("Please Wait", style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
    );
  }
  Future<String> _asyncInputDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        TextEditingController _amount = TextEditingController();
        return AlertDialog(
          title: Text('Enter amount'),
          content:  TextFormField(
          keyboardType: TextInputType.number,
            autovalidate: true,
            validator: (val) =>(val==""?true: double.parse(val)<=double.parse(walletBalance))
                ? null
                : 'Invalid Amount.',
            decoration: InputDecoration(
              hintText: 'Enter Amount',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),
            ),
            controller: _amount,
          ),
          actions: <Widget>[
            FlatButton(
                child: Text("Cancel"),
                onPressed: () async {
                  Navigator.of(context).pop("cancel");
                }
            ),
            FlatButton(
                child: Text("Confirm"),
                onPressed: () async {
                  if(double.parse(_amount.text)<=double.parse(walletBalance))
                   {
                     Navigator.of(context).pop(_amount.text);
                   }
                  else{
                    Toast.show("Invalid Amount", context, duration: Toast.LENGTH_LONG);
                  }
                }),

          ],
        );
      },
    );
  }

}