import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/common.dart';
import '../../../../gen/assets.gen.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/download_controller.dart';

class DownloadView extends StatefulWidget {
  const DownloadView({super.key});

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
  final DownloadController controller = Get.find<DownloadController>();

  @override
  void initState() {
    super.initState();
    controller.loading();
  }

  Widget downloadedVideos() => Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Downloads"),
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
        () => controller.isLoading.value
            ? centerIndicator()
            : controller.downloads.isNotEmpty
                ? NoScrollBarWidget(
                    child: downloadedVideos(),
                  )
                : Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.png.download.image(),
                        Text(
                          "Videos you download will appear here",
                          style: context.textTheme.bodySmall,
                        ),
                      ].separateCenter(),
                    ),
                  ),
      ),
    );
  }
}
