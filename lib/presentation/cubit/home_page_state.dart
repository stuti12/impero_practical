part of 'home_page_cubit.dart';

///Home page state
class HomePageState extends Equatable {
  const HomePageState(
      {this.categoryList = const [],
      this.subCategoryList = const [],
      this.errorMessage});

  @override
  List<Object?> get props => [categoryList, subCategoryList, errorMessage];
  final List<Category> categoryList;
  final List<SubCategory> subCategoryList;
  final String? errorMessage;

  HomePageState copyWith(
      {List<Category>? categoryList,
      List<SubCategory>? subCategoryList,
      String? errorMessage}) {
    return HomePageState(
      categoryList: categoryList ?? this.categoryList,
      subCategoryList: subCategoryList ?? this.subCategoryList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
