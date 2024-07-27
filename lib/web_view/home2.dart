import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:web_app/network/network_error.dart';
import 'package:webview_flutter/webview_flutter.dart';

class home2 extends StatefulWidget {
  const home2({super.key});

  @override
  State<home2> createState() => _home2State();
}

class _home2State extends State<home2> {
  int _progress = 0;

  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() {
              _progress = progress;
            });
          },
          onPageStarted: (String url) {
            setState(() {
              _progress = 0;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _progress = 100;
            });
          },
          onHttpError: (HttpResponseError error) {
            Get.to(network_error());
          },
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://shashyaprabartana.com'));
  }

  Future<void> _reloadWebView() async {
    _controller.loadRequest(Uri.parse('https://shashyaprabartana.com'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Image.asset(
          'assets/images/splash_screen.jpg',
          width: MediaQuery.of(context).size.width * .50,
          height: MediaQuery.of(context).size.height * .20,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(3.0),
          child: _progress < 85
              ? LinearProgressIndicator(
                  value: _progress / 100.0,
                  backgroundColor: Colors.grey[200],
                  color: Colors.blue,
                )
              : Container(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _reloadWebView,
        child: WebViewWidget(controller: _controller),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Icon(Icons.refresh),
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {
            _reloadWebView();
          });
        },
      ),
    );
  }
}
