import 'package:eshop/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class EshopChoiceChip extends StatelessWidget {
  const EshopChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected
  });


  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = EshopHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? EshopColors.white : null),
        avatar: isColor ? CircularContainer(width: 50, height: 50, backgroundColor: EshopHelperFunctions.getColor(text)!) : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? EshopHelperFunctions.getColor(text)! : null,
      ),
    );
  }
}
