// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/YekanBakh-Bold.ttf
  String get yekanBakhBold => 'assets/fonts/YekanBakh-Bold.ttf';

  /// File path: assets/fonts/YekanBakh-Light.ttf
  String get yekanBakhLight => 'assets/fonts/YekanBakh-Light.ttf';

  /// File path: assets/fonts/YekanBakh-Regular.ttf
  String get yekanBakhRegular => 'assets/fonts/YekanBakh-Regular.ttf';

  /// File path: assets/fonts/YekanBakh-SemiBold.ttf
  String get yekanBakhSemiBold => 'assets/fonts/YekanBakh-SemiBold.ttf';

  /// File path: assets/fonts/YekanBakh-Thin.ttf
  String get yekanBakhThin => 'assets/fonts/YekanBakh-Thin.ttf';

  /// List of all assets
  List<String> get values => [
    yekanBakhBold,
    yekanBakhLight,
    yekanBakhRegular,
    yekanBakhSemiBold,
    yekanBakhThin,
  ];
}

class $AssetsPngsGen {
  const $AssetsPngsGen();

  /// File path: assets/pngs/back_card.png
  AssetGenImage get backCard =>
      const AssetGenImage('assets/pngs/back_card.png');

  /// File path: assets/pngs/car.png
  AssetGenImage get car => const AssetGenImage('assets/pngs/car.png');

  /// File path: assets/pngs/clock.png
  AssetGenImage get clock => const AssetGenImage('assets/pngs/clock.png');

  /// File path: assets/pngs/close-circle.png
  AssetGenImage get closeCircle =>
      const AssetGenImage('assets/pngs/close-circle.png');

  /// File path: assets/pngs/document.png
  AssetGenImage get document => const AssetGenImage('assets/pngs/document.png');

  /// File path: assets/pngs/filter.png
  AssetGenImage get filter => const AssetGenImage('assets/pngs/filter.png');

  /// File path: assets/pngs/front_card.png
  AssetGenImage get frontCard =>
      const AssetGenImage('assets/pngs/front_card.png');

  /// File path: assets/pngs/info-circle.png
  AssetGenImage get infoCircle =>
      const AssetGenImage('assets/pngs/info-circle.png');

  /// File path: assets/pngs/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/pngs/profile.png');

  /// File path: assets/pngs/search.png
  AssetGenImage get search => const AssetGenImage('assets/pngs/search.png');

  /// File path: assets/pngs/tick-circle.png
  AssetGenImage get tickCircle =>
      const AssetGenImage('assets/pngs/tick-circle.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    backCard,
    car,
    clock,
    closeCircle,
    document,
    filter,
    frontCard,
    infoCircle,
    profile,
    search,
    tickCircle,
  ];
}

class Assets {
  const Assets._();

  static const AssetGenImage appLogo = AssetGenImage('assets/app_logo.png');
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsPngsGen pngs = $AssetsPngsGen();

  /// List of all assets
  static List<AssetGenImage> get values => [appLogo];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
