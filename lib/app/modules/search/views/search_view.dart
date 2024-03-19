import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/string_extension.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/search_controller.dart';

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
                : noSplashInkWell(
                    onTap: () {
                      textController.clear();
                      if (mounted) setState(() {});
                    },
                    child: Icon(
                      Icons.close,
                      size: IconSize.appbarTextField,
                    ),
                  ),
          ),
          onChanged: (searchString) {
            // for make sure actions disappear
            if (mounted) setState(() {});
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
              print("/search/${controller.searchOptions[index].slug()}");
              Get.toNamed("/search/${controller.searchOptions[index].slug()}");
            },
          ),
          itemCount: controller.searchOptions.length,
        ),
      ),
    );
  }
}
