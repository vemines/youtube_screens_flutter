import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SettingDemoSubRouteView extends StatelessWidget {
  const SettingDemoSubRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.settingDemo),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Sub setting of Setting demo page"),
      ),
    );
  }
}
