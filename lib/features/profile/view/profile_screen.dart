import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/image/circular_image.dart';
import 'package:eshop/common/widgets/texts/section_heading.dart';
import 'package:eshop/utils/constants/image_strings.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../widgets/profile_infor_row.dart';


class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const EshopAppBar(
        showBackArrow: true,
        title: Text('Profile'),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EshopSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const CircularImage(imageUrl: EshopImages.user, width: 80, height: 80),
                    TextButton(
                        onPressed: () {},
                        child: const Text('Change Profile Avatar')
                    ),
                  ],
                ),
              ),

              const SizedBox(height: EshopSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              const SectionHeading(title: 'Profile Information'),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              ProfileInfoRow(title: 'Name', value: 'RickNGX', onPressed: () {}),
              ProfileInfoRow(title: 'Username', value: 'admin', onPressed: () {}),

              const SizedBox(height: EshopSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              const SectionHeading(title: 'Personal Information'),
              const SizedBox(height: EshopSizes.spaceBtwItems),

              ProfileInfoRow(title: 'User ID', value: '000000', icon: Iconsax.copy, onPressed: () {}),
              ProfileInfoRow(title: 'E-mail', value: 'admin@example.com', onPressed: () {}),
              ProfileInfoRow(title: 'Phone Number', value: '+84 352 419 726', onPressed: () {}),
              ProfileInfoRow(title: 'Gender', value: 'Male', onPressed: () {}),
              ProfileInfoRow(title: 'DOB', value: '10 Oct, 1999', onPressed: () {}),

              
            ],
          ),
        ),
      ),
    );
  }
}

