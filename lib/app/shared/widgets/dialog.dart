import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/dimens.dart';

Future<void> openSelectDialog(
  BuildContext context, {
  required String title,
  required List<Widget> options,
}) {
  final textTheme = context.textTheme;
  final colorScheme = context.theme.colorScheme;
  return Get.dialog(
    AlertDialog(
      title: Text("Dialog Title"),
      titlePadding: EdgeInsets.all(Dimensions.normal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusBorder.normal),
      ),
      backgroundColor: colorScheme.background,
      actionsPadding: EdgeInsets.fromLTRB(
        Dimensions.normal,
        0,
        Dimensions.normal,
        Dimensions.small,
      ),
      content: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: options,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      actions: [
        TextButton(
          child: Text("Cancel", style: textTheme.labelLarge),
          style: TextButton.styleFrom().copyWith(
            padding: MaterialStatePropertyAll(
              EdgeInsets.all(Dimensions.large),
            ),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(RadiusBorder.small),
            )),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}
