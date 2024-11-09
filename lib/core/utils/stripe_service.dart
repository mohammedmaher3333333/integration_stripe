import 'package:integration/core/utils/api_service.dart';
import 'package:integration/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:integration/features/checkout/data/models/payment_intent_model/Payment_intent_model.dart';

class StripeService {
  final ApiService _apiService = ApiService();

  PaymentIntentModel creatPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) {
    _apiService.post(body: paymentIntentInputModel.toJson(), url: 'https://api.stripe.com/v1/payment_intents', token: token)
  }
}
