import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleLeadingBack(
          title: "Settings",
          onBack: () => Get.back(),
        ),
      ),
      body: NoScrollBarWidget(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: (availabelSettings
                  .map(
                    (e) => ListTile(
                      title: Text(e["title"], style: textTheme.bodyLarge),
                      subtitle: e["subtitle"] == null
                          ? null
                          : Text(
                              e["subtitle"],
                              style: textTheme.bodySmall,
                            ),
                      onTap: e["onTap"],
                    ),
                  )
                  .toList())
              .separateCenter(Dimensions.small),
        ),
      ),
    );
  }
}
