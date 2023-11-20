// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:absen_qrcode/ui/admin/home/main_screen_activity.dart' as _i3;
import 'package:absen_qrcode/ui/admin/profile/profile_activity.dart' as _i1;
import 'package:absen_qrcode/ui/admin/home/home_activity.dart' as _i2;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    ProfileRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ProfileActivity(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeActivity(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    // HomeDetailRoute.name: (routeData) {
    //   return _i6.AutoRoutePage<dynamic>(
    //     routeData: routeData,
    //     child: const _i4.HomeDetailActivity(),
    //   );
    // },
    // ScanRoute.name: (routeData) {
    //   return _i6.AutoRoutePage<dynamic>(
    //     routeData: routeData,
    //     child: const _i5.ScanActivity(),
    //   );
    // },
    // ScanSuksesRoute.name: (routeData) {
    //   return _i6.AutoRoutePage<dynamic>(
    //     routeData: routeData,
    //     child: const _i7.ScanSuksesActivity()(),
    //   );
    // },
  };
}

/// generated route for
/// [_i1.ProfileScreen]
class ProfileRoute extends _i6.PageRouteInfo<void> {
  const ProfileRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute({List<_i6.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.HomeDetailScreen]
// class HomeDetailRoute extends _i6.PageRouteInfo<void> {
//   const HomeDetailRoute({List<_i6.PageRouteInfo>? children})
//       : super(
//           HomeDetailRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'HomeDetailRoute';

//   static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
// }

/// generated route for
/// [_i5.ScanScreen]
// class ScanRoute extends _i6.PageRouteInfo<void> {
//   const ScanRoute({List<_i6.PageRouteInfo>? children})
//       : super(
//           ScanRoute.name,
//           initialChildren: children,
//         );

//   static const String name = 'ScanRoute';

//   static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
// }

class ScanSuksesRoute extends _i6.PageRouteInfo<void> {
  const ScanSuksesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ScanSuksesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScanSuksesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
