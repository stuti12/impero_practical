import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_stuti/data/repository/home_page_repository.dart';
import 'package:practical_stuti/data/responses/category_response.dart';
import 'package:practical_stuti/presentation/product_detail/ui/product_detail_screen.dart';

part 'home_page_state.dart';

///Home page cubit
class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.homePageRepository})
      : super(const HomePageState()) {
    fetchCategories();
    fetchSubCategories();
    _initializeScrollListener();
  }

  final HomePageRepository homePageRepository;
  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int currentPage = 1;

  ///method for pagination
  void _initializeScrollListener() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          hasMore) {
        currentPage++;
        await fetchSubCategories();
      }
    });
  }

  ///method for fetch all categories
  Future<void> fetchCategories() async {
    var response = await homePageRepository.getCategories();
    if (response != null) {
      emit(state.copyWith(categoryList: response.result?.category ?? []));
    } else {
      emit(state.copyWith(errorMessage: response?.message));
    }
  }

  ///method for find all sub categories
  Future<void> fetchSubCategories() async {
    final response = await homePageRepository.getSubCategories(currentPage);
    if (response != null && response.result?.category?[0].subCategories != null) {
      final subCategories = response.result!.category![0].subCategories!;
      if (subCategories.isEmpty) {
        hasMore = false;
      } else {
        emit(state.copyWith(
          subCategoryList: List.from(state.subCategoryList)..addAll(subCategories),
        ));
      }
    } else {
      hasMore = false;
    }

  }

  ///for navigate to product detail
  void navigate({required BuildContext context,required Product product}){
    Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product,),));
  }
}
