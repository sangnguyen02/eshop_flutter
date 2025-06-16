import 'package:flutter/material.dart';
import '../../utils/constants/sizes.dart';

class EshopSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: EshopSizes.appBarHeight,
    left: EshopSizes.defaultSpace,
    bottom: EshopSizes.defaultSpace,
    right: EshopSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry paddingWithoutAppBarHeight = EdgeInsets.only(
    top: EshopSizes.defaultSpace,
    left: EshopSizes.defaultSpace,
    bottom: EshopSizes.defaultSpace,
    right: EshopSizes.defaultSpace,
  );
}