import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/dimens.dart';

extension ListGutter on List<Widget> {
  List<Widget> separateCenter([double space = Dimensions.normal]) =>
      length <= 1 ? this : sublist(1).expand((element) => [Gap(space), element]).toList()
        ..insert(0, this.first);

  List<Widget> separateAll([double space = Dimensions.normal]) {
    final result = [Gap(space), first];
    for (final element in sublist(1, length)) {
      result.insert(result.length, Gap(space));
      result.add(element);
    }
    result.add(Gap(space));
    return result;
  }
}
