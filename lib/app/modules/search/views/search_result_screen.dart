import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/modules/home/views/widgets/video_widget.dart';
import 'package:youtube_screens/app/routes/app_pages.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import 'package:youtube_screens/gen/colors.gen.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/search_controller.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key});

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  AppSearchController controller = Get.find<AppSearchController>();
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: controller.searchValue);
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
        leadingWidth: 30,
        title: TextField(
          controller: textController,
          cursorColor: context.theme.disabledColor,
          style: context.textTheme.bodyMedium,
          onTap: () => Get.toNamed(Routes.search),
          decoration: InputDecoration(
            hintText: "Search YouTube",
            isDense: true,
            contentPadding: EdgeInsets.all(Dimensions.normal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Get.toNamed(Routes.search),
            ),
          ),
          onChanged: (searchString) {
            // for make sure actions disappear
            setState(() {});
            controller.search(searchString);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_voice),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ].separateCenter(),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => VideoWidget(video: controller.searchResult[index]),
          itemCount: controller.searchResult.length,
        ),
      ),
    );
  }
}
