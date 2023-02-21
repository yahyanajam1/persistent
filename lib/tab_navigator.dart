import 'package:flutter/material.dart';
import 'package:nested_navigation_demo_flutter/color_detail_page.dart';
import 'package:nested_navigation_demo_flutter/colors_list_page.dart';
import 'package:nested_navigation_demo_flutter/next_page.dart';
import 'package:nested_navigation_demo_flutter/profile.dart';
import 'package:nested_navigation_demo_flutter/tab_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator(
      {super.key, required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;


  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.root: (context) => _getScren(context, tabItem)
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          settings: const RouteSettings(name: TabNavigatorRoutes.root),
          builder: (context) => routeBuilders[routeSettings.name]!(context),
        );
      },
    );
  }

  _getScren(BuildContext context, TabItem item) {
    switch (item) {
      case TabItem.red:
        return const Profile();
      case TabItem.green:
        return const NextPage();
      case TabItem.blue:
        return  ColorsListPage();
      default:
        return const Scaffold();
    }
  }
}
