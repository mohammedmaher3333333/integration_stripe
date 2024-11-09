import 'package:flutter/material.dart';
import 'package:integration/features/checkout/presentation/views/widgets/payment_method_item.dart';

import '../../../../../core/utils/assets_manager.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({super.key});

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  final List<String> paymentMethodsItems = const [
    ImageAssets.card,
    ImageAssets.paypal,
    ImageAssets.pay,
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethodsItems.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            activeIndex = index;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: PaymentMethodItem(
              isActive: activeIndex == index,
              image: paymentMethodsItems[index],
            ),
          ),
        ),
      ),
    );
  }
}
