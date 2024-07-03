import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:practical_stuti/data/responses/category_response.dart';
import 'package:practical_stuti/utils/app_colors.dart';
import 'package:practical_stuti/utils/custom_text_widget.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: product.imageName ?? '',
                width: MediaQuery.of(context).size.width / 3.5,
                height: 100,
                fit: BoxFit.fitHeight,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: CustomTextWidget(
                    text: product.priceCode ?? '',
                    fontColor: AppColors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10,),
        CustomTextWidget(text: product.name ?? '')
      ],
    );
  }
}
