import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_screens/app/routes/app_pages.dart';
import 'package:youtube_screens/app/shared/widgets/appbar.dart';

import '../../../data/models/subscription_model.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/all_subscriptions_controller.dart';

class AllSubscriptionsView extends GetView<AllSubscriptionsController> {
  const AllSubscriptionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "All subscriptions",
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
                  children: [
                    _DropDownWidget(),
                    ...controller.subscriptions
                        .map(
                          (subscription) => _SubscriptionWidget(subscription),
                        )
                        .toList(),
                  ],
                ),
              ),
      ),
    );
  }
}

class _SubscriptionWidget extends StatelessWidget {
  const _SubscriptionWidget(this.subscription);
  final SubscriptionModel subscription;

  @override
  Widget build(BuildContext context) {
    final iconColor = context.theme.disabledColor;
    return ListTile(
      contentPadding: EdgeInsets.all(Dimensions.small),
      leading: CircleAvatar(child: Image.asset(subscription.iconChannel)),
      title: Text(subscription.nameChannel, style: context.textTheme.bodyLarge),
      trailing: TextButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (subscription.status == SubStatus.All)
                Icon(
                  Icons.notifications_active,
                  color: iconColor,
                ),
              if (subscription.status == SubStatus.None)
                Icon(
                  Icons.notifications_off_outlined,
                  color: iconColor,
                ),
              if (subscription.status == SubStatus.Personalized)
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

class _DropDownWidget extends GetView<AllSubscriptionsController> {
  const _DropDownWidget();

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
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
    );
  }
}
