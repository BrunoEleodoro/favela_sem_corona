import 'package:favelasemcorona/components/card_widget.dart';
import 'package:favelasemcorona/utils/moonpay_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../constants.dart';
import 'kyc_screen.dart';

class DonationKyc extends StatefulWidget{
  static const id ="/donation";
  @override
  DonationKycState createState() => DonationKycState();
}
class DonationKycState extends State<DonationKyc>{
  Animation<double> topBarAnimation;
  bool loading=true;
  bool fetching =true;
  List ls;
  bool kyc = false;
  bool cards= false;
  var _cardNo = new TextEditingController();
  var _cvv = new TextEditingController();
  var _expiry = new TextEditingController();
  List<Widget> listViews = List<Widget>();
  _getCard() async  {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String jwt = prefs.getString("jwt");
    MoonPayWrapper wrapper =  MoonPayWrapper();
    List js =  await wrapper.getCardList(jwt);
    return js;
  }
  _fetchjwt()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwt =prefs.getString("jwt");
    if(jwt==null){
      return false;
    }
    else return true;
  }
  _initState()async {
    bool state = await _fetchjwt();
    if(state){
      setState(() {
        cards=true;
        loading = false;
      });
    }
    else{
      setState(() {
        loading =false;
        kyc =true;
      });

    }
  }


  _kycButton(){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("To Donate you will have to do a samll KYC"),
          SizedBox(height: 25,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              onPressed: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login_email()),
                );
                setState(() {
                  loading=true;
                  fetching =true;

                });
                _initState();
              },
              padding: EdgeInsets.all(12),
              color: Colors.blueAccent,
              child: Text('Start KYC', style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
  void addAllListData() {
    var count = 9;

    if(ls.length==1){
      listViews.add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Column(
                children: <Widget>[
                  Icon(Icons.add),
                  Text("Add Card")
                ],
              ),
              onPressed: (){
                _asyncInputDialog(context).then((str){
                  if(str =="Done!")
                    _getCard();
                });
              },
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
          )
        ],
      ));
    }
    listViews.add(
      CardWidget(ls[0]["lastDigits"].toString(), ls[0]["id"].toString(), ls[0]["expiryYear"].toString()),
    );
    if (ls.length>1){
      listViews.add(
        CardWidget(ls[1]["lastDigits"].toString(), ls[1]["id"].toString(), ls[1]["expiryYear"].toString()),
      );
    }
  }

  Future<bool> getData() async {
    return true;
  }

  Widget getMainListViewUI() {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox();
        } else {
          return ListView.builder(
            cacheExtent:100,

            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return listViews[index];
            },
          );
        }
      },
    );
  }

  @override
  void initState() {
    _initState().then((val){
      _getCard().then((val){

        setState(() {
          ls =val;
          for(int i = ls.length;i>2;i--){
            ls.removeLast();
          }
          fetching =false;
        });
        addAllListData();
      });

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: nearlyWhite,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: nearlyWhite,
          brightness: Brightness.light,
          title: Text("Donate", style: TextStyle(color: Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: loading?_loader():kyc?_kycButton():fetching?_loader():getMainListViewUI(),
          )
        )
    );
  }
  _loader(){
    return Center(
      child: SpinKitCubeGrid(
        size: 50,
        color: appTheme,
      ),
    );
  }
  Future<String> _asyncInputDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Card details'),
          content: Row(
            children: <Widget>[
              Expanded(
                child: _cards(),
              )
            ],
          ),
          actions: <Widget>[
            FlatButton(
                child: Text("Add Card"),
                onPressed: () async {
                  setState(() {
                    loading=true;
                  });
                  MoonPayWrapper wrapper = MoonPayWrapper();
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String jwt = prefs.getString("jwt");
                  Toast.show("Adding", context);
                  await wrapper.addCard2(jwt).then((boolean){
                    print("login valeue:"+boolean.toString());

                    Navigator.of(context).pop("Done!");

                  });
                })
          ],
        );
      },
    );
  }
  _cards(){

    final cardNo = TextFormField(
      keyboardType: TextInputType.text,
      autovalidate: true,
      validator: (val) => val.length!=19
          ? 'Not a valid email.'
          : null,
      decoration: InputDecoration(
        hintText: 'Card Number (XXXX XXXX XXXX XXXX)',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),
      ),
      controller: _cardNo,
    );
    final cvv = TextFormField(
      keyboardType: TextInputType.number,
      autovalidate: true,
      validator: (val) => val.length!=3
          ? 'Invalid CVV.'
          : null,
      decoration: InputDecoration(
        hintText: 'CVV',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),
      ),
      controller: _cvv,
    );
    final expiry = TextFormField(
      keyboardType: TextInputType.text,
      autovalidate: true,
      validator: (val) => val.length!=7
          ? 'Invalid Date'
          : null,
      decoration: InputDecoration(
        hintText: 'Expiry Date MM/YYYY',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(3.0)),
      ),
      controller: _expiry,
    );
    return Column(
      children: <Widget>[

        cardNo,
        SizedBox(height: 8.0),
        cvv,
        SizedBox(height: 8.0),
        expiry,
        SizedBox(height: 8.0),
        loading?_loader():SizedBox(height: 1,)



      ],
    );
  }

}