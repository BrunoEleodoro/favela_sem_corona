import 'dart:collection';
import 'package:favelasemcorona/components/questions/form_bottom_buttons.dart';
import 'package:flutter/material.dart';

class MultipleScreen extends StatefulWidget {
  var nextPage;
  var previousPage;
  var body;
  var id;
  var label;
  var items;
  MultipleScreen(
      {this.nextPage,
      this.previousPage,
      this.body,
      this.id,
      this.label,
      this.items});

  @override
  _MultipleScreenState createState() => _MultipleScreenState();
}

class _MultipleScreenState extends State<MultipleScreen> {
  var selectedItem = "select";
  List<String> sintomas = List();
  HashMap<String, bool> selectedItems = HashMap();
  bool nextButtonVisible = false;

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   selectedItem = widget.body[widget.id] ?? "select";
    // });
    var i = 0;
    while (i < widget.items.length) {
      sintomas.add(widget.items[i]['value']);
      selectedItems[widget.items[i]['value']] = false;
      i++;
    }
  }

  void setValues() {
    widget.body[widget.id] = '';
    var i = 0;
    nextButtonVisible = false;
    while (i < sintomas.length) {
      if (selectedItems[sintomas[i]]) {
        widget.body[widget.id] += sintomas[i] + ",";
        nextButtonVisible = true;
      }
      i++;
    }
    widget.body[widget.id] = widget.body[widget.id]
        .toString()
        .substring(0, widget.body[widget.id].length - 1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.label,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.start),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: List.generate(widget.items.length, (index) {
                        return CheckboxListTile(
                          title: Text(widget.items[index]['title']),
                          value: selectedItems[widget.items[index]['value']],
                          onChanged: (value) {
                            setState(() {
                              selectedItems[widget.items[index]['value']] =
                                  value;
                            });
                            setValues();
                          },
                          // selected: ,
                        );
                      }),
                    ),
                  ],
                ),
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
              nextButtonVisible: nextButtonVisible,
            ),
          )
        ],
      ),
    );
  }
}
