part of style;

//w100 Thin, the least thick
//w200 Extra-light
//w300 Light
//w400 Normal / regular / plain
//w500 Medium
//w600 Semi-bold
//w700 Bold
//w800 Extra-bold
//w900 Black, the most thick

class AppThemes {
  static ThemeData defaultTheme() {
    return ThemeData(
      primaryColor: mPrimaryColor,
      scaffoldBackgroundColor: mAppBarColor,
      backgroundColor: mColorBackground,
      appBarTheme: AppBarTheme(
          elevation: dimen_0,
          color: mAppBarColor,
          iconTheme: IconThemeData(color: mPrimaryColor),
          titleTextStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: mDarkPrimaryColor,
              letterSpacing: dimen_0_2)),
      primaryColorDark: mDarkPrimaryColor,
      indicatorColor: mPrimaryColor,
      splashColor: mPrimaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: mAppBarColor,
          selectedItemColor: mPrimaryColor,
          unselectedItemColor: mGrayColor,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(fontSize: 9.sp, color: mGrayDarkColor),
          selectedLabelStyle: TextStyle(fontSize: 9.sp, color: mPrimaryColor)),
      cardTheme: const CardTheme(margin: EdgeInsets.zero),
      buttonTheme: ButtonThemeData(
        // height: 44.h,
        // padding: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dimen_4)),
        textTheme:
            ButtonTextTheme.primary, //  <-- this auto selects the right color
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              color: mGrayColor,
              letterSpacing: dimen_0_2)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w)),
              backgroundColor: MaterialStateProperty.all(mDarkPrimaryColor),
              textStyle: MaterialStateProperty.all(TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: mLightColor,
                  letterSpacing: dimen_0_2)))),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 26.sp,
            fontWeight: FontWeight.bold,
            color: mDarkColor,
            letterSpacing: dimen_0_2),
        titleMedium: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: mDarkColor,
            letterSpacing: dimen_0_2),
        titleSmall: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: mDarkColor,
            letterSpacing: dimen_0_2),
        bodyMedium: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: mDarkColor,
            letterSpacing: dimen_0_2),
        bodySmall: TextStyle(
            fontSize: 11.sp, color: mCaptionColor, letterSpacing: dimen_0_2),
      ),
    );
  }
}

extension ThemeExtension on TextTheme {
  TextStyle get textTitleBodySize => TextStyle(
      fontSize: fzBody.sp,
      fontWeight: FontWeight.w600,
      color: mDarkColor,
      letterSpacing: dimen_0_2);
}
