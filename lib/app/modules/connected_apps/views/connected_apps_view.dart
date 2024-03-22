import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/connected_app_model.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/connected_apps_controller.dart';

class ConnectedAppsView extends GetView<ConnectedAppsController> {
  const ConnectedAppsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "Connected Apps",
          onBack: () => Get.back(),
          searchOnPressed: () => Get.toNamed(Routes.search),
          moreOnPressed: () {},
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? centerIndicator()
            : NoScrollBarWidget(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.apps
                      .map(
                        (app) => _AppListTile(app),
                      )
                      .toList(),
                ),
              ),
      ),
    );
  }
}

class _AppListTile extends StatelessWidget {
  const _AppListTile(this.app);
  final ConnectedAppModel app;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(Dimensions.small),
      leading: CircleAvatar(child: Image.asset(app.iconChannel)),
      title: Text(app.nameChannel, style: context.textTheme.bodyLarge),
      subtitle: Text(
        app.status ? "Connected" : "Not Connected",
        style: context.textTheme.bodySmall,
      ),
    );
  }
}
