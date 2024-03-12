import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/data/models/subscription_model.dart';
import 'package:youtube_screens/app/shared/constants/dimens.dart';
import 'package:youtube_screens/app/shared/widgets/common.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/all_subscriptions_controller.dart';

class AllSubscriptionsView extends StatefulWidget {
  const AllSubscriptionsView({super.key});

  @override
  State<AllSubscriptionsView> createState() => _AllSubscriptionsViewState();
}

class _AllSubscriptionsViewState extends State<AllSubscriptionsView> {
  final AllSubscriptionsController controller = Get.find<AllSubscriptionsController>();

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
        title: Text("All subscriptions"),
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
                  children: [
                    DropdownButton(
                      value: controller.currentSortOption.value,
                      padding: EdgeInsets.only(
                        left: Dimensions.normal,
                        right: Dimensions.small,
                      ),
                      icon: Icon(Icons.keyboard_arrow_down_outlined),
                      underline: SizedBox(),
                      items: controller.dropdownSortOptions
                          .map(
                            (data) => DropdownMenuItem<String>(
                              value: data,
                              child: Text(data),
                            ),
                          )
                          .toList(),
                      onChanged: (s) => controller.changeSortOption(
                        s.toString(),
                      ),
                    ),
                    ...controller.subscriptions.map((sub) => subscriptionListTile(sub, context)).toList(),
                  ],
                ),
              ),
      ),
    );
  }

  ListTile subscriptionListTile(SubscriptionModel sub, BuildContext context) {
    final iconColor = context.theme.disabledColor;
    return ListTile(
      contentPadding: EdgeInsets.all(Dimensions.small),
      leading: CircleAvatar(child: Image.asset(sub.iconChannel)),
      title: Text(sub.nameChannel, style: context.textTheme.bodyLarge),
      trailing: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (sub.status == SubStatus.All)
                Icon(
                  Icons.notifications_active,
                  color: iconColor,
                ),
              if (sub.status == SubStatus.None)
                Icon(
                  Icons.notifications_off_outlined,
                  color: iconColor,
                ),
              if (sub.status == SubStatus.Personalized)
                Icon(
                  Icons.notifications_outlined,
                  color: iconColor,
                ),
              Icon(
                Icons.keyboard_arrow_down_outlined,
                color: iconColor,
              ),
            ],
          )),
    );
  }
}
