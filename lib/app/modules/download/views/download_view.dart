import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/download_controller.dart';

class DownloadView extends StatefulWidget {
  const DownloadView({super.key});

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
  final DownloadController controller = Get.find<DownloadController>();

  Widget downloadedVideos() => Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "Downloads",
          onBack: () => Get.back(),
          searchOnPressed: () => Get.toNamed(Routes.search),
          moreOnPressed: () {},
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? centerIndicator()
            : controller.downloads.isNotEmpty
                ? NoScrollBarWidget(
                    child: downloadedVideos(),
                  )
                : _EmptyDownloadWidget(),
      ),
    );
  }
}

class _EmptyDownloadWidget extends StatelessWidget {
  const _EmptyDownloadWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
