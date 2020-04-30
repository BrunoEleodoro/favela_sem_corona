import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class DiskDomesticViolenceScreen extends StatefulWidget {
  static const String id = "disk_denuncia_screen";

  @override
  _DiskDomesticViolenceScreenState createState() => _DiskDomesticViolenceScreenState();
}

class _DiskDomesticViolenceScreenState extends State<DiskDomesticViolenceScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text('Disque 180'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.purple,
              ],
            ),
          ),
        ),
      ),
      body: WebView(
        initialUrl: 'https://thinkolga.squarespace.com/violencia-contra-mulheres',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
