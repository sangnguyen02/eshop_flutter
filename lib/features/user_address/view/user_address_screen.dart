import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/common/widgets/list_tiles/address_tile.dart';
import 'package:eshop/providers/features/user_address/user_address_provider.dart';
import 'package:eshop/utils/constants/colors.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends ConsumerWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(userAddressViewModelProvider);
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: EshopColors.primaryColor,
        onPressed: () => vm.router.push('/user-address/add'),
        child: const Icon(Iconsax.add, color: EshopColors.white),
      ),
      appBar: EshopAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(EshopSizes.defaultSpace),
          child: Column(
            children: [
              AddressTile(selectedAddress: true),
              AddressTile(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
