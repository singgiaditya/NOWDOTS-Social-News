// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_set_profile_picture_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterSetProfilePictureEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterSetProfilePictureRequestModel requestData)
        setProfilePicture,
    required TResult Function(String email) skipProfilePicture,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RegisterSetProfilePictureRequestModel requestData)?
        setProfilePicture,
    TResult? Function(String email)? skipProfilePicture,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterSetProfilePictureRequestModel requestData)?
        setProfilePicture,
    TResult Function(String email)? skipProfilePicture,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfilePicture value) setProfilePicture,
    required TResult Function(_SkipProfilePicture value) skipProfilePicture,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfilePicture value)? setProfilePicture,
    TResult? Function(_SkipProfilePicture value)? skipProfilePicture,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfilePicture value)? setProfilePicture,
    TResult Function(_SkipProfilePicture value)? skipProfilePicture,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterSetProfilePictureEventCopyWith<$Res> {
  factory $RegisterSetProfilePictureEventCopyWith(
          RegisterSetProfilePictureEvent value,
          $Res Function(RegisterSetProfilePictureEvent) then) =
      _$RegisterSetProfilePictureEventCopyWithImpl<$Res,
          RegisterSetProfilePictureEvent>;
}

/// @nodoc
class _$RegisterSetProfilePictureEventCopyWithImpl<$Res,
        $Val extends RegisterSetProfilePictureEvent>
    implements $RegisterSetProfilePictureEventCopyWith<$Res> {
  _$RegisterSetProfilePictureEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetProfilePictureImplCopyWith<$Res> {
  factory _$$SetProfilePictureImplCopyWith(_$SetProfilePictureImpl value,
          $Res Function(_$SetProfilePictureImpl) then) =
      __$$SetProfilePictureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterSetProfilePictureRequestModel requestData});
}

/// @nodoc
class __$$SetProfilePictureImplCopyWithImpl<$Res>
    extends _$RegisterSetProfilePictureEventCopyWithImpl<$Res,
        _$SetProfilePictureImpl>
    implements _$$SetProfilePictureImplCopyWith<$Res> {
  __$$SetProfilePictureImplCopyWithImpl(_$SetProfilePictureImpl _value,
      $Res Function(_$SetProfilePictureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestData = null,
  }) {
    return _then(_$SetProfilePictureImpl(
      null == requestData
          ? _value.requestData
          : requestData // ignore: cast_nullable_to_non_nullable
              as RegisterSetProfilePictureRequestModel,
    ));
  }
}

/// @nodoc

class _$SetProfilePictureImpl implements _SetProfilePicture {
  const _$SetProfilePictureImpl(this.requestData);

  @override
  final RegisterSetProfilePictureRequestModel requestData;

  @override
  String toString() {
    return 'RegisterSetProfilePictureEvent.setProfilePicture(requestData: $requestData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetProfilePictureImpl &&
            (identical(other.requestData, requestData) ||
                other.requestData == requestData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetProfilePictureImplCopyWith<_$SetProfilePictureImpl> get copyWith =>
      __$$SetProfilePictureImplCopyWithImpl<_$SetProfilePictureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterSetProfilePictureRequestModel requestData)
        setProfilePicture,
    required TResult Function(String email) skipProfilePicture,
  }) {
    return setProfilePicture(requestData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RegisterSetProfilePictureRequestModel requestData)?
        setProfilePicture,
    TResult? Function(String email)? skipProfilePicture,
  }) {
    return setProfilePicture?.call(requestData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterSetProfilePictureRequestModel requestData)?
        setProfilePicture,
    TResult Function(String email)? skipProfilePicture,
    required TResult orElse(),
  }) {
    if (setProfilePicture != null) {
      return setProfilePicture(requestData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfilePicture value) setProfilePicture,
    required TResult Function(_SkipProfilePicture value) skipProfilePicture,
  }) {
    return setProfilePicture(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfilePicture value)? setProfilePicture,
    TResult? Function(_SkipProfilePicture value)? skipProfilePicture,
  }) {
    return setProfilePicture?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfilePicture value)? setProfilePicture,
    TResult Function(_SkipProfilePicture value)? skipProfilePicture,
    required TResult orElse(),
  }) {
    if (setProfilePicture != null) {
      return setProfilePicture(this);
    }
    return orElse();
  }
}

abstract class _SetProfilePicture implements RegisterSetProfilePictureEvent {
  const factory _SetProfilePicture(
          final RegisterSetProfilePictureRequestModel requestData) =
      _$SetProfilePictureImpl;

  RegisterSetProfilePictureRequestModel get requestData;
  @JsonKey(ignore: true)
  _$$SetProfilePictureImplCopyWith<_$SetProfilePictureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SkipProfilePictureImplCopyWith<$Res> {
  factory _$$SkipProfilePictureImplCopyWith(_$SkipProfilePictureImpl value,
          $Res Function(_$SkipProfilePictureImpl) then) =
      __$$SkipProfilePictureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$SkipProfilePictureImplCopyWithImpl<$Res>
    extends _$RegisterSetProfilePictureEventCopyWithImpl<$Res,
        _$SkipProfilePictureImpl>
    implements _$$SkipProfilePictureImplCopyWith<$Res> {
  __$$SkipProfilePictureImplCopyWithImpl(_$SkipProfilePictureImpl _value,
      $Res Function(_$SkipProfilePictureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$SkipProfilePictureImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SkipProfilePictureImpl implements _SkipProfilePicture {
  const _$SkipProfilePictureImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterSetProfilePictureEvent.skipProfilePicture(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SkipProfilePictureImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SkipProfilePictureImplCopyWith<_$SkipProfilePictureImpl> get copyWith =>
      __$$SkipProfilePictureImplCopyWithImpl<_$SkipProfilePictureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterSetProfilePictureRequestModel requestData)
        setProfilePicture,
    required TResult Function(String email) skipProfilePicture,
  }) {
    return skipProfilePicture(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RegisterSetProfilePictureRequestModel requestData)?
        setProfilePicture,
    TResult? Function(String email)? skipProfilePicture,
  }) {
    return skipProfilePicture?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterSetProfilePictureRequestModel requestData)?
        setProfilePicture,
    TResult Function(String email)? skipProfilePicture,
    required TResult orElse(),
  }) {
    if (skipProfilePicture != null) {
      return skipProfilePicture(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetProfilePicture value) setProfilePicture,
    required TResult Function(_SkipProfilePicture value) skipProfilePicture,
  }) {
    return skipProfilePicture(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetProfilePicture value)? setProfilePicture,
    TResult? Function(_SkipProfilePicture value)? skipProfilePicture,
  }) {
    return skipProfilePicture?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetProfilePicture value)? setProfilePicture,
    TResult Function(_SkipProfilePicture value)? skipProfilePicture,
    required TResult orElse(),
  }) {
    if (skipProfilePicture != null) {
      return skipProfilePicture(this);
    }
    return orElse();
  }
}

abstract class _SkipProfilePicture implements RegisterSetProfilePictureEvent {
  const factory _SkipProfilePicture(final String email) =
      _$SkipProfilePictureImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$SkipProfilePictureImplCopyWith<_$SkipProfilePictureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterSetProfilePictureState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterSetProfilePictureResponseModel data)
        loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterSetProfilePictureStateCopyWith<$Res> {
  factory $RegisterSetProfilePictureStateCopyWith(
          RegisterSetProfilePictureState value,
          $Res Function(RegisterSetProfilePictureState) then) =
      _$RegisterSetProfilePictureStateCopyWithImpl<$Res,
          RegisterSetProfilePictureState>;
}

/// @nodoc
class _$RegisterSetProfilePictureStateCopyWithImpl<$Res,
        $Val extends RegisterSetProfilePictureState>
    implements $RegisterSetProfilePictureStateCopyWith<$Res> {
  _$RegisterSetProfilePictureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RegisterSetProfilePictureStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RegisterSetProfilePictureState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterSetProfilePictureResponseModel data)
        loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterSetProfilePictureState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$RegisterSetProfilePictureStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'RegisterSetProfilePictureState.loading()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterSetProfilePictureResponseModel data)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements RegisterSetProfilePictureState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterSetProfilePictureResponseModel data});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$RegisterSetProfilePictureStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RegisterSetProfilePictureResponseModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data);

  @override
  final RegisterSetProfilePictureResponseModel data;

  @override
  String toString() {
    return 'RegisterSetProfilePictureState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterSetProfilePictureResponseModel data)
        loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements RegisterSetProfilePictureState {
  const factory _Loaded(final RegisterSetProfilePictureResponseModel data) =
      _$LoadedImpl;

  RegisterSetProfilePictureResponseModel get data;
  @JsonKey(ignore: true)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$RegisterSetProfilePictureStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterSetProfilePictureState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(RegisterSetProfilePictureResponseModel data)
        loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(RegisterSetProfilePictureResponseModel data)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements RegisterSetProfilePictureState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
