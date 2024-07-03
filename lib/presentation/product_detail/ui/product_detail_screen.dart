import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practical_stuti/data/responses/category_response.dart';
import 'package:practical_stuti/utils/app_colors.dart';
import 'package:practical_stuti/utils/app_strings.dart';
import 'package:practical_stuti/utils/custom_text_widget.dart';

///Screen used for display Detail of product
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const CustomTextWidget(
          text: AppStrings.productDetail,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: CachedNetworkImage(
                        imageUrl: product.imageName ?? '',
                        width: MediaQuery.of(context).size.width / 2,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: CustomTextWidget(
                          text: product.priceCode ?? '',
                          fontColor: AppColors.white,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextWidget(
                text: product.name ?? '',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              )
            ],
          ),
        ),
      ),
    );
  }
}
