import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/device/device_utility.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';


class EshopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EshopAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false
  });


  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;


  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: EshopSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(onPressed: () => context.pop(), icon: Icon(Iconsax.arrow_left, color: dark ? EshopColors.white : EshopColors.dark))
            : leadingIcon != null
              ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
              : null,

        title: title,
        actions: actions,

      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(EshopDeviceUtils.getAppBarHeight());
}
