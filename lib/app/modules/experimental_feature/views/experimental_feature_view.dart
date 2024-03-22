import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/appbar.dart';
import '../../../shared/widgets/bottom_nav.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/experimental_feature_controller.dart';

class ExperimentalFeatureView extends StatefulWidget {
  const ExperimentalFeatureView({super.key});

  @override
  State<ExperimentalFeatureView> createState() => _ExperimentalFeatureViewState();
}

class _ExperimentalFeatureViewState extends State<ExperimentalFeatureView> {
  final ExperimentalFeatureController controller = Get.find<ExperimentalFeatureController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: AppBarTitleWithSearchAndMore(
          title: "Try experimental new features",
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
                  children: [
                    Assets.png.ExperimentalFeature.image(),
                    _ExperimentalDetail(),
                    _ExperimentalCard(),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BottomNavibarNoSelected(),
    );
  }
}

class _ExperimentalDetail extends StatelessWidget {
  const _ExperimentalDetail();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Padding(
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
              vertical: Dimensions.large * 3,
            ),
            child: Text(
              "No experiments are available right now,\nTry checking again later.",
              textAlign: TextAlign.center,
              style: textTheme.bodySmall!.copyWith(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperimentalCard extends StatelessWidget {
  const _ExperimentalCard();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimensions.normal),
      child: Material(
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
    );
  }
}
