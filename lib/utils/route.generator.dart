import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:outalma/utils/constants.dart';
import 'package:outalma/views/screens/not_found_screen/not.found.screen.dart';
import 'package:outalma/views/screens/overview/overview.screen.dart';
import 'package:outalma/views/screens/search/search.screen.dart';

class RouteGenerator {
  static GoRouter returnRouter(bool isAuth) {
    GoRouter router = GoRouter(
      routes: [
        GoRoute(
          name: Constantes.overviewRouteName,
          path: '/overview',
          pageBuilder: (context, state) {
            return const MaterialPage(child: OverviewScreen());
          },
        ),
        GoRoute(
          name: Constantes.overviewRouteName,
          path: '/search',
          pageBuilder: (context, state) {
            return const MaterialPage(child: SearchScreen());
          },
        ),
        // GoRoute(
        //   name: MyAppRouteConstants.profileRouteName,
        //   path: '/profile/:username/:userid',
        //   pageBuilder: (context, state) {
        //     return MaterialPage(
        //         child: Profile(
        //       userid: state.params['userid']!,
        //       username: state.params['username']!,
        //     ));
        //   },
        // ),
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: NotFoundScreen());
      },
    );

    return router;
  }
}
