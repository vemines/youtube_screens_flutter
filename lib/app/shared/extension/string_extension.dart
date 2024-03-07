import 'package:flutter/foundation.dart';

extension AppStringProcess on String {
  // build web folder is assets/assets so when build need add --release flag
  String prefixAssets() {
    return kReleaseMode && kIsWeb ? "assets/$this" : this;
  }
}
