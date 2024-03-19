import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
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
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.settings),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Setting all components"),
      ),
      body: Obx(() => NoScrollBarWidget(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.normal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
          )),
    );
  }
}
