// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listDetailViewModelHash() =>
    r'0128ca8330427a6c719a35ed4bfb901c4539be94';

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

/// See also [listDetailViewModel].
@ProviderFor(listDetailViewModel)
const listDetailViewModelProvider = ListDetailViewModelFamily();

/// See also [listDetailViewModel].
class ListDetailViewModelFamily extends Family<ListDetailViewModel> {
  /// See also [listDetailViewModel].
  const ListDetailViewModelFamily();

  /// See also [listDetailViewModel].
  ListDetailViewModelProvider call(
    String listId,
  ) {
    return ListDetailViewModelProvider(
      listId,
    );
  }

  @override
  ListDetailViewModelProvider getProviderOverride(
    covariant ListDetailViewModelProvider provider,
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
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listDetailViewModelProvider';
}

/// See also [listDetailViewModel].
class ListDetailViewModelProvider
    extends AutoDisposeProvider<ListDetailViewModel> {
  /// See also [listDetailViewModel].
  ListDetailViewModelProvider(
    String listId,
  ) : this._internal(
          (ref) => listDetailViewModel(
            ref as ListDetailViewModelRef,
            listId,
          ),
          from: listDetailViewModelProvider,
          name: r'listDetailViewModelProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listDetailViewModelHash,
          dependencies: ListDetailViewModelFamily._dependencies,
          allTransitiveDependencies:
              ListDetailViewModelFamily._allTransitiveDependencies,
          listId: listId,
        );

  ListDetailViewModelProvider._internal(
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
    ListDetailViewModel Function(ListDetailViewModelRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListDetailViewModelProvider._internal(
        (ref) => create(ref as ListDetailViewModelRef),
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
    return _ListDetailViewModelProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListDetailViewModelProvider && other.listId == listId;
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
mixin ListDetailViewModelRef on AutoDisposeProviderRef<ListDetailViewModel> {
  /// The parameter `listId` of this provider.
  String get listId;
}

class _ListDetailViewModelProviderElement
    extends AutoDisposeProviderElement<ListDetailViewModel>
    with ListDetailViewModelRef {
  _ListDetailViewModelProviderElement(super.provider);

  @override
  String get listId => (origin as ListDetailViewModelProvider).listId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
