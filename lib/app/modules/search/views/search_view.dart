import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/routes/app_pages.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import 'package:youtube_screens/gen/colors.gen.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/search_controller.dart';
import 'search_result_screen.dart';

class AppSearchView extends StatefulWidget {
  const AppSearchView({super.key});

  @override
  State<AppSearchView> createState() => _AppSearchViewState();
}

class _AppSearchViewState extends State<AppSearchView> {
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
          decoration: InputDecoration(
            hintText: "Search YouTube",
            isDense: true,
            contentPadding: EdgeInsets.all(Dimensions.normal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            suffixIcon: textController.text.isEmpty
                ? null
                : InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      textController.clear();
                      setState(() {});
                    },
                    child: Icon(
                      Icons.close,
                      size: IconSize.appbarTextField,
                    ),
                  ),
          ),
          onChanged: (searchString) {
            // for make sure actions disappear
            setState(() {});
            controller.search(searchString);
          },
        ),
        actions: textController.text.isNotEmpty
            ? null
            : [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_voice),
                ),
              ].separateCenter(),
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(controller.searchOptions[index]),
            leading: Icon(Icons.search),
            trailing: Transform.flip(flipX: true, child: Icon(Icons.arrow_outward_outlined)),
            onTap: () {
              controller.searchVideo(controller.searchOptions[index]);
              Get.toNamed(Routes.searchResult);
            },
          ),
          itemCount: controller.searchOptions.length,
        ),
      ),
    );
  }
}
