import 'package:flutter/material.dart';
import 'package:oivan_exam/core/view_models/interfaces/isplash_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(
                  'assets/lottie/splash.json',
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Oivan Stack',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
