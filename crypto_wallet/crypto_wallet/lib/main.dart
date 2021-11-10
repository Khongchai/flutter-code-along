import 'package:crypto_wallet/pages/sign_in/widgets/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        elevation: 0.0,
        color: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      )),
      home: const SignInPage(),
    );
  }
}
