import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/fake_bottom_nav.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/purchase_and_mem_controller.dart';

class InactiveMembershipsView extends GetView<PurchaseAndMemController> {
  const InactiveMembershipsView({super.key});

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
      body: ListTile(
        title: Assets.png.premiumLogo.image(
          height: Dimensions.large,
          alignment: Alignment.centerLeft,
        ),
        subtitle: Text("Expired Apr 23, 2023", style: textTheme.bodySmall),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
        onTap: () => Get.toNamed(Routes.inactiveMembershipDetail),
      ),
      bottomNavigationBar: FakeBottomNavibar(),
    );
  }
}
