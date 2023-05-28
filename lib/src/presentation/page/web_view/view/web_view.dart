import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  WebViewPage({
    Key? key,
    required this.title,
    required this.webLink,
  }) : super(key: key);

  String title;
  String webLink;
  WebViewController? _webViewController;

  @override
  Widget build(BuildContext context) {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(webLink))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: WebViewWidget(controller: _webViewController!),
    );
  }
}
