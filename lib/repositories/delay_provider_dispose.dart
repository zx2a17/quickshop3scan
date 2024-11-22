import 'dart:async';

import 'package:riverpod/riverpod.dart';

extension DelayProviderDisposeExtension on Ref {
  /// Delay disposal of this provider for the specified [duration]. This means the provider state is
  /// maintained for the duration after all listeners have stopped listening to it, preventing
  /// the need to recompute the value from scratch if the user accesses the data again within the
  /// time period.
  ///
  /// Providers ignore updates from their upstream providers while they have no active listeners,
  /// so a provider in a delayed disposal state merely maintains the value it had when the last
  /// listener disconnected. If upstream data sources do change, the provider will not be updated
  /// until a new listener is added.
  void delayDispose(Duration duration) {
    KeepAliveLink? link;
    Timer? timer;

    // When the provider is paused, the keep alive link is created to maintain the provider state
    // until the duration elapses. Once the keep alive link is closed, if there are no new listeners
    // the provider will be disposed of (i.e. state will be removed from memory).
    // If a new listener is added then removed again before the original duration elapses, the
    // original keep alive link is closed and a new one is created while restarting the timer.
    onCancel(() {
      link?.close();
      timer?.cancel();
      link = keepAlive();
      timer = Timer(duration, () {
        link?.close();
        link = null;
        timer = null;
      });
    });
  }
}
