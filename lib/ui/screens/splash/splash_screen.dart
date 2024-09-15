import 'package:flutter/material.dart';
import 'package:oivan_exam/core/view_models/interfaces/isplash_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late ISplashViewModel _iSplashViewModel;
  @override
  void initState() {
    _iSplashViewModel = context.read<ISplashViewModel>();
    Future.delayed(const Duration(seconds: 2), () async {
      await _iSplashViewModel.checkLogin();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset(
            //   'assets/oivanstack_logo.png',
            //   // Replace with your logo image path
            //   height: 200, // Adjust logo size as needed
            // ),
            SizedBox(height: 20),
            Text(
              'OivanStack',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Customize text color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
