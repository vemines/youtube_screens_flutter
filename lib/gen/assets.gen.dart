/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/services.dart';
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class $AssetsJpgGen {
  const $AssetsJpgGen();

  /// File path: assets/jpg/sample.jpeg
  AssetGenImage get sample => const AssetGenImage('assets/jpg/sample.jpeg');

  /// List of all assets
  List<AssetGenImage> get values => [sample];
}

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/coffee.png
  AssetGenImage get coffee => const AssetGenImage('assets/png/coffee.png');

  /// File path: assets/png/download.png
  AssetGenImage get download => const AssetGenImage('assets/png/download.png');

  /// File path: assets/png/movie.png
  AssetGenImage get movie => const AssetGenImage('assets/png/movie.png');

  /// File path: assets/png/premium_logo.png
  AssetGenImage get premiumLogo => const AssetGenImage('assets/png/premium_logo.png');

  /// File path: assets/png/try_feature.png
  AssetGenImage get ExperimentalFeature => const AssetGenImage('assets/png/try_feature.png');

  /// File path: assets/png/your_video.png
  AssetGenImage get yourVideo => const AssetGenImage('assets/png/your_video.png');

  /// File path: assets/png/yt_logo.png
  AssetGenImage get ytLogo => const AssetGenImage('assets/png/yt_logo.png');

  /// File path: assets/png/yt_logo_dark.png
  AssetGenImage get ytLogoDark => const AssetGenImage('assets/png/yt_logo_dark.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [coffee, download, movie, premiumLogo, ExperimentalFeature, yourVideo, ytLogo, ytLogoDark];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/google.svg
  SvgGenImage get google => const SvgGenImage('assets/svg/google.svg');

  /// List of all assets
  List<SvgGenImage> get values => [google];
}

class $AssetsWebpGen {
  const $AssetsWebpGen();

  /// File path: assets/webp/large_feature_1.webp
  AssetGenImage get largeFeature1 => const AssetGenImage('assets/webp/large_feature_1.webp');

  /// File path: assets/webp/large_feature_2.webp
  AssetGenImage get largeFeature2 => const AssetGenImage('assets/webp/large_feature_2.webp');

  /// File path: assets/webp/large_feature_3.webp
  AssetGenImage get largeFeature3 => const AssetGenImage('assets/webp/large_feature_3.webp');

  /// File path: assets/webp/large_feature_4.webp
  AssetGenImage get largeFeature4 => const AssetGenImage('assets/webp/large_feature_4.webp');

  /// File path: assets/webp/small_feature_1.webp
  AssetGenImage get smallFeature1 => const AssetGenImage('assets/webp/small_feature_1.webp');

  /// File path: assets/webp/small_feature_2.webp
  AssetGenImage get smallFeature2 => const AssetGenImage('assets/webp/small_feature_2.webp');

  /// File path: assets/webp/small_feature_3.webp
  AssetGenImage get smallFeature3 => const AssetGenImage('assets/webp/small_feature_3.webp');

  /// File path: assets/webp/small_feature_4.webp
  AssetGenImage get smallFeature4 => const AssetGenImage('assets/webp/small_feature_4.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        largeFeature1,
        largeFeature2,
        largeFeature3,
        largeFeature4,
        smallFeature1,
        smallFeature2,
        smallFeature3,
        smallFeature4
      ];
}

class Assets {
  Assets._();

  static const $AssetsJpgGen jpg = $AssetsJpgGen();
  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsWebpGen webp = $AssetsWebpGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
