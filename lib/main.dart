import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:youtube_screens/app/modules/static/not_found.dart';
import 'package:youtube_screens/app/shared/themes/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Youtube",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      unknownRoute: GetPage(name: "/404", page: () => NotFoundView()),
    );
  }
}
