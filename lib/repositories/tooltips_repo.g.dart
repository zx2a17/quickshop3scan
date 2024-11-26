// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tooltips_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tooltipsRepoHash() => r'1663a2fd7e3b4b26f937664ae26c09ad9765397e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TooltipsRepo extends BuildlessAutoDisposeNotifier<bool> {
  late final TooltipType type;

  bool build(
    TooltipType type,
  );
}

/// See also [TooltipsRepo].
@ProviderFor(TooltipsRepo)
const tooltipsRepoProvider = TooltipsRepoFamily();

/// See also [TooltipsRepo].
class TooltipsRepoFamily extends Family<bool> {
  /// See also [TooltipsRepo].
  const TooltipsRepoFamily();

  /// See also [TooltipsRepo].
  TooltipsRepoProvider call(
    TooltipType type,
  ) {
    return TooltipsRepoProvider(
      type,
    );
  }

  @override
  TooltipsRepoProvider getProviderOverride(
    covariant TooltipsRepoProvider provider,
  ) {
    return call(
      provider.type,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tooltipsRepoProvider';
}

/// See also [TooltipsRepo].
class TooltipsRepoProvider
    extends AutoDisposeNotifierProviderImpl<TooltipsRepo, bool> {
  /// See also [TooltipsRepo].
  TooltipsRepoProvider(
    TooltipType type,
  ) : this._internal(
          () => TooltipsRepo()..type = type,
          from: tooltipsRepoProvider,
          name: r'tooltipsRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tooltipsRepoHash,
          dependencies: TooltipsRepoFamily._dependencies,
          allTransitiveDependencies:
              TooltipsRepoFamily._allTransitiveDependencies,
          type: type,
        );

  TooltipsRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final TooltipType type;

  @override
  bool runNotifierBuild(
    covariant TooltipsRepo notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(TooltipsRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: TooltipsRepoProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TooltipsRepo, bool> createElement() {
    return _TooltipsRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TooltipsRepoProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TooltipsRepoRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `type` of this provider.
  TooltipType get type;
}

class _TooltipsRepoProviderElement
    extends AutoDisposeNotifierProviderElement<TooltipsRepo, bool>
    with TooltipsRepoRef {
  _TooltipsRepoProviderElement(super.provider);

  @override
  TooltipType get type => (origin as TooltipsRepoProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
