import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:favelasemcorona/screens/main_menu_screen.dart';

import '../constants.dart';

import '../constants.dart';

//precisa da completer e do future builder

void main() => runApp(MaterialApp(home: MinSaudeScreen()));

class MinSaudeScreen extends StatefulWidget {
  static const String id = 'min_saude_screen';

  @override
  _MinSaudeScreenState createState() => _MinSaudeScreenState();
}

class _MinSaudeScreenState extends State<MinSaudeScreen> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
//  final Set<String> _favorites = Set<String>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text('Ministério da Saúde'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigoAccent,
                Colors.indigo,
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: 'https://coronavirus.saude.gov.br/sobre-a-doenca#definicaodecaso',
            //initialUrl:
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
              onPageStarted: (url) => setState(() => isLoading = true),
              onPageFinished: (url) => setState(() => isLoading = false)),
          (isLoading)? LinearProgressIndicator() :SizedBox()
        ],
      ),

    );
  }

//  _bookmarkButton() {
//    return FutureBuilder<WebViewController>(
//      future: _controller.future,
//      builder:
//          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
//        if (controller.hasData) {
//          return FloatingActionButton(
//            onPressed: () async {
//              var url = await controller.data.currentUrl();
//              _favorites.add(url);
//              Scaffold.of(context).showSnackBar(
//                SnackBar(content: Text('Saved $url for later reading.')),
//              );
//            },
//            child: Icon(Icons.favorite),
//          );
//        }
//        return Container();
//      },
//    );
//  }
}
//
//class Menu extends StatelessWidget {
//  Menu(this._webViewControllerFuture, this.favoritesAccessor);
//  final Future<WebViewController> _webViewControllerFuture;
//  final Function favoritesAccessor;
//
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder(
//      future: _webViewControllerFuture,
//      builder:
//          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
//        if (!controller.hasData) return Container();
//        return PopupMenuButton<String>(
//          onSelected: (String value) async {
//            if (value == 'Email link') {
//              var url = await controller.data.currentUrl();
//              await launch(
//                  'mailto:?subject=Check out this cool Wikipedia page&body=$url');
//            } else {
//              var newUrl = await Navigator.push(context,
//                  MaterialPageRoute(builder: (BuildContext context) {
//                    return FavoritesPage(favoritesAccessor());
//                  }));
//              Scaffold.of(context).removeCurrentSnackBar();
//              if (newUrl != null) controller.data.loadUrl(newUrl);
//            }
//          },
//          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
//            const PopupMenuItem<String>(
//              value: 'Email link',
//              child: Text('Email link'),
//            ),
//            const PopupMenuItem<String>(
//              value: 'See Favorites',
//              child: Text('See Favorites'),
//            ),
//          ],
//        );
//      },
//    );
//  }
//}

//class FavoritesPage extends StatelessWidget {
//  FavoritesPage(this.favorites);
//  final Set<String> favorites;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Favorite pages')),
//      body: ListView(
//          children: favorites
//              .map((url) => ListTile(
//              title: Text(url), onTap: () => Navigator.pop(context, url)))
//              .toList()),
//    );
//  }
//}

//class NavigationControls extends StatelessWidget {
//  const NavigationControls(this._webViewControllerFuture)
//      : assert(_webViewControllerFuture != null);
//
//  final Future<WebViewController> _webViewControllerFuture;
//
//  @override
//  Widget build(BuildContext context) {
//    return FutureBuilder<WebViewController>(
//      future: _webViewControllerFuture,
//      builder:
//          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
//        final bool webViewReady =
//            snapshot.connectionState == ConnectionState.done;
//        final WebViewController controller = snapshot.data;
//        return Row(
//          children: <Widget>[
//            IconButton(
//              icon: const Icon(Icons.arrow_back_ios),
//              onPressed: !webViewReady
//                  ? null
//                  : () => navigate(context, controller, goBack: true),
//            ),
//            IconButton(
//              icon: const Icon(Icons.arrow_forward_ios),
//              onPressed: !webViewReady
//                  ? null
//                  : () => navigate(context, controller, goBack: false),
//            ),
//          ],
//        );
//      },
//    );
//  }
//
//  navigate(BuildContext context, WebViewController controller,
//      {bool goBack: false}) async {
//    bool canNavigate =
//    goBack ? await controller.canGoBack() : await controller.canGoForward();
//    if (canNavigate) {
//      goBack ? controller.goBack() : controller.goForward();
//    } else {
//      Scaffold.of(context).showSnackBar(
//        SnackBar(
//            content: Text("No ${goBack ? 'back' : 'forward'} history item")),
//      );
//    }
//  }
//}