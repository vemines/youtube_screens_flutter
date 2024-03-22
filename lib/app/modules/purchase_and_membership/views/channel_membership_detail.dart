import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/purchase_and_mem_controller.dart';

class ChannelMembershipDetail extends GetView<PurchaseAndMemController> {
  ChannelMembershipDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: controller.membership.nameChannel,
          onBack: () => Get.back(),
          searchOnPressed: () => Get.toNamed(Routes.search),
          moreOnPressed: () {},
        ),
      ),
      body: NoScrollBarWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.normal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(child: Image.asset(controller.membership.iconChannel)),
              gapN(),
              Text(
                "Hello Vemines\nThank for being a member of this channel",
                style: textTheme.bodyLarge,
              ),
              gapF(2.5),
              Text(
                controller.membership.getPricePerMonth(),
                style: textTheme.bodyLarge,
              ),
              Text(
                "${controller.membership.getPerksEnd()}\nTo avoid losing benifits, renew your membership",
                style: textTheme.bodySmall,
              ),
              gapS(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  noSplashInkWell(
                    child: Text(
                      "Renew",
                      style: textTheme.bodyLarge!.copyWith(color: context.theme.primaryColor),
                    ),
                    onTap: () {},
                  ),
                  gapN(),
                  noSplashInkWell(
                    child: Text(
                      "See perks",
                      style: textTheme.bodyLarge!.copyWith(color: context.theme.primaryColor),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavibarNoSelected(),
    );
  }
}
