import 'package:flutter/material.dart';
import 'package:integration/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: const ThankYouViewBody(),
    );
  }
}
