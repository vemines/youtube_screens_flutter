import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/views/widgets/video_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
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
  String? parameter = Get.parameters["query"];

  @override
  void initState() {
    super.initState();
    if (parameter != null) {
      textController = TextEditingController(text: parameter);
      controller.searchVideo(parameter!);
    }
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
        () => ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: ListView.builder(
            itemBuilder: (context, index) => VideoWidget(video: controller.searchResult[index]),
            itemCount: controller.searchResult.length,
          ),
        ),
      ),
    );
  }
}
