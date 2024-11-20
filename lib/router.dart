import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'analytics/crash_reporter.dart';
import 'analytics/logger.dart';
import 'pages/favourites/favourites_page.dart';
import 'pages/home/home_page.dart';
import 'pages/lists/list_detail_page.dart';
import 'pages/lists/list_invite_details_page.dart';
import 'pages/lists/list_sharing_page.dart';
import 'pages/lists/lists_page.dart';
import 'pages/lists/new_list_page.dart';
import 'pages/login/login_email_page.dart';
import 'pages/login/login_landing_page.dart';
import 'pages/login/login_name_page.dart';
import 'pages/not_found/not_found_page.dart';
import 'pages/recipes/new_recipe_page.dart';
import 'pages/recipes/recipe_detail_page.dart';
import 'pages/recipes/recipes_page.dart';
import 'pages/settings/settings_page.dart';
import 'repositories/user_repo.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _listsNavigatorKey = GlobalKey<NavigatorState>();

/// The invite ID when a deep link to a list invite is opened, but the user must login first
/// before viewing the invite.
String? _pendingInviteId;

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
            navigatorKey: _listsNavigatorKey,
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
                    path: '${_RouteSegments.invites}/:inviteId',
                    builder: (context, state) => ListInviteDetailsPage(
                      inviteId: state.pathParameters['inviteId']!,
                    ),
                  ),
                  GoRoute(
                    path: ':listId',
                    builder: (context, state) => ListDetailPage(
                      listId: state.pathParameters['listId']!,
                    ),
                    routes: [
                      GoRoute(
                        path: _RouteSegments.share,
                        parentNavigatorKey: _rootNavigatorKey,
                        builder: (context, state) => ListSharingPage(
                          listId: state.pathParameters['listId']!,
                        ),
                      ),
                    ],
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
        builder: (context, state) => const LoginLandingPage(
          greetingType: LoginGreetingType.none,
        ),
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
        path: Routes.loginForInvite,
        builder: (context, state) => const LoginLandingPage(
          greetingType: LoginGreetingType.forInvite,
        ),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        path: Routes.notFound,
        builder: (context, state) => const NotFoundPage(),
      ),
    ],
    refreshListenable: loggedInNotifier,
    redirect: (context, state) {
      // Redirect a path of `/invites/xxx` to `/lists/invites/xxx`. The invite details page has
      // been defined in the routing configuration as a child route to the /lists page so that when
      // the app is opened from a deep link, go router automatically builds the /lists page
      // underneath the invite details page.
      final segments = state.uri.pathSegments;
      if (segments.length == 2 && segments[0] == _RouteSegments.invites) {
        return Routes.inviteDetails(segments[1]);
      }

      // Handle unauthenticated users
      if (!loggedInNotifier.value) {
        // Redirect unauthenticated users who have opened a list invite link to login first
        if (state.uri.path.startsWith(Routes.inviteDetails(''))) {
          ref.read(loggerProvider).log('Redirecting unauthenticated user to login');

          // Store the invite ID so the user can be redirected to the invite details after login
          _pendingInviteId = state.uri.pathSegments.last;
          return Routes.loginForInvite;
        }

        // Redirect unauthenticated users to login
        if (!state.uri.path.startsWith(Routes.login)) {
          ref.read(loggerProvider).log('Redirecting unauthenticated user to login');
          return Routes.login;
        }
      }

      // Handle redirection after login flow completed
      if (state.uri.path == Routes.postLogin) {
        // Redirect users that had opened a list invite link to view the invite details
        if (_pendingInviteId != null) {
          final inviteId = _pendingInviteId!;
          _pendingInviteId = null;
          return Routes.inviteDetails(inviteId);
        }

        // Otherwise redirect to the home page
        return Routes.home;
      }

      // Redirect home to lists subpath
      if (state.uri.path == Routes.home) {
        return Routes.lists;
      }
      return null;
    },
    observers: [
      SentryNavigatorObserver(),
    ],
    // Handle unknown routes with the not found page
    onException: (context, state, router) {
      ref.read(crashReporterProvider).report(state.error, StackTrace.current);
      router.push(Routes.notFound);
    },
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
  static const share = 'share';
  static const notFound = 'not-found';
  static const invites = 'invites';
}

class Routes {
  static const home = '/';
  static const login = '/${_RouteSegments.login}';

  /// A path that does not correspond to an actual page, but which allows the routing logic to
  /// decide if the user should be redirect to a particular page after logging in.
  static const postLogin = '/post-login';
  static const loginForInvite = '/${_RouteSegments.login}-invite';
  static const loginEmail = '${Routes.login}/${_RouteSegments.email}';
  static const loginSetName = '${Routes.login}/${_RouteSegments.setName}';
  static const settings = '/${_RouteSegments.settings}';
  static const lists = '/${_RouteSegments.lists}';
  static const newList = '${Routes.lists}/${_RouteSegments.newItem}';
  static String listDetail(String listId) => '${Routes.lists}/$listId';
  static String shareList(String listId) => '${Routes.listDetail(listId)}/${_RouteSegments.share}';
  static const recipes = '/${_RouteSegments.recipes}';
  static const newRecipe = '${Routes.recipes}/${_RouteSegments.newItem}';
  static String recipeDetail(String recipeId) => '${Routes.recipes}/$recipeId';
  static const favourites = '/${_RouteSegments.favourites}';
  static const notFound = '/${_RouteSegments.notFound}';
  static String inviteDetails(String inviteId) =>
      '${Routes.lists}/${_RouteSegments.invites}/$inviteId';
}
