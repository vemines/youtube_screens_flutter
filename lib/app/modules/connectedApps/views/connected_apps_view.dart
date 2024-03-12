import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/data/models/connected_app.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/connected_apps_controller.dart';

class ConnectedAppsView extends StatefulWidget {
  const ConnectedAppsView({super.key});

  @override
  State<ConnectedAppsView> createState() => _ConnectedAppsViewState();
}

class _ConnectedAppsViewState extends State<ConnectedAppsView> {
  final ConnectedAppsController controller = Get.find<ConnectedAppsController>();

  @override
  void initState() {
    super.initState();
    controller.loadPosts();
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
        title: Text("Connected Apps"),
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
            : NoScrollBarWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.apps
                      .map(
                        (sub) => connectedAppListTile(sub, context),
                      )
                      .toList(),
                ),
              ),
      ),
    );
  }

  ListTile connectedAppListTile(ConnectedAppModel data, BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(Dimensions.small),
      leading: CircleAvatar(child: Image.asset(data.iconChannel)),
      title: Text(data.nameChannel, style: context.textTheme.bodyLarge),
      subtitle: Text(data.status ? "Connected" : "Not Connected", style: context.textTheme.bodySmall),
    );
  }
}
