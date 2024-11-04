import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analytics.g.dart';

@riverpod
Analytics analytics(Ref ref) {
  return Analytics._();
}

class Analytics {
  Analytics._();

  void logEvent(AnalyticsEvent event) {
    unawaited(FirebaseAnalytics.instance.logEvent(
      name: event.name,
      parameters: event.parameters,
    ));
  }
}

class AnalyticsEvent {
  final String name;
  final Map<String, Object> parameters;

  const AnalyticsEvent._(this.name, this.parameters);

  const AnalyticsEvent.login() : this._('login', const {});

  const AnalyticsEvent.logout() : this._('logout', const {});
}
