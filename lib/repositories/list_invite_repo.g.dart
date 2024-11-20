// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_invite_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listInviteRepoHash() => r'd69162fed04f5613bb7b7ec20dfe70dec7431a01';

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

/// See also [listInviteRepo].
@ProviderFor(listInviteRepo)
const listInviteRepoProvider = ListInviteRepoFamily();

/// See also [listInviteRepo].
class ListInviteRepoFamily extends Family<AsyncValue<ListInvite?>> {
  /// See also [listInviteRepo].
  const ListInviteRepoFamily();

  /// See also [listInviteRepo].
  ListInviteRepoProvider call(
    String inviteId,
  ) {
    return ListInviteRepoProvider(
      inviteId,
    );
  }

  @override
  ListInviteRepoProvider getProviderOverride(
    covariant ListInviteRepoProvider provider,
  ) {
    return call(
      provider.inviteId,
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
  String? get name => r'listInviteRepoProvider';
}

/// See also [listInviteRepo].
class ListInviteRepoProvider extends AutoDisposeStreamProvider<ListInvite?> {
  /// See also [listInviteRepo].
  ListInviteRepoProvider(
    String inviteId,
  ) : this._internal(
          (ref) => listInviteRepo(
            ref as ListInviteRepoRef,
            inviteId,
          ),
          from: listInviteRepoProvider,
          name: r'listInviteRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listInviteRepoHash,
          dependencies: ListInviteRepoFamily._dependencies,
          allTransitiveDependencies:
              ListInviteRepoFamily._allTransitiveDependencies,
          inviteId: inviteId,
        );

  ListInviteRepoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inviteId,
  }) : super.internal();

  final String inviteId;

  @override
  Override overrideWith(
    Stream<ListInvite?> Function(ListInviteRepoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListInviteRepoProvider._internal(
        (ref) => create(ref as ListInviteRepoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inviteId: inviteId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<ListInvite?> createElement() {
    return _ListInviteRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListInviteRepoProvider && other.inviteId == inviteId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inviteId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListInviteRepoRef on AutoDisposeStreamProviderRef<ListInvite?> {
  /// The parameter `inviteId` of this provider.
  String get inviteId;
}

class _ListInviteRepoProviderElement
    extends AutoDisposeStreamProviderElement<ListInvite?>
    with ListInviteRepoRef {
  _ListInviteRepoProviderElement(super.provider);

  @override
  String get inviteId => (origin as ListInviteRepoProvider).inviteId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
