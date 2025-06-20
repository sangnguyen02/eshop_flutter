import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddUserAddressScreen extends StatelessWidget {
  const AddUserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EshopAppBar(
        showBackArrow: true,
        title: Text('Add new Address')
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(EshopSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                const SizedBox(height: EshopSizes.spaceBtwInputField),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: EshopSizes.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    const SizedBox(width: EshopSizes.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: 'Postal Code',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: EshopSizes.spaceBtwInputField),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: 'City',
                        ),
                      ),
                    ),
                    const SizedBox(width: EshopSizes.spaceBtwInputField),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: EshopSizes.spaceBtwInputField),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: 'Country',
                  ),
                ),
                const SizedBox(height: EshopSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: const Text('Save')),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}
