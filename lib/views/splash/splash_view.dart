import 'dart:async';
import 'package:dipstore/services/firebase_services_constants.dart';
import 'package:dipstore/views/auth/signin_view.dart';
import 'package:dipstore/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  void navigateToLanding() async {
    if (currentUser == null) {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        Get.off(() => const SignInView());
      });
    } else {
      _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
        Get.off(() => const Home());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    navigateToLanding();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xff065F46),
        body: Center(
          child: Text(
            "Dipstore.",
            style: TextStyle(
                fontSize: 30,
                color: Color(0xffFED2AA),
                fontFamily: "DMSans Medium"),
          ),
        ));
  }
}
