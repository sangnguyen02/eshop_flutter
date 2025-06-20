import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';


class ProfileInfoRow extends StatelessWidget {
  const ProfileInfoRow({
    super.key,
    required this.onPressed,
    this.icon = Iconsax.arrow_right_34,
    required this.title,
    required this.value,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: EshopSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis)),
            Expanded(flex: 5, child: Text(value, style: Theme.of(context).textTheme.bodyMedium, overflow: TextOverflow.ellipsis)),
            Expanded(child: Icon(icon, size: 18)),
          ],
        ),
      ),
    );
  }
}
