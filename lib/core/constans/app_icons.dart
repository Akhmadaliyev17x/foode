import 'package:flutter_svg/flutter_svg.dart';

sealed class AppIcons {
  static final splashIcon =
      SvgPicture.asset("assets/images/svg/splash_icon.svg");
  static final congrats = SvgPicture.asset("assets/images/svg/congrats.svg");
  static final error = SvgPicture.asset("assets/images/png/error.png");
  static final facebook = SvgPicture.asset("assets/images/svg/facebook.svg");
  static final google = SvgPicture.asset("assets/images/svg/google.svg");
  static final logo = SvgPicture.asset("assets/images/svg/logo.svg");
  static final notification =
      SvgPicture.asset("assets/images/svg/notification.svg");
  static final balance = SvgPicture.asset("assets/images/svg/balance.svg");
}
