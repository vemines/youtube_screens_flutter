import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/all_subscriptions_controller.dart';

class AllSubscriptionsView extends StatefulWidget {
  const AllSubscriptionsView({super.key});

  @override
  State<AllSubscriptionsView> createState() => _AllSubscriptionsViewState();
}

class _AllSubscriptionsViewState extends State<AllSubscriptionsView> {
  final AllSubscriptionsController controller = Get.find<AllSubscriptionsController>();

  @override
  void initState() {
    super.initState();
    controller.loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("All subscriptions"),
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
