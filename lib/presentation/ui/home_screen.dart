import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_stuti/data/repository/home_page_repository_impl.dart';
import 'package:practical_stuti/presentation/cubit/home_page_cubit.dart';
import 'package:practical_stuti/presentation/ui/list_item.dart';
import 'package:practical_stuti/utils/app_colors.dart';
import 'package:practical_stuti/utils/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: HomePageCubit(homePageRepository: HomePageRepositoryImpl()),
      child: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return DefaultTabController(
            length: state.categoryList.length,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.black,
                bottom: state.categoryList.isEmpty
                    ? null
                    : TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.center,
                        padding: EdgeInsets.zero,
                        labelColor: AppColors.white,
                        tabs: state.categoryList
                            .map(
                              (category) => Tab(
                                text: category.name,
                              ),
                            )
                            .toList(),
                      ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.filter_alt_sharp),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: state.categoryList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBarView(
                      children: state.categoryList
                          .map(
                            (category) => const CeramicScreen(),
                          )
                          .toList(),
                    ),
            ),
          );
        },
      ),
    );
  }
}

class CeramicScreen extends StatelessWidget {
  const CeramicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageCubit, HomePageState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              final subCategory = state.subCategoryList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomTextWidget(
                      text: subCategory.name ?? '',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subCategory.product != null &&
                          subCategory.product?.isNotEmpty == true
                      ? SizedBox(
                          height: 150,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: subCategory.product!.length,
                            itemBuilder: (context, productIndex) {
                              final product =
                                  subCategory.product![productIndex];
                              return ListItem(product: product);
                            },
                          ),
                        )
                      : Container()
                ],
              );
            },
            itemCount: state.subCategoryList.length,
            shrinkWrap: true,
          );
        },
      ),
    );
  }
}
