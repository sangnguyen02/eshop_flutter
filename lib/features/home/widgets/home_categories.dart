import 'package:eshop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../models/category/category_model.dart';


class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categories[index];
            return VerticalImageText(
              isNetworkImage: true,
              image: category.image ?? EshopImages.racket,
              title: category.name,
              onTap: () => context.push('/category'),
            );
          }
      ),
    );
  }
}