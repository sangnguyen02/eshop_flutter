import 'package:flutter/material.dart';

import '../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../models/category/category_model.dart';


class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.hardCodedCategories,
  });

  final List<CategoryModel> hardCodedCategories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: hardCodedCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return VerticalImageText(
                image: hardCodedCategories[index].image,
                title: hardCodedCategories[index].name
            );
          }
      ),
    );
  }
}