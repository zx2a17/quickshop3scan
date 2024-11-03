import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:quickshop/pages/login/login_page.dart';
import 'package:quickshop/src/sample_feature/sample_item_list_view.dart';
import 'package:quickshop/src/settings/settings_controller.dart';
import 'package:quickshop/src/settings/settings_service.dart';
import 'package:quickshop/src/settings/settings_view.dart';

final settingsController = SettingsController(SettingsService());

class AppRouter {
  static final goRouter = GoRouter(
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
    redirect: (context, state) {
      if (FirebaseAuth.instance.currentUser == null) {
        return Routes.login;
      }
      return null;
    },
  );
}

class Routes {
  static const home = '/';
  static const login = '/login';
  static const settings = '/settings';
}
