part of style;

final Color mColorNavigationBar = mColorBackground;
final Color mColorBackground = HexColor.fromHex('#f5f5f5');
final Color mStatusColor = mColorBackground;

final Color mAppBarColor = HexColor.fromHex('#f0eff4');
final Color mPrimaryColor = HexColor.fromHex('#933333');
final Color mDarkPrimaryColor = HexColor.fromHex('#6d1d1d');
final Color mAccentColor = mPrimaryColor;
final Color mGrayColor = HexColor.fromHex('#6c757d');
final Color mGrayDarkColor = HexColor.fromHex('#6c757d');
final Color mDarkColor = HexColor.fromHex('#343a40');
final Color mLightColor = HexColor.fromHex('#f8f9fa');
final Color mWarningColor = HexColor.fromHex('#ffc107');
final Color mCaptionColor = HexColor.fromHex('#757575');
final Color mBrownBackground = HexColor.fromHex('#c7b9a5');
final Color mYellowLightBackground = HexColor.fromHex('#ffeedb');
final Color mYellowColor = HexColor.fromHex('#f9d543');
final Color mGrayLightColor = HexColor.fromHex('#e3e3e3');
const Color mWhite = Colors.white;
final Color mBlackBody2 = HexColor.fromHex('#333333');

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
