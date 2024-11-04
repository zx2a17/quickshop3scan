import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:quickshop/analytics/logger.dart';
import 'package:quickshop/data/user.dart';
import 'package:quickshop/pages/login/login_page.dart';
import 'package:quickshop/src/sample_feature/sample_item_list_view.dart';
import 'package:quickshop/src/settings/settings_controller.dart';
import 'package:quickshop/src/settings/settings_service.dart';
import 'package:quickshop/src/settings/settings_view.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

part 'router.g.dart';

final settingsController = SettingsController(SettingsService());

@riverpod
GoRouter router(Ref ref) {
  final loggedInNotifier = ValueNotifier<bool>(false);
  ref.listen<bool>(
    loggedInProvider,
    (_, loggedIn) => loggedInNotifier.value = loggedIn,
    fireImmediately: true,
  );
  final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const SampleItemListView(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.settings,
        builder: (context, state) => SettingsView(controller: settingsController),
      ),
    ],
    refreshListenable: loggedInNotifier,
    redirect: (context, state) {
      if (!loggedInNotifier.value && state.uri.path != Routes.login) {
        ref.read(loggerProvider).log('Redirecting unauthenticated user to login');
        return Routes.login;
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

class Routes {
  static const home = '/';
  static const login = '/login';
  static const settings = '/settings';
}
