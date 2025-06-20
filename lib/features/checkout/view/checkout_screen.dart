import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:eshop/features/cart/widgets/product_cart_list.dart';
import 'package:eshop/features/checkout/widgets/billing_address_section.dart';
import 'package:eshop/features/checkout/widgets/billing_payment_section.dart';
import 'package:eshop/providers/features/checkout/checkout_provider.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/constants/text_strings.dart';
import 'package:eshop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constants/image_strings.dart';
import '../../../utils/device/device_utility.dart';
import '../widgets/billing_amount_section.dart';
import '../widgets/coupon_section.dart';

class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(checkoutViewModelProvider);
    final dark = EshopHelperFunctions.isDarkMode(context);
    final bottomNavbar = EshopDeviceUtils.getBottomNavigationBarHeight();
    return Scaffold(
      appBar: EshopAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EshopSizes.defaultSpace),
          child: Column(
            children: [
              /// Items in Cart
              const ProductCartList(showAddRemoveButton: false),
              const SizedBox(height: EshopSizes.spaceBtwSections),

              /// Coupons Section
              const CouponSection(),
              const SizedBox(height: EshopSizes.spaceBtwSections),

              /// Billing Section
              RoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(EshopSizes.md),
                backgroundColor: dark ? EshopColors.black : EshopColors.white,
                child: const Column(
                  children: [
                    /// Price
                    BillingAmountSection(),
                    SizedBox(height: EshopSizes.spaceBtwItems),
                    /// Divider
                    Divider(),
                    SizedBox(height: EshopSizes.spaceBtwItems),
                    /// PaymentMethod
                    BillingPaymentSection(),
                    SizedBox(height: EshopSizes.spaceBtwItems),

                    /// Address
                    BillingAddressSection(),
                    SizedBox(height: EshopSizes.spaceBtwItems),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: EshopSizes.defaultSpace, right: EshopSizes.defaultSpace, bottom: bottomNavbar),
        child: ElevatedButton(
          onPressed: () => vm.router.go('/payment-success?image=${Uri.encodeQueryComponent(EshopImages.paymentSuccess)}&title=${Uri.encodeQueryComponent(EshopTexts.paymentTitle)}&subTitle=${Uri.encodeQueryComponent(EshopTexts.paymentSubTitle)}'),
          child: const Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}

