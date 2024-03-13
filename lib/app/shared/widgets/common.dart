import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';
import '../constants/dimens.dart';
import '../extensions/num_extension.dart';

var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
bool isDarkMode = brightness == Brightness.dark;

Widget gapF(double factor) => Gap(Dimensions.normal * factor); // gap with factor
Widget gapN() => const Gap(Dimensions.normal); // gap normal
Widget gapS() => const Gap(Dimensions.small); // gap small
Widget gapL() => const Gap(Dimensions.large); // gap large

Widget divider([double height = 4]) {
  return Divider(
    height: height,
    color: isDarkMode ? white.withAlpha(0.4.opacityToAlpha()) : black.withAlpha(0.4.opacityToAlpha()),
  );
}

Widget widgetByThemeMode({required Widget light, required Widget dark}) {
  return isDarkMode ? dark : light;
}

class NoScrollBarWidget extends StatelessWidget {
  const NoScrollBarWidget({super.key, required this.child, this.padding});
  final Widget child;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}

Widget centerIndicator() => Center(child: CircularProgressIndicator());
