import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:eshop/common/widgets/list_tiles/setting_tile.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/providers/features/setting/setting_provider.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/list_tiles/user_profile_tile.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(settingViewModelProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            PrimaryHeaderContainer(
                child: Column(
              children: [
                EshopAppBar(
                  title: Text(
                      'Setting',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: EshopColors.white)),
                ),
                const SizedBox(height: EshopSizes.spaceBtwItems / 2),
                UserProfileTile(
                  username: 'Rick',
                  email: 'rickngx@gmail.com',
                  avatar: EshopImages.user,
                  onPressed: () {
                    vm.router.push('/profile');
                  },
                ),
                const SizedBox(height: EshopSizes.spaceBtwSections)
              ],
            )),

            /// Body
            Padding(
              padding: const EdgeInsets.all(EshopSizes.defaultSpace),
              child: Column(
                children: [
                  const SectionHeading(title: 'Account Settings'),
                  const SizedBox(height: EshopSizes.spaceBtwItems),

                  /// Account Settings
                  ProfileSettingsTile(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subtitle: 'Set shopping delivery address',
                      onTap: () => vm.router.push('/user-address')),
                  ProfileSettingsTile(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subtitle: 'Add, remove products and move to checkout',
                      onTap: () {}),
                  ProfileSettingsTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subtitle: 'In-progress and Completed Orders',
                      onTap: () => vm.router.push('/orders')),
                  ProfileSettingsTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to registered bank account',
                      onTap: () {}),
                  ProfileSettingsTile(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subtitle: 'List of all discounted coupons',
                      onTap: () {}),
                  ProfileSettingsTile(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Set any kind of notification message',
                      onTap: () {}),
                  ProfileSettingsTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and data connection',
                      onTap: () {}),

                  /// App Settings
                  const SizedBox(height: EshopSizes.spaceBtwSections),
                  const SectionHeading(title: 'App Settings'),
                  const SizedBox(height: EshopSizes.spaceBtwItems),
                  ProfileSettingsTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subtitle: 'Upload Data to your Cloud Firebase',
                      onTap: () {}),
                  ProfileSettingsTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(
                        activeColor: EshopColors.primaryColor,
                        value: true,
                        onChanged: (value) {}),
                  ),
                  ProfileSettingsTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(
                        activeColor: EshopColors.primaryColor,
                        value: false,
                        onChanged: (value) {}),
                  ),
                  ProfileSettingsTile(
                    icon: Iconsax.security_user,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to seen',
                    trailing: Switch(
                        activeColor: EshopColors.primaryColor,
                        value: false,
                        onChanged: (value) {}),
                  ),

                  const SizedBox(height: EshopSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () async {
                          await vm.signOut();
                        },
                        child: const Text('Sign Out')),
                  ),
                  const SizedBox(height: EshopSizes.spaceBtwSections * 1.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
