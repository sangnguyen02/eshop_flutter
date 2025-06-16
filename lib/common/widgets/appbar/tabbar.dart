import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/device/device_utility.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class EshopTabbar extends StatelessWidget implements PreferredSizeWidget {
  const EshopTabbar({
    super.key,
    required this.tabs
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? EshopColors.black : EshopColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: EshopColors.primaryColor,
        labelColor: dark ? EshopColors.white : EshopColors.primaryColor,
        unselectedLabelColor: EshopColors.darkGrey,
      ),

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(EshopDeviceUtils.getAppBarHeight());
}
