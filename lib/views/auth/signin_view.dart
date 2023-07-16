import 'package:dipstore/controller/auth_controller.dart';
import 'package:dipstore/services/authentication_services.dart';
import 'package:dipstore/utils/empty_sizebox.dart';
import 'package:dipstore/views/auth/signup_view.dart';
import 'package:dipstore/views/home/home.dart';
import 'package:dipstore/widgets/custom_button.dart';
import 'package:dipstore/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              // 50.height, // Padding

              signinTextWidget(), // Sign in text

              20.height, // Padding

              Form(
                key: formKey,
                child: Column(
                  children: [
                    // Email TextFormField
                    CustomTextFormField(
                        hintText: 'Email',
                        preIcon: const Icon(Icons.email_outlined),
                        sufIcon: const SizedBox.shrink(),
                        textEditingController: authController.emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Email';
                          }
                          return null;
                        }),

                    10.height, // padding

                    // Password TextFormField
                    CustomTextFormField(
                      hintText: 'Password (8 characters)',
                      preIcon: const Icon(Icons.lock_outline),
                      sufIcon: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.grey,
                      ),
                      textEditingController: authController.passwordController,
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

              15.height, // Padding

              // Forgot Password Text
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xff059669),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              20.height, // Padding

              // Sign in button

              CustomButton(
                btnText: 'Sign In',
                ontap: () {
                  if (formKey.currentState!.validate()) {
                    AuthenticationServices.loginMethod(
                      authController.emailController.text,
                      authController.passwordController.text,
                    ).then((value) => Get.offAll(() => const Home()));
                  }
                },
              ),

              30.height,

              // spacer
              const Spacer(),

              // don't have an account
              dontHaveAccountWidget(),

              // Sizebox height
              30.height
            ],
          ),
        ),
      ),
    );
  }

  Widget dontHaveAccountWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        10.width, // padding
        InkWell(
          onTap: () {
            Get.to(() => const SignUpView());
          },
          child: const Text(
            "Sign Up",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xff059669),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget signinTextWidget() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Please Sign In",
          style: TextStyle(
            fontSize: 22,
            fontFamily: "DMSans Bold",
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Enter your Dipstore account details for a personalised experience.",
          style: TextStyle(
            fontFamily: "DMSans Regular",
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
