import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import 'package:youtube_screens/gen/assets.gen.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/fake_bottom_nav.dart';
import '../controllers/my_movie_controller.dart';

class MyMovieView extends StatefulWidget {
  const MyMovieView({super.key});

  @override
  State<MyMovieView> createState() => _MyMovieViewState();
}

class _MyMovieViewState extends State<MyMovieView> {
  final MyMovieController controller = Get.find<MyMovieController>();

  @override
  void initState() {
    super.initState();
    controller.loadVideos();
  }

  bool mainAxisSizeColumn() {
    switch (controller.currentState.value) {
      case CurrentState.LOADING:
        return true;
      case CurrentState.LIVES:
        if (controller.listLives.length == 0) return true;
      case CurrentState.VIDEOS:
        if (controller.listVideos.length == 0) return true;
      case CurrentState.SHORTS:
        if (controller.listShorts.length == 0) return true;
    }
    if (controller.currentState.value == CurrentState.LOADING) {
      return true;
    }
    return false;
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam_outlined),
          ),
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
        () => Padding(
          padding: const EdgeInsets.all(Dimensions.normal),
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: Column(
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
                    _rowActionChip(),
                  ],
                ),
                if (controller.currentState.value == CurrentState.LOADING) ...centeredWidget(false),
                if (controller.currentState.value == CurrentState.VIDEOS)
                  if (controller.listVideos.isEmpty)
                    ...centeredWidget(true)
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
                    ...centeredWidget(true)
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
                    ...centeredWidget(true)
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
          ),
        ),
      ),
      bottomNavigationBar: FakeBottomNavibar(),
    );
  }

  List<Widget> centeredWidget(bool isEmpty) => [
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

  Row _rowActionChip() {
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
