import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../controllers/purchase_and_mem_controller.dart';

class InactiveMembershipsView extends GetView<PurchaseAndMemController> {
  const InactiveMembershipsView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "Youtube Premium",
          onBack: () => Get.back(),
          searchOnPressed: () => Get.toNamed(Routes.search),
          moreOnPressed: () {},
        ),
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
      bottomNavigationBar: BottomNavibarNoSelected(),
    );
  }
}
