import 'package:flutter/material.dart';
import 'package:kaon/presentation/login_page_screen.dart';
import 'package:kaon/presentation/invalid_login_page_screen.dart';
import 'package:kaon/presentation/home_menu_bar_screen.dart';
import 'package:kaon/presentation/forgot_password_one_screen.dart';
import 'package:kaon/presentation/forgot_password_two_screen.dart';
import 'package:kaon/presentation/sign_up_page_one_screen.dart';
import 'package:kaon/presentation/sign_up_page_two_screen.dart';
import 'package:kaon/presentation/sign_up_page_three_screen.dart';
import 'package:kaon/presentation/sign_up_page_four_screen.dart';
import 'package:kaon/presentation/profile_settings_page_screen.dart';
import 'package:kaon/presentation/about_settings_page_screen.dart';
import 'package:kaon/presentation/edit_list_page_screen.dart';
import 'package:kaon/presentation/app_navigation_screen.dart';

class AppRoutes {
  static const String loginPageScreen = '/login_page_screen';
  static const String invalidLoginPageScreen = '/invalid_login_page_screen';
  static const String homePage = '/home_page';
  static const String homeMenuBarScreen = '/home_menu_bar_screen';
  static const String forgotPasswordOneScreen = '/forgot_password_one_screen';
  static const String forgotPasswordTwoScreen = '/forgot_password_two_screen';
  static const String addPage = '/add_page';
  static const String signUpPageOneScreen = '/sign_up_page_one_screen';
  static const String signUpPageTwoScreen = '/sign_up_page_two_screen';
  static const String signUpPageThreeScreen = '/sign_up_page_three_screen';
  static const String signUpPageFourScreen = '/sign_up_page_four_screen';
  static const String settingsPage = '/settings_page';
  static const String profileSettingsPageScreen =
      '/profile_settings_page_screen';
  static const String aboutSettingsPageScreen = '/about_settings_page_screen';
  static const String listPage = '/list_page';
  static const String editListPageScreen = '/edit_list_page_screen';
  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    loginPageScreen: (context) => LoginPageScreen(),
    invalidLoginPageScreen: (context) => InvalidLoginPageScreen(),
    homeMenuBarScreen: (context) => HomeMenuBarScreen(),
    forgotPasswordOneScreen: (context) => ForgotPasswordOneScreen(),
    forgotPasswordTwoScreen: (context) => ForgotPasswordTwoScreen(),
    signUpPageOneScreen: (context) => SignUpPageOneScreen(),
    signUpPageTwoScreen: (context) => SignUpPageTwoScreen(),
    signUpPageThreeScreen: (context) => SignUpPageThreeScreen(),
    signUpPageFourScreen: (context) => SignUpPageFourScreen(),
    profileSettingsPageScreen: (context) => ProfileSettingsPageScreen(),
    aboutSettingsPageScreen: (context) => AboutSettingsPageScreen(),
    editListPageScreen: (context) => EditListPageScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
