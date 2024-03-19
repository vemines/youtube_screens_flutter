import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/constants/dimens.dart';
import '../../../shared/widgets/common.dart';

class WatchOnTVSetting extends StatelessWidget {
  const WatchOnTVSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Watch on TV"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: theme.colorScheme.error,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.normal),
                child: Text(
                  "No TVs found. Make sure your TX is on and conected to Wi-Fi",
                  style: textTheme.titleMedium,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.normal),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapN(),
                Text(
                  "No TVs found",
                  style: textTheme.bodyLarge,
                ),
                Text(
                  "Your TV needs to be on the same Wi-Fi network as your phone. You can also link your TV and phone using a TV code.",
                  style: textTheme.bodySmall,
                ),
                gapN(),
                noSplashInkWell(
                  onTap: () {},
                  child: Text(
                    "Get help",
                    style: textTheme.bodyLarge!.copyWith(color: theme.primaryColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.normal),
                  child: divider(),
                ),
                Text(
                  "Link with TV code",
                  style: textTheme.bodyLarge,
                ),
                Text(
                  "Another way of connecting devices. Learn how to get a code from your TV that you enter here.",
                  style: textTheme.bodySmall,
                ),
                gapN(),
                noSplashInkWell(
                  onTap: () {},
                  child: Text(
                    "Enter TV code",
                    style: textTheme.bodyLarge!.copyWith(color: theme.primaryColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.normal),
                  child: divider(),
                ),
                Text(
                  "Don't see your TV?",
                  style: textTheme.bodyLarge,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Dimensions.normal),
                  child: divider(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
