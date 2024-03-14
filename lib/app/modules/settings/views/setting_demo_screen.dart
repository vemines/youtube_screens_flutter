import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import '../../../routes/app_pages.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.settings),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Setting all components"),
      ),
      body: NoScrollBarWidget(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
