import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../utils/cache_manager/cache_manager.dart';
import '../../../utils/http/http_client.dart';



class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    this.borderRadius = EshopSizes.md,
    required this.image,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.fill,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
  });

  final double? width, height;
  final double borderRadius;
  final String image;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {

    final String baseUrl = EshopHttpHelper.baseUrl;

    final imageUrl = isNetworkImage ? '$baseUrl/$image' : image;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          // child: Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider),
          child: isNetworkImage
              ? CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
            cacheManager: EshopCacheManager.imageCacheManager,
          )
              : Image(
            fit: fit,
            image: AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
