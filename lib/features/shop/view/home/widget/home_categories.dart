import '../../../model/cubit/category_cubit/category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widget/image_text/vertical_image_text.dart';
import '../../../../../utils/constants/images_string.dart';
import 'package:flutter/material.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 11,
              itemBuilder: (_, index) {
                return VerticalImageText(
                  onTap: () {},
                  title: 'T-Shirt ',
                  image: MyImages.sportIcon,
                );
              },
            ),
          );
        }
        if (state is CategoriesSuccessState) {
          return SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (_, index) {
                return VerticalImageText(
                  onTap: () {},
                  title: state.categories[index].name!,
                  image: MyImages.shirtIcon,
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
