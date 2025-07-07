import 'package:eshop/common/widgets/error_handler/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import  'package:flutter/material.dart';
import '../../../providers/features/home/home_provider.dart';
import 'home_categories.dart';

class CategorySection extends ConsumerWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(homeViewModelProvider.select((state) => state.categories));
    final showRetry = ref.watch(homeViewModelProvider.select((state) => state.showCategoryRetry));
    final vmNotifier = ref.read(homeViewModelProvider.notifier);

    return categories.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => ErrorHandler(
        height: 96,
        errorMessage: error.toString(),
        showRetry: showRetry,
        onRetryPressed: vmNotifier.reloadCategories,
      ),
      data: (cats) => HomeCategories(categories: cats),
    );
  }
}