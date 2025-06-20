import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../models/category/category_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: EshopSizes.spaceBtwItems),
        decoration: BoxDecoration(
          color: EshopColors.white,
          borderRadius: BorderRadius.circular(EshopSizes.cardRadiusSm),
          boxShadow: [
            BoxShadow(
              color: EshopColors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.category,
              size: EshopSizes.iconMd,
              color: EshopColors.primaryColor,
            ),
            const SizedBox(height: EshopSizes.xs),
            Text(
              category.name,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}