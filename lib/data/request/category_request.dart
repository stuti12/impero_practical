import 'package:json_annotation/json_annotation.dart';

part 'category_request.g.dart';
///Category request model
@JsonSerializable()
class CategoryRequest {
  @JsonKey(name: "CategoryId")
  final int? categoryId;
  @JsonKey(name: "DeviceManufacturer")
  final String? deviceManufacturer;
  @JsonKey(name: "DeviceModel")
  final String? deviceModel;
  @JsonKey(name: "DeviceToken")
  final String? deviceToken;
  @JsonKey(name: "PageIndex")
  final int? pageIndex;

  CategoryRequest({
    this.categoryId,
    this.deviceManufacturer,
    this.deviceModel,
    this.deviceToken,
    this.pageIndex,
  });

  factory CategoryRequest.fromJson(Map<String, dynamic> json) => _$CategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryRequestToJson(this);
}
