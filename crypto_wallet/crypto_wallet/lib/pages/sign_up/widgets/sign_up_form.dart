import "package:flutter/material.dart";

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

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
                    autofocus: false)
              ],
            ),
            Column(children: [
              FlatButton(
                  onPressed: () {},
                  color: const Color(0xff347af0),
                  child: const Text("Let's Get Started!",
                      style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                      side: const BorderSide(color: Color(0xff347af0)))),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Already have an account?",
                    style: TextStyle(
                        color: Color(0xff485068), fontWeight: FontWeight.w300)),
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Login?",
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
