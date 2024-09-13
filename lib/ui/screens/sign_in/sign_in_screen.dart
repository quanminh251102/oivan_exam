import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oivan_exam/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? accessToken;
  final AppLinks _appLinks = AppLinks();
  Future<void> initDeepLinks() async {
    try {
      final appLink = await _appLinks.getInitialLink();
      if (appLink != null) {
        _handleRedirect(appLink);
      }

      _appLinks.uriLinkStream.listen((uri) {
        _handleRedirect(uri);
      });
    } on Exception catch (e) {
      print('AppLinksException: $e');
      // Xử lý lỗi, ví dụ: hiển thị thông báo cho người dùng
    }
  }

  Future<void> _initiateAuth() async {
    final authUrl = Uri.parse(authorizationEndpoint).replace(queryParameters: {
      'client_id': clientId,
      'scope': 'no_expiry',
      'redirect_uri': redirectUri,
    });

    if (await canLaunchUrl(authUrl)) {
      await launchUrl(
        authUrl,
        mode: LaunchMode.inAppBrowserView,
      ).then(
        (value) {},
      );
    } else {
      throw 'Could not launch $authUrl';
    }
  }

  Future<void> _handleRedirect(Uri uri) async {
    if (uri.queryParameters.containsKey('code')) {
      final code = uri.queryParameters['code']!;

      final response = await http.post(
        Uri.parse(accessTokenEndpoint),
        body: {
          'client_id': clientId,
          'client_secret': clientSecret,
          'code': code,
          'redirect_uri': redirectUri,
        },
      );

      if (response.statusCode == 200) {
        // Parse the response to get the access token
        final accessToken = Uri.splitQueryString(response.body)['access_token'];
        setState(() {
          this.accessToken = accessToken;
        });
      } else {
        // Handle error
        print('Error getting access token: ${response.body}');
      }
    }
  }

  @override
  void initState() {
    Future.delayed(
      Duration.zero,
      () async {
        await initDeepLinks();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              ClipPath(
                clipper: DrawClip2(),
                child: Container(
                  width: size.width,
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.bottomRight),
                  ),
                ),
              ),
              ClipPath(
                clipper: DrawClip(),
                child: Container(
                  width: size.width,
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffddc3fc), Color(0xff91c5fc)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.3,
                child: Container(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons
                                .eco, // Leaf icon (you might need to find a better one)
                            color: Color(0xFF38A169), // Green color
                            size: 50,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Leafboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'A platform built for a new way of working',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                        onPressed: _initiateAuth,
                        child: Text('Authenticate'),
                      ),
                      if (accessToken != null)
                        Text('Access Token: $accessToken'),
                    ],
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

Widget input(String hint, bool pass) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.only(top: 15, bottom: 15),
            prefix: pass
                ? Icon(Icons.lock_outline, color: Colors.grey)
                : Icon(Icons.person_outline, color: Colors.grey),
            suffixIcon: pass
                ? null
                : Icon(Icons.assignment_turned_in_rounded,
                    color: Colors.greenAccent),
            border: UnderlineInputBorder(borderSide: BorderSide.none)),
      ),
    ),
  );
}

class DrawClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.80);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DrawClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.08);
    path.cubicTo(size.width / 4, size.height, 3 * size.width / 4,
        size.height / 2, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
