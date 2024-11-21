import 'details.dart';

class AmountModel {
  AmountModel({
      this.total, 
      this.currency, 
      this.details,});

  AmountModel.fromJson(dynamic json) {
    total = json['total'];
    currency = json['currency'];
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
  }
  String? total;
  String? currency;
  Details? details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['currency'] = currency;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }

}