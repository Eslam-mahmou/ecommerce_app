import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_specific_cubit/product_specific_cubit.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../core/Widget/custom_image_slide_show.dart';

class CustomProductImage extends StatelessWidget {
  const CustomProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductSpecificCubit product=getIt<ProductSpecificCubit>();
    return  CustomImageSlideShow(
      height: 300,
      child: product.product!.images!.map(
            (image) {
          return CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.fill,
            imageBuilder: (context, imageProvider) =>
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorsManager.greyColor),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.primaryColor,
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          );
        },
      ).toList(),
    );
  }
}
