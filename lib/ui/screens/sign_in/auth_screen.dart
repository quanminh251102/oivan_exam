import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:oivan_exam/constant.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = kIsWeb
        ? null
        : PullToRefreshController(
            options: PullToRefreshOptions(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS) {
                webViewController?.loadUrl(
                    urlRequest:
                        URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
    // webViewController?.loadUrl(
    //     urlRequest: URLRequest(
    //         url: Uri.parse(authorizationEndpoint).replace(queryParameters: {
    //   'client_id': clientId,
    //   'scope': 'no_expiry',
    //   'redirect_uri': redirectUri,
    // })));
  }

  String extractTokenFromUrl(String url) {
    // Create a map to hold the extracted values
    Map<String, String> result = {};

    // Parse the URL and get the fragment (the part after the #)
    Uri uri = Uri.parse(url);
    String fragment = uri.fragment; // Get the part after '#'

    // Split the fragment by '&' to get individual key-value pairs
    List<String> parameters = fragment.split('&');

    // Loop through the parameters and split them by '=' to get the key and value
    for (String param in parameters) {
      List<String> keyValue = param.split('=');
      if (keyValue.length == 2) {
        // Add the key-value pair to the result map
        result[keyValue[0]] = keyValue[1];
      }
    }

    return result['access_token']!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(
                    url: Uri.parse(authorizationEndpoint)
                        .replace(queryParameters: {
                  'client_id': clientId,
                  'scope': 'no_expiry',
                  'redirect_uri': redirectUri,
                })),
                pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onLoadStart: (controller, url) {
                  print("URL ----------" + url.toString());
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                // onPermissionRequest: (controller, request) async {
                //  return PermissionResponse(
                //      resources: request.resources,
                //      action: PermissionResponseAction.GRANT);
                // },
                onCreateWindow: (controller, createWindowAction) async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return WindowPopup(
                          createWindowAction: createWindowAction);
                    },
                  );
                  return true;
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  // https://embedded-wallet.thirdweb.com/api/2024-05-05/login/google?clientId=f3b0d40edd0251e2ba4a9ef3a20fa268

                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {
                  pullToRefreshController?.endRefreshing();
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController?.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                    urlController.text = url;
                  });
                },
                onUpdateVisitedHistory:
                    (controller, url, androidIsReload) async {
                  String? token = extractTokenFromUrl(url.toString());
                  if (token != null) {
                    Navigator.pop(context, token);
                  }
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url;
                  });
                },
                onConsoleMessage: (controller, consoleMessage) {
                  if (kDebugMode) {
                    print(consoleMessage);
                  }
                },
                onPageCommitVisible: (controller, url) async {
                  print('123213123');
                })));
  }
}

class WindowPopup extends StatefulWidget {
  final CreateWindowAction createWindowAction;

  const WindowPopup({Key? key, required this.createWindowAction})
      : super(key: key);

  @override
  State<WindowPopup> createState() => _WindowPopupState();
}

class _WindowPopupState extends State<WindowPopup> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child:
                    Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close))
            ]),
            Expanded(
              child: InAppWebView(
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                },
                windowId: widget.createWindowAction.windowId,
                onTitleChanged: (controller, title) {
                  setState(() {
                    this.title = title ?? '';
                  });
                },
                onCloseWindow: (controller) {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
