import 'package:flutter/material.dart';
import 'package:integration/core/utils/assets_manager.dart';
import 'package:integration/core/utils/values_manager.dart';

class DisplayOrdersImage extends StatelessWidget {
  const DisplayOrdersImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p15),
      child: Stack(
        children: [
          Image.asset(ImageAssets.basket),
          Positioned(
            bottom: 73,
            left: 43,
            child: Image.asset(ImageAssets.order3),
          ),
          Positioned(
            top: 201,
            left: 137,
            child: Image.asset(ImageAssets.order2),
          ),
          Positioned(
            top: 76,
            left: 50,
            child: Image.asset(ImageAssets.order1),
          ),
        ],
      ),
    );
  }
}
