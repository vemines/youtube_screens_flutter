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
              _SponsorBlockDemo(),
              divider(),
              _DialogSelectOptionDemo(),
              divider(),
              _DialogSelectAccountDemo(),
              divider(),
            ].separateCenter(),
          ),
        ),
      ),
    );
  }
}

class _SponsorBlockDemo extends GetView<SettingsController> {
  const _SponsorBlockDemo();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeData theme = context.theme;
    return ListTile(
      title: Row(
        children: [
          Badge(
            backgroundColor: theme.primaryColor,
            smallSize: BadgeSize.sponsorBlock,
          ),
          gapS(),
          Text("Title of Sponsor Block", style: textTheme.bodyLarge),
        ],
      ),
      subtitle: Text(
        lorem(paragraphs: 1, words: 20),
        style: textTheme.bodyMedium,
      ),
      onTap: () => openSponsorBlockDialog(context,
          onClose: controller.cancelSbStatus,
          onSave: controller.saveSbStatus,
          content: [
            ...sponsorBlockStatusName.entries.map(
              (e) => Obx(
                () => RadioListTile<SponsorBlockStatus>(
                  value: e.key,
                  groupValue: controller.sbStatusDemo.value,
                  onChanged: controller.changeSbStatusDemo,
                  title: Text(sponsorBlockStatusName[e.key].toString()),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Color:", style: textTheme.bodyLarge),
                gapN(),
                Badge(
                  backgroundColor: theme.primaryColor,
                  smallSize: BadgeSize.sponsorBlockDialog,
                ),
                gapN(),
                Flexible(
                  child: TextField(
                    controller: TextEditingController(text: "#0202ED"),
                  ),
                ),
              ],
            )
          ]),
    );
  }
}

class _DialogSelectAccountDemo extends StatelessWidget {
  const _DialogSelectAccountDemo();

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => openSelectAcountDialog(
        context,
      ),
      child: Text("Open select account dialog"),
    );
  }
}

class _DialogSelectOptionDemo extends GetView<SettingsController> {
  const _DialogSelectOptionDemo();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return FilledButton(
      onPressed: () => openSelectOptionDialog(
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
      child: Text("Open select option dialog"),
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
            title: Text(lorem(paragraphs: 1, words: 3),
                style: textTheme.bodyLarge),
            contentPadding: EdgeInsets.zero,
            onChanged: controller.changeSwitchSetting,
          ),
        ],
      ),
    );
  }
}
