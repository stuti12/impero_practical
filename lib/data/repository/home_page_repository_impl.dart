import 'package:dio/dio.dart';
import 'package:practical_stuti/data/repository/home_page_repository.dart';
import 'package:practical_stuti/data/request/category_request.dart';
import 'package:practical_stuti/data/responses/category_response.dart';
import 'package:practical_stuti/utils/constant.dart';

class HomePageRepositoryImpl extends HomePageRepository {
  final Dio dio = Dio();

  @override
  Future<CategoryResponse?>? getCategories() async {
    final request = CategoryRequest(
        categoryId: 0,
        deviceManufacturer: 'Google',
        deviceModel: "Android SDK built for x86",
        deviceToken: "",
        pageIndex: 1);
    final response = await dio.post(
        '${AppConstant.baseUrl}Product/DashBoard',
        data: request,options: Options(contentType: 'application/json'));
    if (response.statusCode == 200) {
      var productResponse = CategoryResponse.fromJson(response.data);
      return productResponse;
    }
    return null;
  }

  @override
  Future<CategoryResponse?>? getSubCategories(int page) async {
    final request = CategoryRequest(
        categoryId: 56,
        pageIndex: page);
    final response = await dio.post(
        '${AppConstant.baseUrl}Product/DashBoard',
        data: request,options: Options(contentType: 'application/json'));
    if (response.statusCode == 200) {
      var productResponse = CategoryResponse.fromJson(response.data);
      return productResponse;
    }
    return null;
  }
}
