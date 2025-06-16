import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';

class EshopFormDivider extends StatelessWidget {
  const EshopFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = EshopHelperFunctions.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? EshopColors.darkGrey : EshopColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
        Text(EshopTexts.orSignInWith, style: Theme.of(context).textTheme.labelMedium),
        Flexible(child: Divider(color: dark ? EshopColors.darkGrey : EshopColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
      ],
    );
  }
}
