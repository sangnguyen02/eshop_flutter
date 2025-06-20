import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';


class VerticalImageText extends StatelessWidget{

  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.textColor =  EshopColors.white,
    this.showTitle = false,
    this.onTap,

  });

  final String image, title;
  final Color? backgroundColor;
  final Color? textColor;
  final bool showTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
          child:  Column(
            children: [
              Container(
                width: 88,
                height: 64,
                decoration: BoxDecoration(
                  color: EshopColors.white,
                  borderRadius:
                  BorderRadius.circular(EshopSizes.cardRadiusMd),
                ),
                child: Center(

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(EshopSizes.cardRadiusMd),
                    child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
              showTitle
                  ? const SizedBox(height: EshopSizes.xs)
                  : const SizedBox.shrink(),
              showTitle
                  ? Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: EshopColors.white),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
                  : const SizedBox.shrink(),
            ],
          ),

      ),
    );


  }
}


