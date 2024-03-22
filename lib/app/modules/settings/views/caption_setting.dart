import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/common.dart';

class CaptionSetting extends StatelessWidget {
  const CaptionSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleLeadingBack(
          title: "Caption size and style",
          onBack: () => Get.back(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusBorder.normal),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SampleCaptionImage(),
            ListTile(
              title: Text("TextSize", style: textTheme.bodyLarge),
              subtitle: Text("Normal", style: textTheme.bodySmall),
              onTap: () {},
            ),
            divider(),
            ListTile(
              title: Text("Caption Style", style: textTheme.bodyLarge),
              subtitle: Text("White on black", style: textTheme.bodySmall),
              onTap: () {},
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(Dimensions.normal),
              child: Text("Not all apps support these settings", style: textTheme.bodyMedium),
            )
          ],
        ),
      ),
    );
  }
}

class _SampleCaptionImage extends StatelessWidget {
  const _SampleCaptionImage();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Stack(
      children: [
        Assets.jpg.sample.image(),
        Positioned.fill(
          bottom: Dimensions.normal,
          child: Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Caption will look like this",
              style: textTheme.titleLarge!.copyWith(
                backgroundColor: Colors.black,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
