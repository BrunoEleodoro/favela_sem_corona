import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class PsychologicalHelpScreen extends StatefulWidget {
  static const String id = "psychological_help_screen";

  @override
  _PsychologicalHelpScreenState createState() => _PsychologicalHelpScreenState();
}

class _PsychologicalHelpScreenState extends State<PsychologicalHelpScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text('Apoio Psicológico'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.shade400,
                Colors.indigo,
              ],
            ),
          ),
        ),
      ),
      body: WebView(
        initialUrl: 'https://www.facebook.com/sevitrj/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
