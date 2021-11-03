import "package:flutter/material.dart";
import 'package:yawwn/pages/instructions.dart';
import 'package:yawwn/widgets/background_decorations/moon_and_stars_background.dart';
import 'package:yawwn/widgets/bottom_navigation_buttons.dart';
import 'package:yawwn/widgets/stack_container.dart';
import 'package:yawwn/widgets/welcome_text.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StackContainer(children: [
        const MoonAndStarsBackground(),
        Stack(children: [
          const WelcomeText(),
          BottomNavigationButton(
            goForwardText: "Let's Begin",
            forwardOnPressed: () =>
                Navigator.pushNamed(context, Instructions.route),
          ),
        ]),
      ]),
    );
  }
}
