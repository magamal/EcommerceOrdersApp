import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  final String? id;
  final bool? isActive;
  final String? price;
  final String? company;
  final String? picture;
  final String? buyer;
  final List<String?>? tags;
  final OrderStatus? status;
  final String? registered;

  OrderModel(
    this.id,
    this.isActive,
    this.price,
    this.company,
    this.picture,
    this.buyer,
    this.tags,
    this.status,
    this.registered,
  );

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
