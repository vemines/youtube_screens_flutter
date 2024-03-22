import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/purchase_and_mem_controller.dart';

class InactiveMembershipsDetail extends GetView<PurchaseAndMemController> {
  const InactiveMembershipsDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "Inactive Memberships",
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
              Assets.png.premiumLogo.image(height: Dimensions.large),
              gapN(),
              Text(
                "Hello Vemines\nThank for being a member of Youtube Premium member",
                style: textTheme.bodyLarge,
              ),
              gapF(2.5),
              Text(
                "Expired Apr 23, 2023",
                style: textTheme.bodySmall,
              ),
              gapS(),
              Align(
                alignment: Alignment.centerRight,
                child: noSplashInkWell(
                  child: Text(
                    "Get Youtube premium",
                    style: textTheme.bodyLarge!.copyWith(color: context.theme.primaryColor),
                  ),
                  onTap: () {},
                ),
              ),
              gapL(),
              Text("Recommand offers", style: textTheme.bodyLarge),
              gapS(),
              Assets.png.premiumLogo.image(height: Dimensions.large),
              gapS(),
              ...offer(
                title: "Individual Membership",
                price: "₫79,000/month (excludes VAT) after trail ends",
                detail: "Get ad-free access, downloads, and background play when you get Youtube Prenium. Terms apply.",
                onTap: () {},
              ),
              gapN(),
              ...offer(
                title: "Family Membership",
                price: "₫149,000/month (excludes VAT) after trail ends",
                detail:
                    "One subscription give you and 5 family members (ages 13+) in your household access to all Youtube Premium features. Terms apply.",
                onTap: () {},
              ),
              gapN(),
              ...offer(
                title: "Student Membership",
                price: "₫149,000/month (excludes VAT) after trail ends",
                detail:
                    "Verify your stdent status to get ad-free videos and music, and more - all at discounted price. Terms apply",
                onTap: () {},
              ),
              gapN(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavibarNoSelected(),
    );
  }

  List<Widget> offer({
    required String title,
    required String price,
    required String detail,
    required Function() onTap,
  }) {
    final textTheme = Get.context!.textTheme;
    return [
      Text(title, style: textTheme.bodyLarge),
      Text(price, style: textTheme.bodyLarge),
      gapF(0.25),
      Text(detail, style: textTheme.bodySmall),
      gapS(),
      Align(
        alignment: Alignment.centerRight,
        child: noSplashInkWell(
            child: Text(
              "Learn more",
              style: textTheme.bodyLarge!.copyWith(
                color: Get.context!.theme.primaryColor,
              ),
            ),
            onTap: onTap),
      )
    ];
  }
}
