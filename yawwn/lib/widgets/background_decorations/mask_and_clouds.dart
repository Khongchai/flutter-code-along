import "package:flutter/material.dart";

import 'background_container.dart';

//TODO => animate cloud moves
class MaskAndClouds extends StatelessWidget {
  const MaskAndClouds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return BackgroundContainer(children: [
      Positioned(
          top: screenHeight * 0.25,
          left: 50,
          child: Image.asset("assets/background2/sleep-mask.png")),
      Positioned(
          bottom: screenHeight * 0.15,
          left: -20,
          child: Image.asset("assets/background2/cloud.png")),
      Positioned(
          bottom: screenHeight * 0.25,
          right: -20,
          child: Image.asset("assets/background2/cloud.png")),
      Positioned(
          top: screenHeight * 0.21,
          right: -60,
          child: Image.asset("assets/background2/cloud.png")),
    ]);
  }
}
