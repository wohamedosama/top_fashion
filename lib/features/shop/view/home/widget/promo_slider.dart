import 'package:carousel_slider/carousel_slider.dart';
import '../../../../../common/widget/custom_shapes/container/circular_container.dart';
import '../../../../../common/widget/image/round_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import 'package:flutter/material.dart';

// import 'package:flutter/src/material/carousel.dart';  // Remove this line

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.banners});

  final int initialPage = 0;
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url) => RoundedImage(imageUrl: url)).toList(),
          options: CarouselOptions(
            onPageChanged: (index, _) {
              initialPage == index;
            },
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
          ),
        ),
        const SizedBox(
          height: MySize.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              CircularContainer(
                margin: const EdgeInsets.only(right: 10),
                width: 20,
                height: 4,
                backgroundColor:
                    initialPage == i ? MyColors.primary : Colors.grey,
              ),
          ],
        ),
      ],
    );
  }
}
