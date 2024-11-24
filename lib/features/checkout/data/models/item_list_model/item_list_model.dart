import 'order_items_model.dart';

class ItemListModel {
  ItemListModel({
      this.orders,});

  ItemListModel.fromJson(dynamic json) {
    if (json['items'] != null) {
      orders = [];
      json['items'].forEach((v) {
        orders?.add(OrderItemsModel.fromJson(v));
      });
    }
  }
  List<OrderItemsModel>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['items'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}