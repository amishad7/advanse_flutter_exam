import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:practical_exam/app/utils/models/newapimodel/newsapimodel.dart';
import 'package:provider/provider.dart';

class detailview extends StatefulWidget {
  detailview({super.key});

  @override
  State<detailview> createState() => DetailPage();
}

class DetailPage extends State<detailview> {
  InAppWebViewController? inAppWebViewController;
  Connectivity connectivity = Connectivity();
  late PullToRefreshController pullToRefreshController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(
          color: Colors.black,
        ),
        onRefresh: () {
          inAppWebViewController?.reload();
        });
  }

  @override
  Widget build(BuildContext context) {
    Stream<ConnectivityResult> connectivity_stream =
        connectivity.onConnectivityChanged;

    String argus = ModalRoute.of(context)!.settings.arguments as String;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("News Source"),
        ),
        body: StreamBuilder(
          stream: connectivity_stream,
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return (snapshot.data == ConnectivityResult.wifi ||
                      snapshot.data == ConnectivityResult.mobile)
                  ? InAppWebView(
                      pullToRefreshController: pullToRefreshController,
                      initialUrlRequest: URLRequest(
                        url: WebUri.uri(
                          Uri.parse('$argus'),
                        ),
                      ),
                      onLoadStart: (controller, uri) {
                        inAppWebViewController = controller;
                      },
                      onLoadStop: (controller, uri) {
                        pullToRefreshController.endRefreshing();
                      },
                    )
                  : Center(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                        ),
                      ),
                    );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
