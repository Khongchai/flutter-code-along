import "package:flutter/material.dart";

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1 / 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("21 DAYS",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
          SizedBox(height: 20),
          Text("Your journey to a healthier"),
          SizedBox(height: 10),
          Text("life and better sleep routine."),
        ],
      ),
    );
  }
}
