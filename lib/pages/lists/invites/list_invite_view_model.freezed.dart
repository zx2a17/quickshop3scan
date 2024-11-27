// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_invite_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ListInviteViewModel {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() notFound,
    required TResult Function(ListInvite invite) isOwner,
    required TResult Function(ListInvite invite) pending,
    required TResult Function(ListInvite invite) accepted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? notFound,
    TResult? Function(ListInvite invite)? isOwner,
    TResult? Function(ListInvite invite)? pending,
    TResult? Function(ListInvite invite)? accepted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? notFound,
    TResult Function(ListInvite invite)? isOwner,
    TResult Function(ListInvite invite)? pending,
    TResult Function(ListInvite invite)? accepted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_IsOwner value) isOwner,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Accepted value) accepted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_IsOwner value)? isOwner,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Accepted value)? accepted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_IsOwner value)? isOwner,
    TResult Function(_Pending value)? pending,
    TResult Function(_Accepted value)? accepted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListInviteViewModelCopyWith<$Res> {
  factory $ListInviteViewModelCopyWith(
          ListInviteViewModel value, $Res Function(ListInviteViewModel) then) =
      _$ListInviteViewModelCopyWithImpl<$Res, ListInviteViewModel>;
}

/// @nodoc
class _$ListInviteViewModelCopyWithImpl<$Res, $Val extends ListInviteViewModel>
    implements $ListInviteViewModelCopyWith<$Res> {
  _$ListInviteViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ListInviteViewModelCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl extends _Loading {
  const _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'ListInviteViewModel.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() notFound,
    required TResult Function(ListInvite invite) isOwner,
    required TResult Function(ListInvite invite) pending,
    required TResult Function(ListInvite invite) accepted,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? notFound,
    TResult? Function(ListInvite invite)? isOwner,
    TResult? Function(ListInvite invite)? pending,
    TResult? Function(ListInvite invite)? accepted,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? notFound,
    TResult Function(ListInvite invite)? isOwner,
    TResult Function(ListInvite invite)? pending,
    TResult Function(ListInvite invite)? accepted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_IsOwner value) isOwner,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Accepted value) accepted,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_IsOwner value)? isOwner,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Accepted value)? accepted,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_IsOwner value)? isOwner,
    TResult Function(_Pending value)? pending,
    TResult Function(_Accepted value)? accepted,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends ListInviteViewModel {
  const factory _Loading() = _$LoadingImpl;
  const _Loading._() : super._();
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ListInviteViewModelCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl extends _Error {
  const _$ErrorImpl() : super._();

  @override
  String toString() {
    return 'ListInviteViewModel.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() notFound,
    required TResult Function(ListInvite invite) isOwner,
    required TResult Function(ListInvite invite) pending,
    required TResult Function(ListInvite invite) accepted,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? notFound,
    TResult? Function(ListInvite invite)? isOwner,
    TResult? Function(ListInvite invite)? pending,
    TResult? Function(ListInvite invite)? accepted,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? notFound,
    TResult Function(ListInvite invite)? isOwner,
    TResult Function(ListInvite invite)? pending,
    TResult Function(ListInvite invite)? accepted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_IsOwner value) isOwner,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Accepted value) accepted,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_IsOwner value)? isOwner,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Accepted value)? accepted,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_IsOwner value)? isOwner,
    TResult Function(_Pending value)? pending,
    TResult Function(_Accepted value)? accepted,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error extends ListInviteViewModel {
  const factory _Error() = _$ErrorImpl;
  const _Error._() : super._();
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$ListInviteViewModelCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NotFoundImpl extends _NotFound {
  const _$NotFoundImpl() : super._();

  @override
  String toString() {
    return 'ListInviteViewModel.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() notFound,
    required TResult Function(ListInvite invite) isOwner,
    required TResult Function(ListInvite invite) pending,
    required TResult Function(ListInvite invite) accepted,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? notFound,
    TResult? Function(ListInvite invite)? isOwner,
    TResult? Function(ListInvite invite)? pending,
    TResult? Function(ListInvite invite)? accepted,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? notFound,
    TResult Function(ListInvite invite)? isOwner,
    TResult Function(ListInvite invite)? pending,
    TResult Function(ListInvite invite)? accepted,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_IsOwner value) isOwner,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Accepted value) accepted,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_IsOwner value)? isOwner,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Accepted value)? accepted,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_IsOwner value)? isOwner,
    TResult Function(_Pending value)? pending,
    TResult Function(_Accepted value)? accepted,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound extends ListInviteViewModel {
  const factory _NotFound() = _$NotFoundImpl;
  const _NotFound._() : super._();
}

/// @nodoc
abstract class _$$IsOwnerImplCopyWith<$Res> {
  factory _$$IsOwnerImplCopyWith(
          _$IsOwnerImpl value, $Res Function(_$IsOwnerImpl) then) =
      __$$IsOwnerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListInvite invite});

  $ListInviteCopyWith<$Res> get invite;
}

/// @nodoc
class __$$IsOwnerImplCopyWithImpl<$Res>
    extends _$ListInviteViewModelCopyWithImpl<$Res, _$IsOwnerImpl>
    implements _$$IsOwnerImplCopyWith<$Res> {
  __$$IsOwnerImplCopyWithImpl(
      _$IsOwnerImpl _value, $Res Function(_$IsOwnerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invite = null,
  }) {
    return _then(_$IsOwnerImpl(
      null == invite
          ? _value.invite
          : invite // ignore: cast_nullable_to_non_nullable
              as ListInvite,
    ));
  }

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListInviteCopyWith<$Res> get invite {
    return $ListInviteCopyWith<$Res>(_value.invite, (value) {
      return _then(_value.copyWith(invite: value));
    });
  }
}

/// @nodoc

class _$IsOwnerImpl extends _IsOwner {
  const _$IsOwnerImpl(this.invite) : super._();

  @override
  final ListInvite invite;

  @override
  String toString() {
    return 'ListInviteViewModel.isOwner(invite: $invite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsOwnerImpl &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invite);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IsOwnerImplCopyWith<_$IsOwnerImpl> get copyWith =>
      __$$IsOwnerImplCopyWithImpl<_$IsOwnerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() notFound,
    required TResult Function(ListInvite invite) isOwner,
    required TResult Function(ListInvite invite) pending,
    required TResult Function(ListInvite invite) accepted,
  }) {
    return isOwner(invite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? notFound,
    TResult? Function(ListInvite invite)? isOwner,
    TResult? Function(ListInvite invite)? pending,
    TResult? Function(ListInvite invite)? accepted,
  }) {
    return isOwner?.call(invite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? notFound,
    TResult Function(ListInvite invite)? isOwner,
    TResult Function(ListInvite invite)? pending,
    TResult Function(ListInvite invite)? accepted,
    required TResult orElse(),
  }) {
    if (isOwner != null) {
      return isOwner(invite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_IsOwner value) isOwner,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Accepted value) accepted,
  }) {
    return isOwner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_IsOwner value)? isOwner,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Accepted value)? accepted,
  }) {
    return isOwner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_IsOwner value)? isOwner,
    TResult Function(_Pending value)? pending,
    TResult Function(_Accepted value)? accepted,
    required TResult orElse(),
  }) {
    if (isOwner != null) {
      return isOwner(this);
    }
    return orElse();
  }
}

abstract class _IsOwner extends ListInviteViewModel {
  const factory _IsOwner(final ListInvite invite) = _$IsOwnerImpl;
  const _IsOwner._() : super._();

  ListInvite get invite;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IsOwnerImplCopyWith<_$IsOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PendingImplCopyWith<$Res> {
  factory _$$PendingImplCopyWith(
          _$PendingImpl value, $Res Function(_$PendingImpl) then) =
      __$$PendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListInvite invite});

  $ListInviteCopyWith<$Res> get invite;
}

/// @nodoc
class __$$PendingImplCopyWithImpl<$Res>
    extends _$ListInviteViewModelCopyWithImpl<$Res, _$PendingImpl>
    implements _$$PendingImplCopyWith<$Res> {
  __$$PendingImplCopyWithImpl(
      _$PendingImpl _value, $Res Function(_$PendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invite = null,
  }) {
    return _then(_$PendingImpl(
      null == invite
          ? _value.invite
          : invite // ignore: cast_nullable_to_non_nullable
              as ListInvite,
    ));
  }

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListInviteCopyWith<$Res> get invite {
    return $ListInviteCopyWith<$Res>(_value.invite, (value) {
      return _then(_value.copyWith(invite: value));
    });
  }
}

/// @nodoc

class _$PendingImpl extends _Pending {
  const _$PendingImpl(this.invite) : super._();

  @override
  final ListInvite invite;

  @override
  String toString() {
    return 'ListInviteViewModel.pending(invite: $invite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PendingImpl &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invite);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PendingImplCopyWith<_$PendingImpl> get copyWith =>
      __$$PendingImplCopyWithImpl<_$PendingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() notFound,
    required TResult Function(ListInvite invite) isOwner,
    required TResult Function(ListInvite invite) pending,
    required TResult Function(ListInvite invite) accepted,
  }) {
    return pending(invite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? notFound,
    TResult? Function(ListInvite invite)? isOwner,
    TResult? Function(ListInvite invite)? pending,
    TResult? Function(ListInvite invite)? accepted,
  }) {
    return pending?.call(invite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? notFound,
    TResult Function(ListInvite invite)? isOwner,
    TResult Function(ListInvite invite)? pending,
    TResult Function(ListInvite invite)? accepted,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(invite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_IsOwner value) isOwner,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Accepted value) accepted,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_IsOwner value)? isOwner,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Accepted value)? accepted,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_IsOwner value)? isOwner,
    TResult Function(_Pending value)? pending,
    TResult Function(_Accepted value)? accepted,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _Pending extends ListInviteViewModel {
  const factory _Pending(final ListInvite invite) = _$PendingImpl;
  const _Pending._() : super._();

  ListInvite get invite;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PendingImplCopyWith<_$PendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AcceptedImplCopyWith<$Res> {
  factory _$$AcceptedImplCopyWith(
          _$AcceptedImpl value, $Res Function(_$AcceptedImpl) then) =
      __$$AcceptedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ListInvite invite});

  $ListInviteCopyWith<$Res> get invite;
}

/// @nodoc
class __$$AcceptedImplCopyWithImpl<$Res>
    extends _$ListInviteViewModelCopyWithImpl<$Res, _$AcceptedImpl>
    implements _$$AcceptedImplCopyWith<$Res> {
  __$$AcceptedImplCopyWithImpl(
      _$AcceptedImpl _value, $Res Function(_$AcceptedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invite = null,
  }) {
    return _then(_$AcceptedImpl(
      null == invite
          ? _value.invite
          : invite // ignore: cast_nullable_to_non_nullable
              as ListInvite,
    ));
  }

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ListInviteCopyWith<$Res> get invite {
    return $ListInviteCopyWith<$Res>(_value.invite, (value) {
      return _then(_value.copyWith(invite: value));
    });
  }
}

/// @nodoc

class _$AcceptedImpl extends _Accepted {
  const _$AcceptedImpl(this.invite) : super._();

  @override
  final ListInvite invite;

  @override
  String toString() {
    return 'ListInviteViewModel.accepted(invite: $invite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcceptedImpl &&
            (identical(other.invite, invite) || other.invite == invite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invite);

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AcceptedImplCopyWith<_$AcceptedImpl> get copyWith =>
      __$$AcceptedImplCopyWithImpl<_$AcceptedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() error,
    required TResult Function() notFound,
    required TResult Function(ListInvite invite) isOwner,
    required TResult Function(ListInvite invite) pending,
    required TResult Function(ListInvite invite) accepted,
  }) {
    return accepted(invite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function()? error,
    TResult? Function()? notFound,
    TResult? Function(ListInvite invite)? isOwner,
    TResult? Function(ListInvite invite)? pending,
    TResult? Function(ListInvite invite)? accepted,
  }) {
    return accepted?.call(invite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? error,
    TResult Function()? notFound,
    TResult Function(ListInvite invite)? isOwner,
    TResult Function(ListInvite invite)? pending,
    TResult Function(ListInvite invite)? accepted,
    required TResult orElse(),
  }) {
    if (accepted != null) {
      return accepted(invite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_IsOwner value) isOwner,
    required TResult Function(_Pending value) pending,
    required TResult Function(_Accepted value) accepted,
  }) {
    return accepted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_IsOwner value)? isOwner,
    TResult? Function(_Pending value)? pending,
    TResult? Function(_Accepted value)? accepted,
  }) {
    return accepted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_IsOwner value)? isOwner,
    TResult Function(_Pending value)? pending,
    TResult Function(_Accepted value)? accepted,
    required TResult orElse(),
  }) {
    if (accepted != null) {
      return accepted(this);
    }
    return orElse();
  }
}

abstract class _Accepted extends ListInviteViewModel {
  const factory _Accepted(final ListInvite invite) = _$AcceptedImpl;
  const _Accepted._() : super._();

  ListInvite get invite;

  /// Create a copy of ListInviteViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AcceptedImplCopyWith<_$AcceptedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
