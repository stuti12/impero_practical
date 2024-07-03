import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practical_stuti/presentation/home/cubit/home_page_cubit.dart';
import 'package:practical_stuti/presentation/home/ui/product_list_item.dart';
import 'package:practical_stuti/utils/custom_text_widget.dart';

class CeramicScreen extends StatelessWidget {
  const CeramicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageCubit, HomePageState>(
        buildWhen: (previous, current) =>
        previous.subCategoryList != current.subCategoryList ||
            previous.categoryList != current.categoryList,
        builder: (context, state) {
          return ListView.builder(
            controller: context.read<HomePageCubit>().scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              if (index >= state.subCategoryList.length) {
                return const Center(child: CircularProgressIndicator());
              }
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
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                      const SizedBox(
                        width: 10,
                      ),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemCount: subCategory.product!.length,
                      itemBuilder: (context, productIndex) {
                        final product =
                        subCategory.product![productIndex];
                        return ProductListItem(
                          product: product,
                          onClick: () {
                            context.read<HomePageCubit>().navigate(
                                context: context, product: product);
                          },
                        );
                      },
                    ),
                  )
                      : Container()
                ],
              );
            },
            itemCount: state.subCategoryList.length +
                (context.read<HomePageCubit>().hasMore ? 1 : 0),
            shrinkWrap: true,
          );
        },
      ),
    );
  }
}
