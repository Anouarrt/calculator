import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class webview extends StatelessWidget {
    final String url;
    webview(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     /* body: WebView(
        initialUrl: url,
      ),*/
    );
  }
}
