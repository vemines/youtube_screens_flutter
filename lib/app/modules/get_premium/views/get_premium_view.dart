import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../../../shared/widgets/common.dart';
import '../controllers/get_premium_controller.dart';

class GetPremiumView extends StatefulWidget {
  const GetPremiumView({super.key});

  @override
  State<GetPremiumView> createState() => _GetPremiumViewState();
}

class _GetPremiumViewState extends State<GetPremiumView> {
  final GetPremiumController controller = Get.find<GetPremiumController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 30,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Get YouTube Premium"),
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
      body: Obx(() => controller.isLoading.value
          ? centerIndicator()
          : NoScrollBarWidget(
              child: Column(
                children: [
                  _FirstSection(),
                  _SmallFeatureSection(),
                  _PickPlanSection(),
                  _LargeFeatureSection(),
                  _YouTubeMusicSection(),
                  _TryNowSection(),
                  _QASection(),
                ].separateCenter(40),
              ),
            )),
    );
  }
}

class _FirstSection extends StatelessWidget {
  const _FirstSection();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Container(
      padding: EdgeInsets.all(Dimensions.normal),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.red,
            Colors.redAccent,
            Colors.black,
          ],
          stops: [0.2, 0.4, 0.7],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gapF(3),
          Assets.png.premiumLogo.image(),
          gapF(2),
          Text(
            "All YouTube. No Interruptions.",
            style: textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          gapF(2),
          Text(
            "YouTube and YouTube Music ad-free, offline, and in the background",
            style: textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          gapL(),
          Text(
            "1-month free trial • Then ₫79,000⁠/⁠month • Excludes VAT • Cancel anytime",
            style: textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          gapL(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.all(Dimensions.small),
                child: Text(
                  "Get YouTube Premium",
                  style: textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          gapS(),
          Text.rich(
            TextSpan(
              text: "Or save money with a ",
              style: textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: "family or student plan",
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: textTheme.bodyLarge!.copyWith(color: context.theme.primaryColor),
                ),
              ],
            ),
          ),
          gapN(),
          Text(
            "You'll be reminded 7 days before your trial ends. Recurring billing. Free trial for eligible new members only.",
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          noSplashInkWell(
            onTap: () {},
            child: Text(
              "Restrictions apply.",
              style: textTheme.bodyLarge!.copyWith(
                color: context.theme.primaryColor,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallFeatureSection extends StatelessWidget {
  const _SmallFeatureSection();

  Widget _rowFeature(Image image, String description) => Row(
        children: [
          Flexible(
            flex: 2,
            child: image,
          ),
          gapN(),
          Flexible(
            flex: 5,
            child: Text(
              description,
              style: Get.context!.textTheme.bodyMedium!.copyWith(fontSize: 16),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.large),
      child: Column(
        children: [
          _rowFeature(
            Assets.webp.smallFeature1.image(),
            "Ad-free so you can immerse in your favorite videos without interruption",
          ),
          _rowFeature(
            Assets.webp.smallFeature2.image(),
            "Download videos to watch later when you’re offline or on the go",
          ),
          _rowFeature(
            Assets.webp.smallFeature3.image(),
            "Background play so you can watch while using other apps or with your screen locked",
          ),
          _rowFeature(
            Assets.webp.smallFeature4.image(),
            "Stream all the music you want to hear, ad-free on the YouTube Music app",
          ),
        ],
      ),
    );
  }
}

class _PickPlanSection extends StatelessWidget {
  const _PickPlanSection();

  Widget _planWidget({
    required BuildContext context,
    required IconData iconData,
    required String planTitle,
    required String planPrice,
    required String spanVat,
    required String spanPrimary,
    bool isStudent = false,
  }) {
    final TextTheme textTheme = context.textTheme;
    Widget getPremiumText = Text(
      "Get YouTube Premium",
      style: textTheme.titleLarge!.copyWith(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              size: IconSize.pickPlanGetPremium,
            ),
            gapL(),
            Text(
              planTitle,
              style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        gapN(),
        divider(),
        gapN(),
        Text("Monthly", style: textTheme.bodyMedium),
        Text(planPrice, style: textTheme.headlineSmall),
        Text.rich(
          TextSpan(
            text: spanVat,
            style: textTheme.bodySmall,
            children: [
              TextSpan(
                text: spanPrimary,
                recognizer: TapGestureRecognizer()..onTap = () {},
                style: textTheme.bodySmall!.copyWith(color: context.theme.primaryColor),
              ),
            ],
          ),
        ),
        gapL(),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.all(Dimensions.small),
              child: isStudent
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.open_in_new_outlined,
                          color: Colors.black,
                        ),
                        gapN(),
                        getPremiumText
                      ],
                    )
                  : getPremiumText,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onPrimaryContainer,
        borderRadius: BorderRadius.circular(RadiusBorder.pickPlanGetPremium),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.large,
        vertical: Dimensions.normal,
      ),
      child: Column(
        children: [
          _planWidget(
            iconData: Icons.person_outline,
            context: context,
            planTitle: "Individual",
            planPrice: "₫79,000/month",
            spanVat: "Excludes VAT. Free trial for eligible new members only. ",
            spanPrimary: "Restrictions apply. ",
          ),
          _planWidget(
            iconData: Icons.groups_3_outlined,
            context: context,
            planTitle: "Family",
            planPrice: "₫149,000/month",
            spanVat:
                "Excludes VAT. Add up to 5 family members (ages 13+) in your household. Free trial for eligible new members only. ",
            spanPrimary: "Restrictions apply. ",
          ),
          _planWidget(
            iconData: Icons.school_outlined,
            context: context,
            planTitle: "Student",
            planPrice: "₫49,000/month",
            spanVat:
                "Excludes VAT. Eligible students only. Annual verification required. Free trial for eligible new members only. ",
            spanPrimary: "Restrictions apply. ",
            isStudent: true,
          ),
        ].separateCenter(2 * Dimensions.normal),
      ),
    );
  }
}

class _LargeFeatureSection extends StatelessWidget {
  const _LargeFeatureSection();

  Widget _largeFeature({
    required Widget image,
    required String title,
    required String subtitle,
    required BuildContext context,
  }) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          image,
          Text(
            title,
            style: context.textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w900),
          ),
          Text(subtitle, style: context.textTheme.titleMedium),
        ].separateCenter(),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.normal),
      child: Column(
        children: [
          Text(
            "Keep playing what you love - uninterrupted",
            style: context.textTheme.displaySmall,
          ),
          _largeFeature(
            context: context,
            image: Assets.webp.largeFeature1.image(),
            title: "Unlimited ad-free videos",
            subtitle:
                "Immerse in more of your favorite videos without waiting for ads. Find helpful how-to’s, try new recipes, or work out with your favorite creators — all without any interruptions.",
          ),
          _largeFeature(
            context: context,
            image: Assets.webp.largeFeature2.image(),
            title: "Enjoy videos offline",
            subtitle:
                "Watch anytime, anywhere — download videos and watch them whenever, wherever, without the need for cell data or WiFi.",
          ),
          _largeFeature(
            context: context,
            image: Assets.webp.largeFeature3.image(),
            title: "Background play",
            subtitle:
                "Keep watching - whether the screen’s off or you’re using other apps, you can continue playing your videos in the background with zero interruptions.",
          ),
        ].separateCenter(3 * Dimensions.normal),
      ),
    );
  }
}

class _YouTubeMusicSection extends StatelessWidget {
  const _YouTubeMusicSection();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.normal),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.blue,
            Colors.red,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          gapL(),
          Assets.png.premiumLogo.image(),
          gapL(),
          Text(
            "An app made just for music",
            style: textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          gapN(),
          Text(
            "With YouTube Premium you get uninterrupted access to stream all you want on the YouTube Music app. Listen to the world’s largest music catalog with over 100 million songs, ad-free — enjoy personalized mixes, playlists to fit every mood, chart-toppers from around the world and more, all without ads.",
            style: textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          gapN(),
          Assets.webp.largeFeature4.image(),
        ],
      ),
    );
  }
}

class _TryNowSection extends StatelessWidget {
  const _TryNowSection();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.large),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Try Premium now", style: textTheme.displaySmall),
          gapL(),
          Text(
            "1-month free trial • Then ₫79,000⁠/⁠month • Excludes VAT • Cancel anytime ",
            style: textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          gapL(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.all(Dimensions.small),
                child: Text(
                  "Get YouTube Premium",
                  style: textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          gapN(),
          Text(
            "Recurring billing. No refunds for partial billing preiods.",
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          noSplashInkWell(
            onTap: () {},
            child: Text(
              "Recurring billing. ",
              style: textTheme.bodySmall!.copyWith(
                color: context.theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QASection extends StatelessWidget {
  const _QASection();

  ExpansionTile _qaWidget({
    required TextTheme textTheme,
    required String title,
    required String content,
    String guideText = "",
    // String guideUrl = "",
  }) {
    return ExpansionTile(
      childrenPadding: EdgeInsets.all(Dimensions.normal),
      title: Text(
        title,
        style: textTheme.bodyLarge!.copyWith(
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),
      ),
      children: [
        Text(
          content,
          textAlign: TextAlign.start,
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        if (guideText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.normal),
            child: noSplashInkWell(
              onTap: () {},
              child: Text(
                guideText,
                textAlign: TextAlign.start,
                style: textTheme.bodyLarge!.copyWith(
                  color: Get.context!.theme.primaryColor,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _qaWidget(
          textTheme: textTheme,
          title: "What’s included with YouTube Premium?",
          content:
              "With a YouTube Premium membership, you can watch ad-free videos on YouTube. Plus, you can download videos to watch offline—and you can play videos in the background while you use other apps.\n\n YouTube Music Premium is included in your YouTube Premium membership. Download the YouTube Music app to listen to over 100 million songs ad-free, offline, and while your screen is locked.\n\n You can also watch videos on the YouTube Kids app without ads.",
        ),
        _qaWidget(
          textTheme: textTheme,
          title: "How do I download videos and music?",
          guideText: "Learn more about how to watch videos offline",
          content:
              "You can download and watch videos and music on your mobile device using the YouTube app, the YouTube Music app, or the YouTube Kids app. You can also download videos and watch on your computer using Chrome, Edge & Opera browsers.\n\n You can watch or listen to content offline for up to 30 days without being connected to the internet.",
        ),
        divider(),
        gapN(),
        Padding(
          padding: const EdgeInsets.all(Dimensions.normal),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Have other questions?",
                style: textTheme.titleLarge,
              ),
              Text.rich(
                TextSpan(
                  text: "Visit the ",
                  style: textTheme.titleLarge,
                  children: [
                    TextSpan(
                      text: "YouTube Help Center",
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: textTheme.titleLarge!.copyWith(color: context.theme.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
