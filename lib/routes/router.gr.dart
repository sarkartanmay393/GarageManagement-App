// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i11;

import '../ui/auth/login/login.dart' as _i2;
import '../ui/help/helppage.dart' as _i9;
import '../ui/home/homepage.dart' as _i4;
import '../ui/inventory/inventory.dart' as _i10;
import '../ui/notification/notifications.dart' as _i6;
import '../ui/profiles/profilepage.dart' as _i8;
import '../ui/profiles/vanprofile.dart' as _i7;
import '../ui/services_request/services_request.dart' as _i5;
import '../ui/TabView.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    TabView.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.TabView());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage(key: args.key));
    },
    HomeRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    VProfileRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    GProfileRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    HelpsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    InventoryRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomePage());
    },
    ServicesRequest.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ServicesRequest());
    },
    Notifications.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.Notifications());
    },
    VanProfileRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.VanProfilePage());
    },
    ProfileRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfilePage());
    },
    HelpRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HelpPage());
    },
    InventoryRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.InventoryPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(TabView.name, path: '', children: [
          _i3.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: TabView.name,
              children: [
                _i3.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i3.RouteConfig(ServicesRequest.name,
                    path: 'service_request', parent: HomeRouter.name),
                _i3.RouteConfig(Notifications.name,
                    path: 'notifications', parent: HomeRouter.name)
              ]),
          _i3.RouteConfig(VProfileRouter.name,
              path: 'Vprofile',
              parent: TabView.name,
              children: [
                _i3.RouteConfig(VanProfileRoute.name,
                    path: '', parent: VProfileRouter.name)
              ]),
          _i3.RouteConfig(GProfileRouter.name,
              path: 'Gprofile',
              parent: TabView.name,
              children: [
                _i3.RouteConfig(ProfileRoute.name,
                    path: '', parent: GProfileRouter.name)
              ]),
          _i3.RouteConfig(HelpsRouter.name,
              path: 'helps',
              parent: TabView.name,
              children: [
                _i3.RouteConfig(HelpRoute.name,
                    path: '', parent: HelpsRouter.name)
              ]),
          _i3.RouteConfig(InventoryRouter.name,
              path: 'inventory',
              parent: TabView.name,
              children: [
                _i3.RouteConfig(InventoryRoute.name,
                    path: '', parent: InventoryRouter.name)
              ])
        ]),
        _i3.RouteConfig(LoginRoute.name, path: '/', children: [
          _i3.RouteConfig('*#redirect',
              path: '*',
              parent: LoginRoute.name,
              redirectTo: '',
              fullMatch: true)
        ])
      ];
}

/// generated route for
/// [_i1.TabView]
class TabView extends _i3.PageRouteInfo<void> {
  const TabView({List<_i3.PageRouteInfo>? children})
      : super(TabView.name, path: '', initialChildren: children);

  static const String name = 'TabView';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i3.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i11.Key? key, List<_i3.PageRouteInfo>? children})
      : super(LoginRoute.name,
            path: '/',
            args: LoginRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HomeRouter extends _i3.PageRouteInfo<void> {
  const HomeRouter({List<_i3.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class VProfileRouter extends _i3.PageRouteInfo<void> {
  const VProfileRouter({List<_i3.PageRouteInfo>? children})
      : super(VProfileRouter.name, path: 'Vprofile', initialChildren: children);

  static const String name = 'VProfileRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class GProfileRouter extends _i3.PageRouteInfo<void> {
  const GProfileRouter({List<_i3.PageRouteInfo>? children})
      : super(GProfileRouter.name, path: 'Gprofile', initialChildren: children);

  static const String name = 'GProfileRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class HelpsRouter extends _i3.PageRouteInfo<void> {
  const HelpsRouter({List<_i3.PageRouteInfo>? children})
      : super(HelpsRouter.name, path: 'helps', initialChildren: children);

  static const String name = 'HelpsRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class InventoryRouter extends _i3.PageRouteInfo<void> {
  const InventoryRouter({List<_i3.PageRouteInfo>? children})
      : super(InventoryRouter.name,
            path: 'inventory', initialChildren: children);

  static const String name = 'InventoryRouter';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ServicesRequest]
class ServicesRequest extends _i3.PageRouteInfo<void> {
  const ServicesRequest()
      : super(ServicesRequest.name, path: 'service_request');

  static const String name = 'ServicesRequest';
}

/// generated route for
/// [_i6.Notifications]
class Notifications extends _i3.PageRouteInfo<void> {
  const Notifications() : super(Notifications.name, path: 'notifications');

  static const String name = 'Notifications';
}

/// generated route for
/// [_i7.VanProfilePage]
class VanProfileRoute extends _i3.PageRouteInfo<void> {
  const VanProfileRoute() : super(VanProfileRoute.name, path: '');

  static const String name = 'VanProfileRoute';
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i3.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i9.HelpPage]
class HelpRoute extends _i3.PageRouteInfo<void> {
  const HelpRoute() : super(HelpRoute.name, path: '');

  static const String name = 'HelpRoute';
}

/// generated route for
/// [_i10.InventoryPage]
class InventoryRoute extends _i3.PageRouteInfo<void> {
  const InventoryRoute() : super(InventoryRoute.name, path: '');

  static const String name = 'InventoryRoute';
}
