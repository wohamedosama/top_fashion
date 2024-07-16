import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class SpacingStyle {
  static EdgeInsetsGeometry paddingWithAppBarHeight = const EdgeInsets.only(
    top: MySize.appBarHeight,
    left: MySize.defaultSpace,
    right: MySize.defaultSpace,
    bottom: MySize.defaultSpace,
  );
}
