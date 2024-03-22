import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/common.dart';
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
            ],
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
            "Radio List title demo",
            style: textTheme.bodyLarge!.copyWith(fontSize: 18),
          ),
          gapN(),
          ...controller.radioOptions.map(
            (e) => RadioListTile<String>(
              value: e,
              title: Text(e, style: textTheme.bodyLarge),
              groupValue: controller.radioSelected.value,
              contentPadding: EdgeInsets.zero,
              onChanged: (s) => controller.changeRadioSelected(s),
            ),
          ),
        ],
      ),
    );
  }
}
