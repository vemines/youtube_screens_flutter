import '../constants/dimens.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension ListGutter on List<Widget> {
  List<Widget> separateCenter([double space = Dimensions.normal]) =>
      length <= 1 ? this : sublist(1).expand((element) => [Gap(space), element]).toList();

  List<Widget> separateAll([double space = Dimensions.normal]) {
    final result = [Gap(space), first];
    for (final element in sublist(1, length - 1)) {
      result.insert(result.length, Gap(space));
      result.add(element);
    }
    result.add(Gap(space));
    result.add(last);
    return result;
  }
}
