import 'package:eshop/utils/constants/sizes.dart';
import 'package:eshop/utils/http/http_client.dart';
import 'package:flutter/material.dart';
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
                    child: Image(
                      image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(image) as ImageProvider,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        print("Image load error: $error for URL: $imageUrl"); // Debug lỗi
                        return const Icon(Icons.error);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
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


