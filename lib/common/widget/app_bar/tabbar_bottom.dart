import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TabBarBottom extends StatelessWidget implements PreferredSize {
  const TabBarBottom({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunction.isDark(context);
    return TabBar(
      indicatorColor: MyColors.primary,
      isScrollable: true,
      physics: const BouncingScrollPhysics(),
      labelColor: dark ? MyColors.white : MyColors.primary,
      tabs: tabs,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
