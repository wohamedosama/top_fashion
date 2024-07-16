import '../../../../extensions/media_query_extension.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

// ignore: must_be_immutable
class SearchBarWidget extends StatelessWidget {
  Function(String)? onChanged;

  SearchBarWidget({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: context.getDefaultSize() * 2)),
      leading: Padding(
        padding: EdgeInsets.only(right: context.getWidth(divide: 0.009)),
        child: Icon(
          Icons.search,
          color: Colors.black,
          size: context.getDefaultSize() * 2.5,
        ),
      ),
      hintText: "Search",
      hintStyle: WidgetStatePropertyAll(TextStyle(
          color: AppColors.subTitleColor,
          fontSize: context.getDefaultSize() * 2)),
      elevation: const WidgetStatePropertyAll(0),
      padding: WidgetStatePropertyAll(
          EdgeInsets.all(context.getHight(divide: 0.013))),
      backgroundColor: const WidgetStatePropertyAll(AppColors.backgroundColor),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(context.getHight(divide: 0.01))))),
      onChanged: onChanged!,
    );
  }
}
