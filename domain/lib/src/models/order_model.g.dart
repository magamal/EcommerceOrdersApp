// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      json['id'] as String?,
      json['isActive'] as bool?,
      json['price'] as String?,
      json['company'] as String?,
      json['picture'] as String?,
      json['buyer'] as String?,
      (json['tags'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      $enumDecodeNullable(_$OrderStatusEnumMap, json['status']),
      json['registered'] as String?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isActive': instance.isActive,
      'price': instance.price,
      'company': instance.company,
      'picture': instance.picture,
      'buyer': instance.buyer,
      'tags': instance.tags,
      'status': _$OrderStatusEnumMap[instance.status],
      'registered': instance.registered,
    };

const _$OrderStatusEnumMap = {
  OrderStatus.DELIVERED: 'DELIVERED',
  OrderStatus.ORDERED: 'ORDERED',
  OrderStatus.RETURNED: 'RETURNED',
};
