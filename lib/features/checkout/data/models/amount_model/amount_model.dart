import 'package:integration/features/checkout/data/models/amount_model/details_model.dart';

class AmountModel {
  final String? total;
  final String? currency;
  final Details? details;

  AmountModel({
    required this.total,
    required this.currency,
    required this.details,
  });

  factory AmountModel.fromJson(Map<String, dynamic> json) {
    return AmountModel(
      total: json['total'] as String?,
      currency: json['currency'] as String?,
      details:
          json['details'] != null ? Details.fromJson(json['details']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['currency'] = currency;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}
