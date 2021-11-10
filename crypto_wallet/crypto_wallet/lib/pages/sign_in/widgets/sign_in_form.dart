import 'package:crypto_wallet/pages/sign_up/widgets/sign_up.dart';
import "package:flutter/material.dart";

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 50),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          )),
      child: Form(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Column(
              children: [
                TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email address",
                    ),
                    autocorrect: false,
                    autofocus: false),
                TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                    ),
                    obscureText: true,
                    autocorrect: false,
                    autofocus: false),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text("Forgot your password?",
                        style: TextStyle(
                            color: Color(0xff347af0),
                            fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
            Column(children: [
              FlatButton(
                  onPressed: () {},
                  color: const Color(0xff347af0),
                  child: const Text("Login",
                      style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: Color(0xff347af0)))),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Don't have an account? ",
                    style: TextStyle(
                        color: Color(0xff485068), fontWeight: FontWeight.w300)),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SignUpPage();
                    }));
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(
                          color: Color(0xff347af0),
                          fontWeight: FontWeight.bold)),
                )
              ])
            ]),
          ])),
    );
  }
}
