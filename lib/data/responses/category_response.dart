import 'package:json_annotation/json_annotation.dart';
part 'category_response.g.dart';

///category response
@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "Status")
  final int? status;
  @JsonKey(name: "Message")
  final String? message;
  @JsonKey(name: "Result")
  final Result? result;

  CategoryResponse({
    this.status,
    this.message,
    this.result,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class Result {
  @JsonKey(name: "Category")
  final List<Category>? category;

  Result({
    this.category,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: "Id")
  final int? id;
  @JsonKey(name: "Name")
  final String? name;
  @JsonKey(name: "IsAuthorize")
  final int? isAuthorize;
  @JsonKey(name: "Update080819")
  final int? update080819;
  @JsonKey(name: "Update130919")
  final int? update130919;
  @JsonKey(name: "SubCategories")
  final List<SubCategory>? subCategories;

  Category({
    this.id,
    this.name,
    this.isAuthorize,
    this.update080819,
    this.update130919,
    this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class SubCategory {
  @JsonKey(name: "Id")
  final int? id;
  @JsonKey(name: "Name")
  final String? name;
  @JsonKey(name: "Product")
  final List<Product>? product;

  SubCategory({
    this.id,
    this.name,
    this.product,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => _$SubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "Name")
  final String? name;
  @JsonKey(name: "PriceCode")
  final String? priceCode;
  @JsonKey(name: "ImageName")
  final String? imageName;
  @JsonKey(name: "Id")
  final int? id;

  Product({
    this.name,
    this.priceCode,
    this.imageName,
    this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
