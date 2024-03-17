import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/common.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final SettingsController controller = Get.find<SettingsController>();
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
        title: Text("Settings"),
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
