import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/http/http_client.dart';
import 'package:flutter/material.dart';
import '../../../utils/cache_manager/cache_manager.dart';
import '../../../utils/constants/colors.dart';


class VerticalImageText extends StatelessWidget{

  const VerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.backgroundColor,
    this.textColor =  EshopColors.white,
    this.showTitle = false,
    this.onTap,
    this.isNetworkImage = false,
  });

  final String image, title;
  final Color? backgroundColor;
  final Color? textColor;
  final bool showTitle;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {

    final String baseUrl = EshopHttpHelper.baseUrl;
    final imageUrl = isNetworkImage ? '$baseUrl/$image' : image;


    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
          child:  Column(
            children: [
              Container(
                width: 88,
                height: 64,
                decoration: BoxDecoration(
                  color: EshopColors.white,
                  borderRadius:
                  BorderRadius.circular(EshopSizes.cardRadiusMd),
                ),
                child: Center(

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(EshopSizes.cardRadiusMd),
                    // child: Image(
                    //   image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(image) as ImageProvider,
                    //   fit: BoxFit.fill,
                    //   errorBuilder: (context, error, stackTrace) {
                    //     print("Image load error: $error for URL: $imageUrl");
                    //     return const Icon(Icons.error);
                    //   },
                    //   loadingBuilder: (context, child, loadingProgress) {
                    //     if (loadingProgress == null) return child;
                    //     return Center(
                    //       child: CircularProgressIndicator(
                    //         value: loadingProgress.expectedTotalBytes != null
                    //             ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                    //             : null,
                    //       ),
                    //     );
                    //   },
                    // ),

                    child: isNetworkImage
                        ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) {
                        debugPrint('Image load error: $error for URL: $imageUrl');
                        return const Icon(Icons.error);
                      },
                      cacheManager: EshopCacheManager.imageCacheManager,
                    )
                        : Image(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        debugPrint('Asset image load error: $error for $imageUrl');
                        return const Icon(Icons.error);
                      },
                    ),
                  ),
                ),
              ),
              showTitle
                  ? const SizedBox(height: EshopSizes.xs)
                  : const SizedBox.shrink(),
              showTitle
                  ? Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: EshopColors.white),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
                  : const SizedBox.shrink(),
            ],
          ),

      ),
    );


  }
}


