import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/widgets/fake_bottom_nav.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/purchase_and_mem_controller.dart';

class ChannelMembershipsView extends GetView<PurchaseAndMemController> {
  const ChannelMembershipsView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.purchasesAndMembership),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Channel Membership"),
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
      body: Obx(() => ListView.builder(
            itemBuilder: (context, index) {
              final membership = controller.memberships.toList()[index];
              return ListTile(
                leading: CircleAvatar(child: Image.asset(membership.iconChannel)),
                title: Text(membership.nameChannel, style: textTheme.bodyLarge),
                subtitle: Text(membership.getPerksEnd(), style: textTheme.bodySmall),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
                onTap: () => Get.toNamed(Routes.channelMembershipDetail, arguments: membership),
              );
            },
            itemCount: controller.memberships.length,
          )),
      bottomNavigationBar: FakeBottomNavibar(),
    );
  }
}
