import 'package:dipstore/controller/auth_controller.dart';
import 'package:dipstore/services/authentication_services.dart';
import 'package:dipstore/utils/empty_sizebox.dart';
import 'package:dipstore/views/home/home.dart';
import 'package:dipstore/widgets/custom_button.dart';
import 'package:dipstore/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            20.height,
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: "DMSans Bold",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Create an account to continue.",
                  style: TextStyle(
                    fontFamily: "DMSans Regular",
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),

            // Sizebox height
            20.height,
            Form(
              key: formKey,
              child: Column(
                children: [
                  // Email TextFormField
                  CustomTextFormField(
                    hintText: 'Username',
                    preIcon: const Icon(Icons.person_2_outlined),
                    sufIcon: const SizedBox.shrink(),
                    textEditingController: authController.nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),

                  // Sizebox height
                  10.height,

                  // Email TextFormField
                  CustomTextFormField(
                    hintText: 'Address',
                    preIcon: const Icon(Icons.person_2_outlined),
                    sufIcon: const SizedBox.shrink(),
                    textEditingController: authController.addressController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  // Sizebox height
                  10.height,
                  // Email TextFormField
                  CustomTextFormField(
                    hintText: 'Email',
                    preIcon: const Icon(Icons.email_outlined),
                    textEditingController: authController.emailController,
                    sufIcon: const SizedBox.shrink(),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),

                  // Sizebox height
                  10.height,

                  // Email TextFormField
                  CustomTextFormField(
                    hintText: "Password (Only 8 characters)",
                    preIcon: const Icon(Icons.lock_outline),
                    textEditingController: authController.passwordController,
                    sufIcon:
                        const Icon(Icons.remove_red_eye, color: Colors.grey),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            // Sizebox height
            20.height,

            // Sign Up button
            CustomButton(
              btnText: 'Continue',
              ontap: () {
                if (formKey.currentState!.validate()) {
                  AuthenticationServices.signUpUser(
                    name: authController.nameController.text,
                    email: authController.emailController.text,
                    address: authController.addressController.text,
                    password: authController.passwordController.text,
                  ).then((value) => Get.offAll(() => const Home()));
                }
              },
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                10.width, // padding
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Text(
                    "Sign In",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff059669),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // Sizebox height
            30.height,
          ],
        ),
      ),
    );
  }
}
