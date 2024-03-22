import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/appbar.dart';

class SettingDemoSubRouteView extends StatelessWidget {
  const SettingDemoSubRouteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleLeadingBack(
          title: "Sub setting Navigator Demo",
          onBack: () => Get.back(),
        ),
      ),
    );
  }
}
