import "package:flutter/material.dart";
import 'package:yawwn/widgets/background_decorations/background_container.dart';

class MoonAndStarsBackground extends StatelessWidget {
  const MoonAndStarsBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      children: [
        Column(
          children: [
            const SizedBox(height: 20),
            Container(
                width: 1 / 0,
                height: 500,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("assets/background1/stars1.png"),
                        fit: BoxFit.contain)),
                child: null),
          ],
        ),
        Container(
            width: 1 / 0,
            height: 1 / 0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    image: AssetImage("assets/background1/background.png"),
                    fit: BoxFit.contain)),
            child: null),
        Positioned(
          right: 0,
          top: 50 + MediaQuery.of(context).size.height * 0.04,
          child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.topRight,
                      image: AssetImage("assets/background1/comets.png"),
                      fit: BoxFit.contain)),
              child: null),
        ),
      ],
    );
  }
}
