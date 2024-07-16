import '../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.backgroundColor,
    this.isNetworkingImage = false,
    this.borderRadius = MySize.md,
    this.applyImageRadius = true,
    this.fit = BoxFit.contain,
    required this.imageUrl,
    this.width,
    this.height,
    this.border,
    this.padding,
    this.onPressed,
  });

  final String imageUrl;
  final double? width, height;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkingImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkingImage
                ? NetworkImage(imageUrl)
                : AssetImage(
                    imageUrl,
                  ) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
