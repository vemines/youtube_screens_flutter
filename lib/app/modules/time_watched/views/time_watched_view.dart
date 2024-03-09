import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/common.dart';
import '../controllers/time_watched_controller.dart';

class TimeWatchedView extends GetView<TimeWatchedController> {
  const TimeWatchedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TimeWatched'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.close_outlined),
          ),
        ],
      ),
      body: NoScrollBarWidget(
        child: Container(),
      ),
    );
  }
}
