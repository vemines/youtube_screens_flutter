import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../controllers/purchase_and_mem_controller.dart';

class ChannelMembershipsView extends GetView<PurchaseAndMemController> {
  const ChannelMembershipsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "Channel Membership",
          onBack: () => Get.back(),
          searchOnPressed: () => Get.toNamed(Routes.search),
          moreOnPressed: () {},
        ),
      ),
      body: Obx(() => ListView.builder(
            itemBuilder: (context, index) {
              final membership = controller.memberships.toList()[index];
              return ListTile(
                leading: CircleAvatar(child: Image.asset(membership.iconChannel)),
                title: Text(membership.nameChannel, style: textTheme.bodyLarge),
                subtitle: Text(membership.getPerksEnd(), style: textTheme.bodySmall),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () {
                  controller.changeMemberShip(membership);
                  Get.toNamed(Routes.channelMembershipDetail, arguments: membership);
                },
              );
            },
            itemCount: controller.memberships.length,
          )),
      bottomNavigationBar: BottomNavibarNoSelected(),
    );
  }
}
