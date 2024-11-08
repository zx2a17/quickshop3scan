import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'analytics/logger.dart';
import 'pages/favourites/favourites_page.dart';
import 'pages/home/home_page.dart';
import 'pages/lists/list_detail_page.dart';
import 'pages/lists/lists_page.dart';
import 'pages/lists/new_list_page.dart';
import 'pages/login/login_email_page.dart';
import 'pages/login/login_landing_page.dart';
import 'pages/login/login_name_page.dart';
import 'pages/recipes/new_recipe_page.dart';
import 'pages/recipes/recipe_detail_page.dart';
import 'pages/recipes/recipes_page.dart';
import 'pages/settings/settings_page.dart';
import 'repositories/user_repo.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  final loggedInNotifier = ValueNotifier<bool>(false);
  ref.listen<bool>(
    loggedInProvider,
    (_, loggedIn) => loggedInNotifier.value = loggedIn,
    fireImmediately: true,
  );
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) {
          return HomePage(navigationShell: shell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.lists,
                builder: (context, state) => const ListsPage(),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _rootNavigatorKey,
                    path: 'new',
                    builder: (context, state) => const NewListPage(),
                  ),
                  GoRoute(
                    path: ':listId',
                    builder: (context, state) => ListDetailPage(
                      listId: state.pathParameters['listId']!,
                    ),
                  )
                ],
              )
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.recipes,
                builder: (context, state) => const RecipesPage(),
                routes: [
                  GoRoute(
                    path: 'new',
                    builder: (context, state) => const NewRecipePage(),
                  ),
                  GoRoute(
                    path: ':recipeId',
                    builder: (context, state) => RecipeDetailPage(
                      recipeId: state.pathParameters['recipeId']!,
                    ),
                  )
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.favourites,
                builder: (context, state) => const FavouritesPage(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginLandingPage(),
        routes: [
          GoRoute(
            path: _RouteSegments.email,
            builder: (context, state) => const LoginEmailPage(),
          ),
          GoRoute(
            path: _RouteSegments.setName,
            builder: (context, state) => const LoginNamePage(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
    refreshListenable: loggedInNotifier,
    redirect: (context, state) {
      // Redirect unauthenticated users to login
      if (!loggedInNotifier.value && !state.uri.path.startsWith(Routes.login)) {
        ref.read(loggerProvider).log('Redirecting unauthenticated user to login');
        return Routes.login;
      }
      // Redirect home to lists
      if (state.uri.path == '/') {
        return Routes.lists;
      }
      return null;
    },
    observers: [
      SentryNavigatorObserver(),
    ],
  );
  ref.onDispose(loggedInNotifier.dispose);
  ref.onDispose(router.dispose);
  return router;
}

class _RouteSegments {
  static const login = 'login';
  static const setName = 'set-name';
  static const email = 'email';
  static const settings = 'settings';
  static const lists = 'lists';
  static const recipes = 'recipes';
  static const favourites = 'favourites';
  static const newItem = 'new';
}

class Routes {
  static const home = '/';
  static const login = '/${_RouteSegments.login}';
  static const loginEmail = '${Routes.login}/${_RouteSegments.email}';
  static const loginSetName = '${Routes.login}/${_RouteSegments.setName}';
  static const settings = '/${_RouteSegments.settings}';
  static const lists = '/${_RouteSegments.lists}';
  static const newList = '${Routes.lists}/${_RouteSegments.newItem}';
  static String listDetail(String listId) => '${Routes.lists}/$listId';
  static const recipes = '/${_RouteSegments.recipes}';
  static const newRecipe = '${Routes.recipes}/${_RouteSegments.newItem}';
  static String recipeDetail(String recipeId) => '${Routes.recipes}/$recipeId';
  static const favourites = '/${_RouteSegments.favourites}';
}
