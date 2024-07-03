import 'package:practical_stuti/data/responses/category_response.dart';

///Home page repository
abstract class HomePageRepository{
  Future<CategoryResponse?>? getCategories();
  Future<CategoryResponse?>? getSubCategories(int page);
  // Future<CategoryResponse?>? getSubProduct();
}