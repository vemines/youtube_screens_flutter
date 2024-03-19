import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/common.dart';
import '../../../../gen/assets.gen.dart';

class CaptionSetting extends StatelessWidget {
  const CaptionSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Caption size and style"),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusBorder.normal),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Assets.jpg.sample.image(),
                Positioned.fill(
                  bottom: Dimensions.normal,
                  child: Align(
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
            ),
            ListTile(
              title: Text("TextSize", style: context.textTheme.bodyLarge),
              subtitle: Text("Normal", style: context.textTheme.bodySmall),
              onTap: () {},
            ),
            divider(),
            ListTile(
              title: Text("Caption Style", style: context.textTheme.bodyLarge),
              subtitle: Text("White on black", style: context.textTheme.bodySmall),
              onTap: () {},
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.all(Dimensions.normal),
              child: Text("Not all apps support these settings", style: context.textTheme.bodyMedium),
            )
          ],
        ),
      ),
    );
  }
}
