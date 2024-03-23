import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:get/get.dart';

import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/common.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/dialog.dart';
import '../controllers/settings_controller.dart';

class SettingDemoView extends StatefulWidget {
  const SettingDemoView({super.key});

  @override
  State<SettingDemoView> createState() => _SettingDemoViewState();
}

class _SettingDemoViewState extends State<SettingDemoView> {
  final SettingsController controller = Get.find<SettingsController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleLeadingBack(
          title: "Setting demo components",
          onBack: () => Get.back(),
        ),
      ),
      body: NoScrollBarWidget(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.normal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RadioListTileDemo(),
              divider(),
              _SwitchListTileDemo(),
              divider(),
              FilledButton(
                onPressed: () => openSelectDialog(
                  context,
                  title: "Select one",
                  options: controller.options
                      .map((e) => RadioListTile<int>(
                            value: e,
                            title: Text(e.toString(), style: textTheme.bodyLarge),
                            groupValue: controller.dialogSelect,
                            onChanged: (i) {
                              controller.changeDialogSelect(i);
                              Get.back();
                            },
                          ))
                      .toList(),
                ),
                child: Text("Open openScrollDialog"),
              ),
              divider(),
            ].separateCenter(),
          ),
        ),
      ),
    );
  }
}

class _RadioListTileDemo extends GetView<SettingsController> {
  const _RadioListTileDemo();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Radio ListTile demo",
            style: textTheme.bodyLarge!.copyWith(fontSize: 18),
          ),
          gapN(),
          ...controller.radioOptions.map(
            (e) => RadioListTile<String>(
              value: e,
              title: Text(e, style: textTheme.bodyLarge),
              groupValue: controller.radioSetting.value,
              contentPadding: EdgeInsets.zero,
              onChanged: controller.changeRadioSetting,
            ),
          ),
        ],
      ),
    );
  }
}

class _SwitchListTileDemo extends GetView<SettingsController> {
  const _SwitchListTileDemo();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Switch ListTile demo",
            style: textTheme.bodyLarge!.copyWith(fontSize: 18),
          ),
          gapN(),
          SwitchListTile(
            value: controller.switchSetting.value,
            title: Text(lorem(paragraphs: 1, words: 3), style: textTheme.bodyLarge),
            contentPadding: EdgeInsets.zero,
            onChanged: controller.changeSwitchSetting,
          ),
        ],
      ),
    );
  }
}
