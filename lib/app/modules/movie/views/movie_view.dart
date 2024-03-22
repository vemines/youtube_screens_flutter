import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/common.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../controllers/movie_controller.dart';

class MovieView extends GetView<MovieController> {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "",
          onBack: () => Get.back(),
          searchOnPressed: () => Get.toNamed(Routes.search),
          moreOnPressed: () {},
          firstActionIconButton: IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam_outlined),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.normal),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: _ContentSection(),
        ),
      ),
      bottomNavigationBar: BottomNavibarNoSelected(),
    );
  }
}

List<Widget> _emptyOrLoadingCentered(bool isEmpty) => [
      Spacer(),
      isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.png.yourVideo.image(),
                  Text("Share your video with anyone, or everyone."),
                  FilledButton(onPressed: () {}, child: Text("Create")),
                ].separateCenter(),
              ),
            )
          : centerIndicator(),
      Spacer(),
    ];

class _ContentSection extends GetView<MovieController> {
  const _ContentSection();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Movies",
                style: context.textTheme.headlineLarge,
              ),
              gapN(),
              _RowActionChip(),
            ],
          ),
          if (controller.currentState.value == CurrentState.LOADING) ..._emptyOrLoadingCentered(false),
          if (controller.currentState.value == CurrentState.VIDEOS)
            if (controller.listVideos.isEmpty)
              ..._emptyOrLoadingCentered(true)
            else
              Flexible(
                child: ListView.builder(
                  itemCount: controller.listVideos.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(controller.listVideos[index].toString()),
                    onTap: () {},
                  ),
                ),
              ),
          if (controller.currentState.value == CurrentState.SHORTS)
            if (controller.listShorts.isEmpty)
              ..._emptyOrLoadingCentered(true)
            else
              Flexible(
                child: ListView.builder(
                  itemCount: controller.listShorts.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(controller.listShorts[index].toString()),
                    onTap: () {},
                  ),
                ),
              ),
          if (controller.currentState.value == CurrentState.LIVES)
            if (controller.listLives.isEmpty)
              ..._emptyOrLoadingCentered(true)
            else
              Flexible(
                child: ListView.builder(
                  itemCount: controller.listLives.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(controller.listLives[index].toString()),
                    onTap: () {},
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

class _RowActionChip extends GetView<MovieController> {
  const _RowActionChip();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionChip(
          label: Icon(Icons.tune),
          onPressed: () {},
        ),
        ActionChip(
          label: Text("Video"),
          onPressed: () => controller.loadVideos(),
        ),
        ActionChip(
          label: Text("Shorts"),
          onPressed: () => controller.loadShorts(),
        ),
        ActionChip(
          label: Text("Lives"),
          onPressed: () => controller.loadLives(),
        ),
      ].separateCenter(),
    );
  }
}
