import 'dart:collection';
import 'package:favelasemcorona/components/questions/form_bottom_buttons.dart';
import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  var nextPage;
  var previousPage;
  var body;
  var id;
  var label;
  var items;
  RadioScreen(
      {this.nextPage,
      this.previousPage,
      this.body,
      this.id,
      this.label,
      this.items});

  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  var selectedItem = "select";
  List<Widget> options = List();
  HashMap<String, bool> optionsSelected = HashMap();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = widget.body[widget.id] ?? "select";
    });
  }

  void onChange(value) {
    setState(() {
      selectedItem = value;
      optionsSelected[value] = true;
    });
    print(selectedItem);
    widget.body[widget.id] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                      SizedBox(height: 40,),
                      Column(
                        children: List.generate(widget.items.length, (index) {
                          return RadioListTile(
                            title: Text(widget.items[index]['title']),
                            value: widget.items[index]['value'],
                            onChanged: onChange,
                            groupValue: selectedItem,
                          );
                        }),
                      ),
                    ],
                  ),
                )
                
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomButtons(
            backClicked: () {
              widget.previousPage();
            },
            nextClicked: () {
              widget.nextPage();
            },
            nextButtonVisible: selectedItem != "select" ? true:false,
          ),
        )
      ],
    );
  }
}
