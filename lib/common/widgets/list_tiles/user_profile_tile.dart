import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../image/circular_image.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
    required this.username,
    required this.email,
    required this.avatar,
    this.onPressed,
  });

  final String username, email, avatar;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularImage(
        imageUrl: avatar,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(username, style: Theme.of(context).textTheme.headlineSmall!.apply(color: EshopColors.white)),
      subtitle: Text(email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: EshopColors.white)),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: EshopColors.white),
      ),
    );
  }
}