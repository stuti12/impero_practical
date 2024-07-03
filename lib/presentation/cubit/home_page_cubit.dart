import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_stuti/data/repository/home_page_repository.dart';
import 'package:practical_stuti/data/responses/category_response.dart';

part 'home_page_state.dart';

///Home page cubit
class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit({required this.homePageRepository})
      : super(const HomePageState()) {
    fetchCategories();
    fetchSubCategories();
  }

  final HomePageRepository homePageRepository;
  final ScrollController scrollController = ScrollController();
  bool hasMore = true;
  int currentPage = 0;

  ///method for pagination
  void _initializeScrollListener() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          hasMore) {
        currentPage++;
        // await _callProductFetchApi(currentPage);
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
    final response = await homePageRepository.getSubCategories();
    emit(state.copyWith(
        subCategoryList: response?.result?.category?[0].subCategories));
    debugPrint("Sub category Res==${response}");
  }
}
