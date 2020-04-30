import 'package:favelasemcorona/components/questions/form_bottom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class ObjectiveScreen extends StatefulWidget {
  var nextPage;
  var previousPage;
  var body;
  var id;
  var label;
  var keyboard;
  var formatter;
  var length;
  ObjectiveScreen(
      {this.nextPage,
      this.previousPage,
      this.body,
      this.id,
      this.label,
      this.keyboard,
      this.formatter,
      this.length});

  @override
  _ObjectiveScreenState createState() => _ObjectiveScreenState();
}

class _ObjectiveScreenState extends State<ObjectiveScreen> {
  TextEditingController controller = TextEditingController();
  TextInputType textInputType = TextInputType.text;
  String customErrorMessage;
  bool nextButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    if (widget.body[widget.id] != null) {
      controller.text = widget.body[widget.id];
      validate(widget.body[widget.id]);
    }

    // controller.mask = widget.formatter ?? "  ";
    if (widget.formatter != "") {
      controller = MaskedTextController(mask: widget.formatter);
    }
    if (widget.keyboard != null && widget.keyboard == "number") {
      textInputType = TextInputType.number;
    }
  }

  void validate(value) {
    if (value.length >= widget.length) {
      setState(() {
        nextButtonEnabled = true;
        customErrorMessage = null;
      });
    } else {
      setState(() {
        nextButtonEnabled = false;
        customErrorMessage = "Erro, verifique novamente";
      });
    }
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
                TextFormField(
                    controller: controller,
                    onChanged: (value) {
                      widget.body[widget.id] = value;
                      validate(value);
                    },
                    keyboardType: textInputType,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: widget.label,
                        errorText: customErrorMessage)),
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
            nextButtonVisible: nextButtonEnabled,
          ),
        )
      ],
    );
  }
}
