import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oivan_exam/core/view_models/interfaces/iauth_viewmodel.dart';
import 'package:oivan_exam/global/router.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late IAuthViewModel _iAuthViewModel;
  @override
  void initState() {
    _iAuthViewModel = context.read<IAuthViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue[100]!, Colors.blue[50]!],
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(100),
                      child: Image.asset('assets/images/playstore-icon.png',
                          fit: BoxFit.cover),
                    ),
                  )),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        30,
                      ),
                      topRight: Radius.circular(
                        30,
                      ))),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Text(
                    'Get Started Now 🚀',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Log in through Stack Overflow will get you higher quota !',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                      onPressed: () async {
                        await _iAuthViewModel.getAuthentication();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0ea473),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Log In',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(
                        MyRouter.home,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        side: const BorderSide(color: Colors.black),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Continue as guest'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // Bottom Section (Buttons)
          ],
        ),
      ),
    );
  }
}
