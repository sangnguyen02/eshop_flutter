import 'package:flutter/material.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/cart_counter_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';


class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EshopAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(EshopTexts.homeAppbarTitle,
              style: Theme.of(context).textTheme.labelMedium!.apply(color: EshopColors.grey)),
          Text(EshopTexts.homeAppbarSubTitle,
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: EshopColors.white)),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {

          }, iconColor: EshopColors.white,
        ),
      ],
    );
  }
}