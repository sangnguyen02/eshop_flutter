import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../models/product/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final isDiscounted = product.discountPrice > 0 && product.discountPrice < product.price;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(EshopSizes.cardRadiusMd)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(EshopSizes.cardRadiusMd)),
            child: Stack(
              children: [
                Image.network(
                  product.imageUrls.isNotEmpty ? product.imageUrls[0] : 'https://via.placeholder.com/150',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 120,
                    color: EshopColors.grey,
                    child: const Icon(Icons.error),
                  ),
                ),
                if (product.status != 'active')
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: EshopColors.error,
                      child: Text(
                        product.status == 'out_of_stock' ? 'Out of Stock' : 'Inactive',
                        style: const TextStyle(color: EshopColors.white, fontSize: EshopSizes.fontSizeSm),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(EshopSizes.xs), // Giảm từ sm (8) xuống xs (4)
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name
                Text(
                  product.name,
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1, // Giới hạn 1 dòng
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: EshopSizes.xs),

                // Price
                Row(
                  children: [
                    Text(
                      '\$${isDiscounted ? product.discountPrice.toStringAsFixed(2) : product.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: EshopColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (isDiscounted)
                      Padding(
                        padding: const EdgeInsets.only(left: EshopSizes.xs),
                        child: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: EshopColors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: EshopSizes.xs), // Giảm từ sm xuống xs

                // Add to Cart Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: product.status == 'active' && product.stockQuantity > 0 ? onAddToCart : null,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: EshopSizes.xs),
                      textStyle: const TextStyle(fontSize: EshopSizes.fontSizeSm),
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}