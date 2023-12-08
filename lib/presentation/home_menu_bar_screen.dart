import 'package:flutter/material.dart';
import 'package:kaon/core/app_export.dart';
import 'package:kaon/presentation/add_page.dart';
import 'package:kaon/presentation/home_page.dart';
import 'package:kaon/presentation/list_page.dart';
import 'package:kaon/presentation/login_page_screen.dart';
import 'package:kaon/presentation/settings_page.dart';
import 'package:kaon/presentation/about_settings_page_screen.dart';
import 'package:kaon/presentation/profile_settings_page_screen.dart';
import 'package:kaon/presentation/edit_list_page_screen.dart';
import 'package:kaon/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class HomeMenuBarScreen extends StatelessWidget {
  HomeMenuBarScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    String currentRoute = navigatorKey.currentState?.widget.initialRoute ?? "";

    // Check if the current page is the login page, and return null
    if (currentRoute == AppRoutes.settingsPage) {
      return LoginPageScreen();
    } else {
      return SafeArea(child: Builder(builder: (context) {
        return Scaffold(
          body: Navigator(
            key: navigatorKey,
            initialRoute: AppRoutes.homePage,
            onGenerateRoute: (routeSetting) => PageRouteBuilder(
              pageBuilder: (ctx, ani, ani1) =>
                  getCurrentPage(routeSetting.name!),
              transitionDuration: Duration(seconds: 0),
            ),
          ),
          bottomNavigationBar: _buildBottomBar(context),
        );
      }));
    }
  }

  /// Section Widget
  CustomBottomBar? _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Iconsgreen300:
        return AppRoutes.homePage;
      case BottomBarEnum.List:
        return AppRoutes.listPage;
      case BottomBarEnum.Plus:
        return AppRoutes.addPage;
      case BottomBarEnum.Settings:
        return AppRoutes.settingsPage;
      default:
        return "/";
    }
  }

  /// Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePage:
        return HomePage();
      case AppRoutes.listPage:
        return ListPage();
      case AppRoutes.addPage:
        return AddPage();
      case AppRoutes.settingsPage:
        return SettingsPage();
      case AppRoutes.profileSettingsPageScreen:
        return ProfileSettingsPageScreen();
      case AppRoutes.aboutSettingsPageScreen:
        return AboutSettingsPageScreen();
      case AppRoutes.editListPageScreen:
        return EditListPageScreen();
      case AppRoutes.loginPageScreen:
        return HomePage();
      default:
        return DefaultWidget();
    }
  }

  Loginpage(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.loginPageScreen);
  }
}
