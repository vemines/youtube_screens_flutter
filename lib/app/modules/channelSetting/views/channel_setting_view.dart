import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/fake_bottom_nav.dart';
import '../../../../gen/assets.gen.dart';
import '../../../shared/widgets/common.dart';
import '../../../shared/extensions/widget_extension.dart';
import '../controllers/channel_setting_controller.dart';

class ChannelSettingView extends StatefulWidget {
  const ChannelSettingView({super.key});

  @override
  State<ChannelSettingView> createState() => _ChannelSettingViewState();
}

class _ChannelSettingViewState extends State<ChannelSettingView> {
  final ChannelSettingController controller = Get.find<ChannelSettingController>();
  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Channel Setting"),
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
      body: NoScrollBarWidget(
        child: Column(
          children: [
            Stack(
              children: [
                AspectRatio(aspectRatio: 4, child: Assets.jpg.sample.image(fit: BoxFit.fill)),
                Positioned.fill(
                  child: Center(
                    child: CircleAvatar(
                      child: Stack(
                        children: [
                          Assets.png.coffee.image(),
                          Positioned.fill(
                            child: Center(
                              child: IconButton(
                                onPressed: () {},
                                style: IconButton.styleFrom(
                                  backgroundColor: colorScheme.background.withOpacity(0.1),
                                ),
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      radius: IconSize.channelSetting,
                    ),
                  ),
                ),
                Positioned(
                  top: Dimensions.small,
                  right: Dimensions.small,
                  child: IconButton(
                    onPressed: () {},
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.background,
                    ),
                    icon: Icon(Icons.camera_alt_outlined),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _ListTileWidget(
                  title: "Name",
                  subtitle: "VeMines",
                  onTap: () {},
                  icon: Icon(Icons.edit_outlined),
                ),
                divider(),
                _ListTileWidget(
                  title: "Handle",
                  subtitle: "@vemines1234",
                  onTap: () {},
                  icon: Icon(Icons.edit_outlined),
                ),
                divider(),
                _ListTileWidget(
                  title: "Channel URL",
                  subtitle: "https://www.youtube.com/@vemines1234",
                  onTap: () {},
                  icon: Icon(Icons.copy_outlined),
                ),
                divider(),
                _ListTileWidget(
                  title: "Description",
                  subtitle: "Add a description",
                  onTap: () {},
                  icon: Icon(Icons.edit_outlined),
                ),
                divider(),
                gapN(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.normal),
                  child: Text(
                    "Privacy",
                    style: textTheme.bodyLarge,
                  ),
                ),
                Obx(() => SwitchListTile(
                      value: controller.keepSubPri.value,
                      onChanged: controller.changeKeepSubPri,
                      inactiveThumbColor: context.theme.disabledColor,
                      title: Text("Keep all my subscriptions private"),
                    )),
                gapN(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(Dimensions.small / 2),
                      child: Icon(
                        Icons.info_outline,
                        size: IconSize.minimal,
                      ),
                    ),
                    Flexible(
                      child: Text.rich(
                        TextSpan(
                          text:
                              "Changes made to your name and profile picture are visible only on YouTube and not other Google services. ",
                          style: textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: "Learn more",
                              recognizer: TapGestureRecognizer()..onTap = () {},
                              style: textTheme.bodyLarge!.copyWith(color: context.theme.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gapN(),
          ],
        ),
      ),
      bottomNavigationBar: FakeBottomNavibar(),
    );
  }
}

class _ListTileWidget extends StatelessWidget {
  const _ListTileWidget({
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final String subtitle;
  final Function() onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return ListTile(
      title: Text(title, style: textTheme.bodyLarge),
      subtitle: Text(subtitle, style: textTheme.bodySmall),
      onTap: onTap,
      trailing: icon,
    );
  }
}
