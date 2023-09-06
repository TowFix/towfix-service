import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  IconThemeData get iconTheme => Theme.of(this).iconTheme;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  NavigatorState get navigator => Navigator.of(this);

  // Color get primaryColor => Theme.of(this).primaryColor;

  // Brightness get brightness => Theme.of(this).brightness;

  // bool get isDark => Theme.of(this).brightness == Brightness.dark;

  // bool get isLight => Theme.of(this).brightness == Brightness.light;

  // bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  // bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  // double get width => mediaQuery.size.width;

  // double get height => mediaQuery.size.height;

  // double get textScaleFactor => mediaQuery.textScaleFactor;

  // double get pixelRatio => mediaQuery.devicePixelRatio;

  // EdgeInsets get padding => mediaQuery.padding;

  // EdgeInsets get viewInsets => mediaQuery.viewInsets;

  // EdgeInsets get viewPadding => mediaQuery.viewPadding;

  // double get viewPaddingTop => mediaQuery.viewPadding.top;

  // double get viewPaddingBottom => mediaQuery.viewPadding.bottom;

  // double get viewPaddingLeft => mediaQuery.viewPadding.left;

  // double get viewPaddingRight => mediaQuery.viewPadding.right;

  // double get viewInsetsTop => mediaQuery.viewInsets.top;

  // double get viewInsetsBottom => mediaQuery.viewInsets.bottom;

  // double get viewInsetsLeft => mediaQuery.viewInsets.left;

  // double get viewInsetsRight => mediaQuery.viewInsets.right;

  // double get viewInsetsHorizontal => viewInsetsLeft + viewInsetsRight;

  // double get viewInsetsVertical => viewInsetsTop + viewInsetsBottom;

  // double get viewPaddingHorizontal => viewPaddingLeft + viewPaddingRight;

  // double get viewPaddingVertical => viewPaddingTop + viewPaddingBottom;

  // double get viewInsetsWidth => width - viewInsetsHorizontal;

  // double get viewInsetsHeight => height - viewInsetsVertical;

  // double get viewPaddingWidth => width - viewPaddingHorizontal;

  // double get viewPaddingHeight => height - viewPaddingVertical;

  // double get viewInsetsWidthPercent => viewInsetsWidth / width;

  // double get viewInsetsHeightPercent => viewInsetsHeight / height;

  // double get viewPaddingWidthPercent => viewPaddingWidth / width;

  // double get viewPaddingHeightPercent => viewPaddingHeight / height;

  // double get widthPercent => width / 100;

  // double get heightPercent => height / 100;

  // double get viewInsetsWidthPercentOfScreen => viewInsetsWidth / widthPercent;

  // double get viewInsetsHeightPercentOfScreen => viewInsetsHeight / heightPercent;

  // double get viewPaddingWidthPercentOfScreen => viewPaddingWidth / widthPercent;

  // double get viewPaddingHeightPercentOfScreen => viewPaddingHeight / heightPercent;

  // double get viewInsetsWidthPercentOfScreenWithoutSafeArea =>
  //     viewInsetsWidth / (widthPercent - viewPaddingWidthPercent);

  void showSnackBar(Widget snackBar) {
    ScaffoldMessenger.of(this).removeCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        padding: const EdgeInsets.only(top: 20),
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: snackBar,
      ),
    );
  }
}

extension ContextThemeColors on BuildContext {
  Color get textColor => Theme.of(this).textTheme.bodyLarge!.color!;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get accentColor => Theme.of(this).colorScheme.secondary;

  Color get displayColor => Theme.of(this).textTheme.displaySmall!.color!;

  Color get hintColor => Theme.of(this).hintColor;

  Color get disableColor => Theme.of(this).disabledColor;

  Color get backgroundColor => Theme.of(this).colorScheme.background;

  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
}

extension ContextTextStylesX on BuildContext {
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;

  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;

  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;

  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;
}
