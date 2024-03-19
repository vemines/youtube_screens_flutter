import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/name_controller.dart';

class NameView extends StatefulWidget {
  const NameView({super.key});

  @override
  State<NameView> createState() => _NameViewState();
}

class _NameViewState extends State<NameView> {
  final NameController controller = Get.find<NameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Name"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ].separateCenter(),
      ),
      body: Obx(
        () => controller.isLoading.value ? centerIndicator() : Container(),
      ),
    );
  }
}
