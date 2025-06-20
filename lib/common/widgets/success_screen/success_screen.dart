import 'package:eshop/common/styles/spacing_style.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed
  });


  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EshopSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Image(
                image: AssetImage(image),
                width: EshopHelperFunctions.screenWidth(context) * 0.6
              ),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: EshopSizes.spaceBtwSections),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed,
                    child: const Text('Continue')
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}
