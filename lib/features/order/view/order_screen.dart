import 'package:eshop/common/widgets/appbar/appbar.dart';
import 'package:eshop/features/order/widgets/order_list_items.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: EshopAppBar(
        showBackArrow: true,
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(EshopSizes.defaultSpace),
        child: OrderListItems()
      ),
    );
  }
}
