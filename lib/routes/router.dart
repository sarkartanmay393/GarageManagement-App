import "package:auto_route/auto_route.dart";
import 'package:bee/ui/help/helppage.dart';
import 'package:bee/ui/inventory/inventory.dart';

import '../ui/auth/login/login.dart';
import '../ui/home/homepage.dart';
import '../ui/notification/notifications.dart';
import '../ui/profiles/profilepage.dart';
import '../ui/profiles/vanprofile.dart';
import '../ui/services_request/services_request.dart';
import '../ui/TabView.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '',
      name: 'TabView',
      page: TabView,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: HomePage),
            AutoRoute(path: 'service_request', page: ServicesRequest),
            AutoRoute(path: 'notifications', page: Notifications),
          ],
        ),
        AutoRoute(
          path: 'Vprofile',
          name: 'VProfileRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: VanProfilePage),
          ],
        ),
        AutoRoute(
          path: 'Gprofile',
          name: 'GProfileRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ProfilePage),
          ],
        ),
        AutoRoute(
          path: 'helps',
          name: 'HelpsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: HelpPage),
          ],
        ),
        AutoRoute(
          path: 'inventory',
          name: 'InventoryRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: InventoryPage),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: '/',
      page: LoginPage,
      children: [
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
  ],
)
class $AppRouter {}
