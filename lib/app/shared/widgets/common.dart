import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';
import '../constants/dimens.dart';
import '../extension/num_extension.dart';

Widget gapF(double factor) => Gap(Dimensions.normal * factor); // gap with factor
Widget gapN() => const Gap(Dimensions.normal); // gap normal
Widget gapS() => const Gap(Dimensions.small); // gap small
Widget gapL() => const Gap(Dimensions.large); // gap large

Widget divider([double height = 4]) {
  var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
  return Divider(
    height: height,
    color: isDarkMode ? white.withAlpha(0.4.opacityToAlpha()) : black.withAlpha(0.4.opacityToAlpha()),
  );
}

class NoScrollBarWidget extends StatelessWidget {
  const NoScrollBarWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(child: child),
    );
  }
}

Widget centerIndicator() => Center(child: CircularProgressIndicator());
