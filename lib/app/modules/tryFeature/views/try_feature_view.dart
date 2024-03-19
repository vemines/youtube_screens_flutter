import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/fake_bottom_nav.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../shared/widgets/common.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/try_feature_controller.dart';

class TryFeatureView extends StatefulWidget {
  const TryFeatureView({super.key});

  @override
  State<TryFeatureView> createState() => _TryFeatureViewState();
}

class _TryFeatureViewState extends State<TryFeatureView> {
  final TryFeatureController controller = Get.find<TryFeatureController>();

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
        title: Text("Try experimental new features"),
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
                  children: [
                    Assets.png.tryFeature.image(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimensions.normal),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          gapN(),
                          Text(
                            "Try experimental new features",
                            style: textTheme.headlineSmall,
                          ),
                          gapN(),
                          Text(
                            "For a limited time, eligible Premium members can try out new features that we’re working on, including AI experiments.",
                            style: textTheme.bodySmall!.copyWith(fontSize: 16),
                          ),
                          gapN(),
                          Text(
                            "As a Premium member, you’ll also enjoy watching YT ad-free, downloads, and more.",
                            style: textTheme.bodySmall!.copyWith(fontSize: 16),
                          ),
                          gapN(),
                          FilledButton(
                            onPressed: () {},
                            child: Text(
                              "Get Premium",
                              style: textTheme.bodyLarge!.copyWith(color: ColorName.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.normal * 2,
                              vertical: Dimensions.large * 2,
                            ),
                            child: Text(
                              "No experiments are available right now,\nTry checking again later.",
                              textAlign: TextAlign.center,
                              style: textTheme.bodySmall!.copyWith(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      type: MaterialType.card,
                      borderRadius: BorderRadius.circular(RadiusBorder.normal),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.normal),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Try experimental new features",
                              style: textTheme.titleLarge,
                            ),
                            Text(
                              "We want to know your thoughts about YouTube and other Google products so we can keep improving them.",
                              style: textTheme.bodySmall!.copyWith(fontSize: 16),
                            ),
                            gapN(),
                            Text(
                              "Sign up to give feedback. If a study is a good fit for your profile, you'll receive a follow-up questionnaire and details about what the study involves, including next steps and location. After completing the study, you will get a gift card as a thank you for your time.",
                              style: textTheme.bodySmall!.copyWith(fontSize: 16),
                            ),
                            gapN(),
                            Container(
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.only(
                                right: Dimensions.normal,
                              ),
                              child: noSplashInkWell(
                                child: Text(
                                  "Sign up",
                                  style: textTheme.bodyLarge!.copyWith(color: context.theme.primaryColor),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    gapN(),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: FakeBottomNavibar(),
    );
  }
}
