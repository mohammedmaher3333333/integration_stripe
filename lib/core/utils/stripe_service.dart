import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:integration/core/utils/api_keys.dart';
import 'package:integration/core/utils/api_service.dart';
import 'package:integration/features/checkout/data/models/ephemeral_key_model/Ephemeral_key_model.dart';
import 'package:integration/features/checkout/data/models/init_payment_sheet_input_model/init_payment_sheet_input_model.dart';
import 'package:integration/features/checkout/data/models/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:integration/features/checkout/data/models/payment_intent_model/Payment_intent_model.dart';

class StripeService {
  final ApiService _apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      var response = await _apiService.post(
        body: paymentIntentInputModel.toJson(),
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKeys.secretKey,
      );
      print('API response data: ${response.data}');
      var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
      return paymentIntentModel;
    } catch (e) {
      if (e is DioException) {
        print("Dio error: ${e.response?.data}");
      }
      print("Error occurred while creating payment intent: $e");
      rethrow;
    }
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
          customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
          customerId: initPaymentSheetInputModel.customerId,
          merchantDisplayName: 'mohammed',
        ),
      );
    } catch (e) {
      print("Error initializing payment sheet: $e");
      rethrow;
    }
  }

  Future displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print("Error displaying payment sheet: $e");
      rethrow;
    }
  }

  // Future<CustomerInputModel> createCustomer({required String name}) async {
  //   try {
  //     var response = await _apiService.post(
  //       body: {'name': name},
  //       contentType: Headers.formUrlEncodedContentType,
  //       url: 'https://api.stripe.com/v1/customers',
  //       token: ApiKeys.secretKey,
  //     );
  //
  //     var customerInputModelData = CustomerInputModel.fromJson(response.data);
  //     // حفظ الـ Customer ID بعد إنشاء العميل
  //     await _localStorageService.saveCustomerId(customerInputModelData.id!);
  //
  //     return customerInputModelData;
  //   } catch (e) {
  //     print("Error creating payment intent: $e");
  //     rethrow;
  //   }
  // }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    try {
      var response = await _apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2024-10-28.acacia',
        },
      );

      var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
      print('API response data ephemeralKey: ${response.data}');

      return ephemeralKey;
    } catch (e) {
      print("Error creating EphemeralKey intent: $e");
      rethrow;
    }
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemeralKey: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );
    await displayPaymentSheet();
  }
}
