import 'package:crypto_wallet/pages/sign_in/widgets/sign_in_form.dart';
import "package:flutter/material.dart";

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xffe0e9f8),
            title: const Center(
              child: Text("Welcome back!",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w500)),
            )),
        body: SafeArea(
          child: Container(
              color: const Color(0xffe0e9f8),
              child: CustomScrollView(reverse: true, slivers: [
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(children: [
                      Image.asset("assets/images/login.png"),
                      const Expanded(child: SignInForm())
                    ]))
              ])),
        ));
  }
}
