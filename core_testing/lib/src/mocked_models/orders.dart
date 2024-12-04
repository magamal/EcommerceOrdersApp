import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@visibleForTesting
final orderJson = {
  "id": "1",
  "isActive": true,
  "price": "\$1,111.11",
  "company": "test",
  "picture": "http://placehold.it/32x32",
  "buyer": "test",
  "tags": ["#eiusmod", "#qui", "#elit", "#elit", "#aliqua", "#in", "#occaecat"],
  "status": "ORDERED",
  "registered": "2021-01-01T12:48:03 -02:00"
};

@visibleForTesting
final ordersJson = [
  {
    "id": "1",
    "isActive": true,
    "price": "\$2,222.22",
    "company": "test",
    "picture": "http://placehold.it/32x32",
    "buyer": "test",
    "tags": [
      "#eiusmod",
      "#qui",
      "#elit",
      "#elit",
      "#aliqua",
      "#in",
      "#occaecat"
    ],
    "status": "ORDERED",
    "registered": "2021-01-01T12:48:03 -02:00"
  },
  {
    "id": "2",
    "isActive": true,
    "price": "\$2,222.22",
    "company": "test",
    "picture": "http://placehold.it/32x32",
    "buyer": "test",
    "tags": [
      "#eiusmod",
      "#qui",
      "#elit",
      "#elit",
      "#aliqua",
      "#in",
      "#occaecat"
    ],
    "status": "RETURNED",
    "registered": "2021-02-02T12:48:03 -02:00"
  },
  {
    "id": "3",
    "isActive": true,
    "price": "\$3,333.33",
    "company": "test",
    "picture": "http://placehold.it/32x32",
    "buyer": "test",
    "tags": [
      "#eiusmod",
      "#qui",
      "#elit",
      "#elit",
      "#aliqua",
      "#in",
      "#occaecat"
    ],
    "status": "DELIVERED",
    "registered": "2021-03-03T12:48:03 -02:00"
  }
];

@visibleForTesting
final OrderModel orderModel = OrderModel.fromJson(orderJson);

@visibleForTesting
final List<OrderModel> ordersListModel = _provideOrdersListModel();

List<OrderModel> _provideOrdersListModel() {
  List<dynamic> list = jsonDecode(jsonEncode(ordersJson));
  return list.map((itemJson) => OrderModel.fromJson(itemJson)).toList();
}
