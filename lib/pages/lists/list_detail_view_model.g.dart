// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listDetailPageStateHash() => r'746c3945bcbcb7f2362d5ada2c8166672a7d80ed';

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

/// See also [listDetailPageState].
@ProviderFor(listDetailPageState)
const listDetailPageStateProvider = ListDetailPageStateFamily();

/// See also [listDetailPageState].
class ListDetailPageStateFamily extends Family<ListDetailViewModel> {
  /// See also [listDetailPageState].
  const ListDetailPageStateFamily();

  /// See also [listDetailPageState].
  ListDetailPageStateProvider call(
    String listId,
  ) {
    return ListDetailPageStateProvider(
      listId,
    );
  }

  @override
  ListDetailPageStateProvider getProviderOverride(
    covariant ListDetailPageStateProvider provider,
  ) {
    return call(
      provider.listId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'listDetailPageStateProvider';
}

/// See also [listDetailPageState].
class ListDetailPageStateProvider extends AutoDisposeProvider<ListDetailViewModel> {
  /// See also [listDetailPageState].
  ListDetailPageStateProvider(
    String listId,
  ) : this._internal(
          (ref) => listDetailPageState(
            ref as ListDetailPageStateRef,
            listId,
          ),
          from: listDetailPageStateProvider,
          name: r'listDetailPageStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$listDetailPageStateHash,
          dependencies: ListDetailPageStateFamily._dependencies,
          allTransitiveDependencies: ListDetailPageStateFamily._allTransitiveDependencies,
          listId: listId,
        );

  ListDetailPageStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.listId,
  }) : super.internal();

  final String listId;

  @override
  Override overrideWith(
    ListDetailViewModel Function(ListDetailPageStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListDetailPageStateProvider._internal(
        (ref) => create(ref as ListDetailPageStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        listId: listId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ListDetailViewModel> createElement() {
    return _ListDetailPageStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListDetailPageStateProvider && other.listId == listId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, listId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListDetailPageStateRef on AutoDisposeProviderRef<ListDetailViewModel> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ListDetailPageStateProviderElement extends AutoDisposeProviderElement<ListDetailViewModel>
    with ListDetailPageStateRef {
  _ListDetailPageStateProviderElement(super.provider);

  @override
  String get listId => (origin as ListDetailPageStateProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
