import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/fake_bottom_nav.dart';
import '../../../../gen/assets.gen.dart';
import '../../../shared/widgets/common.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/purchase_and_mem_controller.dart';

class PurchaseAndMemView extends StatefulWidget {
  const PurchaseAndMemView({super.key});

  @override
  State<PurchaseAndMemView> createState() => _PurchaseAndMemViewState();
}

class _PurchaseAndMemViewState extends State<PurchaseAndMemView> {
  final PurchaseAndMemController controller = Get.find<PurchaseAndMemController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Purchase and membership"),
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
                    ListTile(
                      title: Text("Purchases", style: textTheme.bodyLarge),
                      subtitle: Text("You have no purchases", style: textTheme.bodySmall),
                    ),
                    divider(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        Dimensions.normal,
                        Dimensions.normal,
                        Dimensions.normal,
                        0,
                      ),
                      child: Text("Memberships", style: textTheme.bodyMedium),
                    ),
                    ListTile(
                      title: Text("Channel Memberships", style: textTheme.bodyLarge),
                      subtitle: Text("1 active membership", style: textTheme.bodySmall),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () => Get.toNamed(Routes.channelMembership),
                    ),
                    ListTile(
                      title: Text("Inactive Memberships", style: textTheme.bodyLarge),
                      subtitle: Text("1 inactive membership", style: textTheme.bodySmall),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () => Get.toNamed(Routes.inactiveMembership),
                    ),
                    divider(),
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.normal),
                      child: Text("Offers from youtube", style: textTheme.bodyMedium),
                    ),
                    Container(
                      height: ImageSize.offerFromHeight,
                      child: Center(
                        child: Assets.png.premiumLogo.image(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.normal,
                        vertical: Dimensions.small,
                      ),
                      child: Text("Enjoy a free month of YouTube Premium", style: textTheme.bodyMedium),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.normal),
                      child: Text(
                        "Get ad-free access, downloads, and background play when you get YouTube Premium. Terms apply.",
                        style: textTheme.bodySmall,
                      ),
                    ),
                    gapS(),
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: Dimensions.normal),
                      child: noSplashInkWell(
                        child: Text(
                          "Learn more",
                          style: textTheme.bodyLarge!.copyWith(color: context.theme.primaryColor),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: FakeBottomNavibar(),
    );
  }
}
