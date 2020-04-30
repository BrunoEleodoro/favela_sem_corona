import 'package:favelasemcorona/components/questions/form_bottom_buttons.dart';
import 'package:flutter/material.dart';

class DropdownScreen extends StatefulWidget {
  var nextPage;
  var previousPage;
  var body;
  var id;
  var label;
  var items;
  DropdownScreen(
      {this.nextPage,
      this.previousPage,
      this.body,
      this.id,
      this.label,
      this.items});

  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  var selectedItem = "select";
  List<DropdownMenuItem> dropdownItems = List();
  bool nextButtonVisible = false;
  @override
  void initState() {
    super.initState();
    dropdownItems.clear();

    var i = 0;
    while (i < widget.items.length) {
      dropdownItems.add(DropdownMenuItem(
        child: Text(widget.items[i]),
        value: widget.items[i],
      ));
      i++;
    }

    dropdownItems.add(DropdownMenuItem(
      child: Text('Selecione...'),
      value: 'select',
    ));

    setState(() {
      selectedItem = widget.body[widget.id] ?? "select";
    });
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
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.label,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.maxFinite,
                  child: DropdownButton(
                    isExpanded: true,
                    onChanged: (item) {
                      setState(() {
                        selectedItem = item;
                      });
                      widget.body[widget.id] = item;
                      print(widget.body);
                    },
                    value: selectedItem,
                    items: dropdownItems,
                  ),
                )
                // TextFormField(
                //   onChanged: (value) {
                //     widget.body[widget.id] = value;
                //   },
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(), labelText: widget.label)
                // ),
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
              nextButtonVisible: selectedItem != "select"),
        )
      ],
    );
  }
}
