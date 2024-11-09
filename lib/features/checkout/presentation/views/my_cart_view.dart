import 'package:flutter/material.dart';
import 'package:integration/core/utils/strings_manager.dart';
import 'package:integration/core/widgets/custom_app_bar.dart';
import 'package:integration/features/checkout/presentation/views/widgets/my_card_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: AppStrings.myCart),
      body: const SafeArea(
        child: MyCardViewBody(),
      ),
    );
  }
}
