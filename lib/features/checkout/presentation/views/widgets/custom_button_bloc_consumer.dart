import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:integration/core/utils/api_keys.dart';
import 'package:integration/core/widgets/custom_button.dart';
import 'package:integration/features/checkout/data/models/amount_model/details_model.dart';
import 'package:integration/features/checkout/data/models/item_list_model/Item_list_model.dart';
import 'package:integration/features/checkout/data/models/item_list_model/order_items_model.dart';
import 'package:integration/features/checkout/presentation/manager/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:integration/features/checkout/presentation/views/thank_you_view.dart';

import '../../../../../core/utils/strings_manager.dart';
import '../../../data/models/amount_model/Amount_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ThankYouView(),
            ),
          );
        }
        if (state is StripePaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(amount: '100', currency: 'USD', customerId: 'cus_REhgjZsQaBMPCl');
            // BlocProvider.of<StripePaymentCubit>(context)
            //     .makePayment(paymentIntentInputModel: paymentIntentInputModel);
            // Details details =
            var transactionsData = getTransactionsData();
            executePaypalPayment(context, transactionsData);
          },
          isLoading: state is StripePaymentLoading ? true : false,
          text: AppStrings.continueText,
        );
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionsData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            // print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amount = AmountModel(
      currency: "USD",
      details: Details(
        shipping: '0',
        shippingDiscount: 0,
        subtotal: '100',
      ),
      total: '100',
    );
    List<OrderItemsModel> orders = [
      OrderItemsModel(
        currency: "USD",
        name: "Apple",
        price: '10',
        quantity: 4,
      ),
      OrderItemsModel(
        currency: "USD",
        name: "Pineapple",
        price: '12',
        quantity: 5,
      ),
    ];
    var itemList = ItemListModel(orders: orders);
    return (amount: amount, itemList: itemList);
  }
}
