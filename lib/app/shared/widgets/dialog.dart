import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import 'package:youtube_screens/gen/assets.gen.dart';

import '../constants/dimens.dart';

Future<void> openSelectOptionDialog(
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

Future<void> openSelectAcountDialog(
  BuildContext context,
) {
  final textTheme = context.textTheme;
  final theme = context.theme;
  return Get.dialog(
    AlertDialog(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Dialog Title"),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      titlePadding: EdgeInsets.all(Dimensions.normal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusBorder.normal),
      ),
      backgroundColor: theme.colorScheme.background,
      content: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: EdgeInsets.all(Dimensions.normal),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("VeMines", style: textTheme.bodyLarge),
              Text("VeMines@outlook.com", style: textTheme.bodySmall),
              gapS(),
              divider(),
              gapSM(),
              noSplashInkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Assets.png.coffee
                        .image(width: ImageSize.selectAcountDialog),
                    gapN(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("VeMines", style: textTheme.bodyLarge),
                        Text("@VeMines1234", style: textTheme.bodySmall),
                        Text("No subcribers", style: textTheme.bodySmall),
                        gapS(),
                        noSplashInkWell(
                          onTap: () {},
                          child: Text(
                            "Edit channel",
                            style: textTheme.labelLarge!
                                .copyWith(color: theme.primaryColor),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Center(
                      child: Icon(Icons.check, color: theme.primaryColor),
                    ),
                  ],
                ),
              ),
              gapN(),
              divider(),
              gapN(),
              Text("Other accounts", style: textTheme.titleLarge),
              gapS(),
              Text("VeMines@outlook.com", style: textTheme.bodySmall),
              gapS(),
              noSplashInkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Assets.png.coffee
                        .image(width: ImageSize.selectAcountDialog),
                    gapN(),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("VeMines", style: textTheme.bodyLarge),
                        Text("No subcribers", style: textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
              gapN(),
              divider(),
              gapN(),
              noSplashInkWell(
                  child: Text(
                    "Manage account",
                    style: textTheme.bodySmall!.copyWith(fontSize: 16),
                  ),
                  onTap: () {}),
              gapL(),
              noSplashInkWell(
                child: Text(
                  "Learn more about account options",
                  style:
                      textTheme.bodyLarge!.copyWith(color: theme.primaryColor),
                ),
                onTap: () {},
              )
            ],
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
    ),
  );
}

Future<void> openSponsorBlockDialog(BuildContext context,
    {required Function onClose,
    required Function onSave,
    required List<Widget> content}) {
  final theme = context.theme;
  final textTheme = context.textTheme;
  return Get.dialog(
    AlertDialog(
      title: Text("Title of Sponsor Block"),
      titlePadding: EdgeInsets.all(Dimensions.normal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusBorder.normal),
      ),
      backgroundColor: theme.colorScheme.background,
      actionsPadding: EdgeInsets.fromLTRB(
        Dimensions.normal,
        Dimensions.normal,
        Dimensions.normal,
        Dimensions.small,
      ),
      content: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        padding: EdgeInsets.all(Dimensions.normal),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: content,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.normal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              noSplashInkWell(
                child: Text("OK", style: textTheme.bodyLarge),
                onTap: () {
                  Get.back();
                  onSave();
                },
              ),
              gapL(),
              noSplashInkWell(
                child: Text("CANCEL", style: textTheme.bodyLarge),
                onTap: () {
                  Get.back();
                  onClose();
                },
              ),
              gapL(),
              noSplashInkWell(
                child: Text("RESET COLOR", style: textTheme.bodyLarge),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    ),
  );
}
