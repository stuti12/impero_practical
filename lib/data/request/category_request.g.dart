// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryRequest _$CategoryRequestFromJson(Map<String, dynamic> json) =>
    CategoryRequest(
      categoryId: (json['CategoryId'] as num?)?.toInt(),
      deviceManufacturer: json['DeviceManufacturer'] as String?,
      deviceModel: json['DeviceModel'] as String?,
      deviceToken: json['DeviceToken'] as String?,
      pageIndex: (json['PageIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryRequestToJson(CategoryRequest instance) =>
    <String, dynamic>{
      'CategoryId': instance.categoryId,
      'DeviceManufacturer': instance.deviceManufacturer,
      'DeviceModel': instance.deviceModel,
      'DeviceToken': instance.deviceToken,
      'PageIndex': instance.pageIndex,
    };
