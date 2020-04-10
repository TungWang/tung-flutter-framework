import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tungflutterframework/services/launch_service.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  @override
  _WebScreenState createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  final LaunchHelper _launchHelper = LaunchHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('Web'),
        ),
        body: WebView(
          initialUrl: 'https://homego.azurewebsites.net/#/testlogin',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (webViewController) {
            _controller.complete(webViewController);
            webViewController.evaluateJavascript('alert("Hello World")');
          },
          navigationDelegate: (request) {
            if (request.url.contains('CacheableResource.aspx')) {
              _launchHelper.launchInBrowser(request.url);
              return NavigationDecision.prevent;
            }else{
              return NavigationDecision.navigate;
            }
          },
        ),
        floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (context, webViewController) {

            if (webViewController.hasData) {
              return FloatingActionButton(
                child: Icon(Icons.arrow_back),
                backgroundColor: Colors.deepPurpleAccent,
                onPressed: () {
                  webViewController.data.goBack();
                },
              );
            }else{
              return Container();
            }

          },
        ),
      ),
    );
  }
}
