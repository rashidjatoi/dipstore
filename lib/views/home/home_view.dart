import 'package:dipstore/services/authentication_services.dart';
import 'package:dipstore/views/auth/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          "Dipstore.",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "DMSans Bold",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mail_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () {
              AuthenticationServices.signoutMethod().then(
                (value) => Get.offAll(() => const SignInView()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const Column(),
    );
  }
}
