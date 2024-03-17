import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SettingsController extends GetxController {
  final RxString radioSelected = "Option 1".obs;
  List<String> radioOptions = ["Option 1", "Option 2", "Option 3"];
  void changeRadioSelected(String? s) {
    if (s != null) radioSelected.value = s;
  }
}

final List<Map<String, dynamic>> availabelSettings = <Map<String, dynamic>>[
  {
    "title": "General",
    "subtitle": "demo all settings components",
    "onTap": () => Get.toNamed(Routes.settingDemo),
  },
  {
    "title": "Account",
    "onTap": () {},
  },
  {
    "title": "Data saving",
    "onTap": () {},
  },
  {
    "title": "Autoplay",
    "onTap": () {},
  },
  {
    "title": "Video quality preferences",
    "onTap": () {},
  },
  {
    "title": "Background & downloads",
    "onTap": () {},
  },
  {
    "title": "Watch on TV",
    "onTap": () {},
  },
  {
    "title": "Manage all history",
    "onTap": () {},
  },
  {
    "title": "Your data in YouTube",
    "onTap": () {},
  },
  {
    "title": "Privacy",
    "onTap": () {},
  },
  {
    "title": "Try experimental new features",
    "onTap": () {},
  },
  {
    "title": "Purchases and memberships",
    "onTap": () {},
  },
  {
    "title": "Billing & payments",
    "onTap": () {},
  },
  {
    "title": "Notifications",
    "onTap": () {},
  },
  {
    "title": "Connected apps",
    "onTap": () {},
  },
  {
    "title": "Live chat",
    "onTap": () {},
  },
  {
    "title": "Captions",
    "onTap": () {},
  },
  {
    "title": "Accessibility",
    "onTap": () {},
  },
  {
    "title": "ReVanced",
    "subtitle": "ReVanced specific settings",
    "onTap": () {},
  },
  {
    "title": "GmsCore Settings",
    "subtitle": "Settings for GmsCore",
    "onTap": () {},
  },
  {
    "title": "Return YouTube Dislike",
    "subtitle": "Settings for Return YouTube Dislike",
    "onTap": () {},
  },
  {
    "title": "SponsorBlock",
    "subtitle": "SponsorBlock related settings",
    "onTap": () {},
  },
];
