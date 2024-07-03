// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      status: (json['Status'] as num?)?.toInt(),
      message: json['Message'] as String?,
      result: json['Result'] == null
          ? null
          : Result.fromJson(json['Result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Message': instance.message,
      'Result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      category: (json['Category'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'Category': instance.category,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      isAuthorize: (json['IsAuthorize'] as num?)?.toInt(),
      update080819: (json['Update080819'] as num?)?.toInt(),
      update130919: (json['Update130919'] as num?)?.toInt(),
      subCategories: (json['SubCategories'] as List<dynamic>?)
          ?.map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'IsAuthorize': instance.isAuthorize,
      'Update080819': instance.update080819,
      'Update130919': instance.update130919,
      'SubCategories': instance.subCategories,
    };

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      product: (json['Product'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['Name'] as String?,
      priceCode: json['PriceCode'] as String?,
      imageName: json['ImageName'] as String?,
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'Name': instance.name,
      'PriceCode': instance.priceCode,
      'ImageName': instance.imageName,
      'Id': instance.id,
    };
