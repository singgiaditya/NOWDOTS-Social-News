// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CameraBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() captured,
    required TResult Function() toggleCamera,
    required TResult Function() toggleFlash,
    required TResult Function() disposeCamera,
    required TResult Function() retake,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? captured,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleFlash,
    TResult? Function()? disposeCamera,
    TResult? Function()? retake,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? captured,
    TResult Function()? toggleCamera,
    TResult Function()? toggleFlash,
    TResult Function()? disposeCamera,
    TResult Function()? retake,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Captured value) captured,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_Retake value) retake,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Captured value)? captured,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_ToggleFlash value)? toggleFlash,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_Retake value)? retake,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Captured value)? captured,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_Retake value)? retake,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraBlocEventCopyWith<$Res> {
  factory $CameraBlocEventCopyWith(
          CameraBlocEvent value, $Res Function(CameraBlocEvent) then) =
      _$CameraBlocEventCopyWithImpl<$Res, CameraBlocEvent>;
}

/// @nodoc
class _$CameraBlocEventCopyWithImpl<$Res, $Val extends CameraBlocEvent>
    implements $CameraBlocEventCopyWith<$Res> {
  _$CameraBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
          _$InitializedImpl value, $Res Function(_$InitializedImpl) then) =
      __$$InitializedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$CameraBlocEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
      _$InitializedImpl _value, $Res Function(_$InitializedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl();

  @override
  String toString() {
    return 'CameraBlocEvent.initialized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() captured,
    required TResult Function() toggleCamera,
    required TResult Function() toggleFlash,
    required TResult Function() disposeCamera,
    required TResult Function() retake,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? captured,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleFlash,
    TResult? Function()? disposeCamera,
    TResult? Function()? retake,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? captured,
    TResult Function()? toggleCamera,
    TResult Function()? toggleFlash,
    TResult Function()? disposeCamera,
    TResult Function()? retake,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Captured value) captured,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_Retake value) retake,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Captured value)? captured,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_ToggleFlash value)? toggleFlash,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_Retake value)? retake,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Captured value)? captured,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_Retake value)? retake,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements CameraBlocEvent {
  const factory _Initialized() = _$InitializedImpl;
}

/// @nodoc
abstract class _$$CapturedImplCopyWith<$Res> {
  factory _$$CapturedImplCopyWith(
          _$CapturedImpl value, $Res Function(_$CapturedImpl) then) =
      __$$CapturedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CapturedImplCopyWithImpl<$Res>
    extends _$CameraBlocEventCopyWithImpl<$Res, _$CapturedImpl>
    implements _$$CapturedImplCopyWith<$Res> {
  __$$CapturedImplCopyWithImpl(
      _$CapturedImpl _value, $Res Function(_$CapturedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CapturedImpl implements _Captured {
  const _$CapturedImpl();

  @override
  String toString() {
    return 'CameraBlocEvent.captured()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CapturedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() captured,
    required TResult Function() toggleCamera,
    required TResult Function() toggleFlash,
    required TResult Function() disposeCamera,
    required TResult Function() retake,
  }) {
    return captured();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? captured,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleFlash,
    TResult? Function()? disposeCamera,
    TResult? Function()? retake,
  }) {
    return captured?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? captured,
    TResult Function()? toggleCamera,
    TResult Function()? toggleFlash,
    TResult Function()? disposeCamera,
    TResult Function()? retake,
    required TResult orElse(),
  }) {
    if (captured != null) {
      return captured();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Captured value) captured,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_Retake value) retake,
  }) {
    return captured(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Captured value)? captured,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_ToggleFlash value)? toggleFlash,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_Retake value)? retake,
  }) {
    return captured?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Captured value)? captured,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_Retake value)? retake,
    required TResult orElse(),
  }) {
    if (captured != null) {
      return captured(this);
    }
    return orElse();
  }
}

abstract class _Captured implements CameraBlocEvent {
  const factory _Captured() = _$CapturedImpl;
}

/// @nodoc
abstract class _$$ToggleCameraImplCopyWith<$Res> {
  factory _$$ToggleCameraImplCopyWith(
          _$ToggleCameraImpl value, $Res Function(_$ToggleCameraImpl) then) =
      __$$ToggleCameraImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleCameraImplCopyWithImpl<$Res>
    extends _$CameraBlocEventCopyWithImpl<$Res, _$ToggleCameraImpl>
    implements _$$ToggleCameraImplCopyWith<$Res> {
  __$$ToggleCameraImplCopyWithImpl(
      _$ToggleCameraImpl _value, $Res Function(_$ToggleCameraImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleCameraImpl implements _ToggleCamera {
  const _$ToggleCameraImpl();

  @override
  String toString() {
    return 'CameraBlocEvent.toggleCamera()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleCameraImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() captured,
    required TResult Function() toggleCamera,
    required TResult Function() toggleFlash,
    required TResult Function() disposeCamera,
    required TResult Function() retake,
  }) {
    return toggleCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? captured,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleFlash,
    TResult? Function()? disposeCamera,
    TResult? Function()? retake,
  }) {
    return toggleCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? captured,
    TResult Function()? toggleCamera,
    TResult Function()? toggleFlash,
    TResult Function()? disposeCamera,
    TResult Function()? retake,
    required TResult orElse(),
  }) {
    if (toggleCamera != null) {
      return toggleCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Captured value) captured,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_Retake value) retake,
  }) {
    return toggleCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Captured value)? captured,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_ToggleFlash value)? toggleFlash,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_Retake value)? retake,
  }) {
    return toggleCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Captured value)? captured,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_Retake value)? retake,
    required TResult orElse(),
  }) {
    if (toggleCamera != null) {
      return toggleCamera(this);
    }
    return orElse();
  }
}

abstract class _ToggleCamera implements CameraBlocEvent {
  const factory _ToggleCamera() = _$ToggleCameraImpl;
}

/// @nodoc
abstract class _$$ToggleFlashImplCopyWith<$Res> {
  factory _$$ToggleFlashImplCopyWith(
          _$ToggleFlashImpl value, $Res Function(_$ToggleFlashImpl) then) =
      __$$ToggleFlashImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToggleFlashImplCopyWithImpl<$Res>
    extends _$CameraBlocEventCopyWithImpl<$Res, _$ToggleFlashImpl>
    implements _$$ToggleFlashImplCopyWith<$Res> {
  __$$ToggleFlashImplCopyWithImpl(
      _$ToggleFlashImpl _value, $Res Function(_$ToggleFlashImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToggleFlashImpl implements _ToggleFlash {
  const _$ToggleFlashImpl();

  @override
  String toString() {
    return 'CameraBlocEvent.toggleFlash()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToggleFlashImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() captured,
    required TResult Function() toggleCamera,
    required TResult Function() toggleFlash,
    required TResult Function() disposeCamera,
    required TResult Function() retake,
  }) {
    return toggleFlash();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? captured,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleFlash,
    TResult? Function()? disposeCamera,
    TResult? Function()? retake,
  }) {
    return toggleFlash?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? captured,
    TResult Function()? toggleCamera,
    TResult Function()? toggleFlash,
    TResult Function()? disposeCamera,
    TResult Function()? retake,
    required TResult orElse(),
  }) {
    if (toggleFlash != null) {
      return toggleFlash();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Captured value) captured,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_Retake value) retake,
  }) {
    return toggleFlash(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Captured value)? captured,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_ToggleFlash value)? toggleFlash,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_Retake value)? retake,
  }) {
    return toggleFlash?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Captured value)? captured,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_Retake value)? retake,
    required TResult orElse(),
  }) {
    if (toggleFlash != null) {
      return toggleFlash(this);
    }
    return orElse();
  }
}

abstract class _ToggleFlash implements CameraBlocEvent {
  const factory _ToggleFlash() = _$ToggleFlashImpl;
}

/// @nodoc
abstract class _$$DisposeCameraImplCopyWith<$Res> {
  factory _$$DisposeCameraImplCopyWith(
          _$DisposeCameraImpl value, $Res Function(_$DisposeCameraImpl) then) =
      __$$DisposeCameraImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DisposeCameraImplCopyWithImpl<$Res>
    extends _$CameraBlocEventCopyWithImpl<$Res, _$DisposeCameraImpl>
    implements _$$DisposeCameraImplCopyWith<$Res> {
  __$$DisposeCameraImplCopyWithImpl(
      _$DisposeCameraImpl _value, $Res Function(_$DisposeCameraImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DisposeCameraImpl implements _DisposeCamera {
  const _$DisposeCameraImpl();

  @override
  String toString() {
    return 'CameraBlocEvent.disposeCamera()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DisposeCameraImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() captured,
    required TResult Function() toggleCamera,
    required TResult Function() toggleFlash,
    required TResult Function() disposeCamera,
    required TResult Function() retake,
  }) {
    return disposeCamera();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? captured,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleFlash,
    TResult? Function()? disposeCamera,
    TResult? Function()? retake,
  }) {
    return disposeCamera?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? captured,
    TResult Function()? toggleCamera,
    TResult Function()? toggleFlash,
    TResult Function()? disposeCamera,
    TResult Function()? retake,
    required TResult orElse(),
  }) {
    if (disposeCamera != null) {
      return disposeCamera();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Captured value) captured,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_Retake value) retake,
  }) {
    return disposeCamera(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Captured value)? captured,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_ToggleFlash value)? toggleFlash,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_Retake value)? retake,
  }) {
    return disposeCamera?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Captured value)? captured,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_Retake value)? retake,
    required TResult orElse(),
  }) {
    if (disposeCamera != null) {
      return disposeCamera(this);
    }
    return orElse();
  }
}

abstract class _DisposeCamera implements CameraBlocEvent {
  const factory _DisposeCamera() = _$DisposeCameraImpl;
}

/// @nodoc
abstract class _$$RetakeImplCopyWith<$Res> {
  factory _$$RetakeImplCopyWith(
          _$RetakeImpl value, $Res Function(_$RetakeImpl) then) =
      __$$RetakeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RetakeImplCopyWithImpl<$Res>
    extends _$CameraBlocEventCopyWithImpl<$Res, _$RetakeImpl>
    implements _$$RetakeImplCopyWith<$Res> {
  __$$RetakeImplCopyWithImpl(
      _$RetakeImpl _value, $Res Function(_$RetakeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RetakeImpl implements _Retake {
  const _$RetakeImpl();

  @override
  String toString() {
    return 'CameraBlocEvent.retake()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RetakeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function() captured,
    required TResult Function() toggleCamera,
    required TResult Function() toggleFlash,
    required TResult Function() disposeCamera,
    required TResult Function() retake,
  }) {
    return retake();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function()? captured,
    TResult? Function()? toggleCamera,
    TResult? Function()? toggleFlash,
    TResult? Function()? disposeCamera,
    TResult? Function()? retake,
  }) {
    return retake?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function()? captured,
    TResult Function()? toggleCamera,
    TResult Function()? toggleFlash,
    TResult Function()? disposeCamera,
    TResult Function()? retake,
    required TResult orElse(),
  }) {
    if (retake != null) {
      return retake();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_Captured value) captured,
    required TResult Function(_ToggleCamera value) toggleCamera,
    required TResult Function(_ToggleFlash value) toggleFlash,
    required TResult Function(_DisposeCamera value) disposeCamera,
    required TResult Function(_Retake value) retake,
  }) {
    return retake(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_Captured value)? captured,
    TResult? Function(_ToggleCamera value)? toggleCamera,
    TResult? Function(_ToggleFlash value)? toggleFlash,
    TResult? Function(_DisposeCamera value)? disposeCamera,
    TResult? Function(_Retake value)? retake,
  }) {
    return retake?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_Captured value)? captured,
    TResult Function(_ToggleCamera value)? toggleCamera,
    TResult Function(_ToggleFlash value)? toggleFlash,
    TResult Function(_DisposeCamera value)? disposeCamera,
    TResult Function(_Retake value)? retake,
    required TResult orElse(),
  }) {
    if (retake != null) {
      return retake(this);
    }
    return orElse();
  }
}

abstract class _Retake implements CameraBlocEvent {
  const factory _Retake() = _$RetakeImpl;
}

/// @nodoc
mixin _$CameraBlocState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
    required TResult Function(String error) failure,
    required TResult Function() closed,
    required TResult Function() captureInProgress,
    required TResult Function(XFile image) captureSuccess,
    required TResult Function() captureFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
    TResult? Function(String error)? failure,
    TResult? Function()? closed,
    TResult? Function()? captureInProgress,
    TResult? Function(XFile image)? captureSuccess,
    TResult? Function()? captureFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    TResult Function(String error)? failure,
    TResult Function()? closed,
    TResult Function()? captureInProgress,
    TResult Function(XFile image)? captureSuccess,
    TResult Function()? captureFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Closed value) closed,
    required TResult Function(_CaptureInProgress value) captureInProgress,
    required TResult Function(_CaptureSuccess value) captureSuccess,
    required TResult Function(_CaptureFailure value) captureFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_CaptureInProgress value)? captureInProgress,
    TResult? Function(_CaptureSuccess value)? captureSuccess,
    TResult? Function(_CaptureFailure value)? captureFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ready value)? ready,
    TResult Function(_Failure value)? failure,
    TResult Function(_Closed value)? closed,
    TResult Function(_CaptureInProgress value)? captureInProgress,
    TResult Function(_CaptureSuccess value)? captureSuccess,
    TResult Function(_CaptureFailure value)? captureFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraBlocStateCopyWith<$Res> {
  factory $CameraBlocStateCopyWith(
          CameraBlocState value, $Res Function(CameraBlocState) then) =
      _$CameraBlocStateCopyWithImpl<$Res, CameraBlocState>;
}

/// @nodoc
class _$CameraBlocStateCopyWithImpl<$Res, $Val extends CameraBlocState>
    implements $CameraBlocStateCopyWith<$Res> {
  _$CameraBlocStateCopyWithImpl(this._value, this._then);

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
    extends _$CameraBlocStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CameraBlocState.initial()';
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
    required TResult Function() ready,
    required TResult Function(String error) failure,
    required TResult Function() closed,
    required TResult Function() captureInProgress,
    required TResult Function(XFile image) captureSuccess,
    required TResult Function() captureFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
    TResult? Function(String error)? failure,
    TResult? Function()? closed,
    TResult? Function()? captureInProgress,
    TResult? Function(XFile image)? captureSuccess,
    TResult? Function()? captureFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    TResult Function(String error)? failure,
    TResult Function()? closed,
    TResult Function()? captureInProgress,
    TResult Function(XFile image)? captureSuccess,
    TResult Function()? captureFailure,
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
    required TResult Function(_Ready value) ready,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Closed value) closed,
    required TResult Function(_CaptureInProgress value) captureInProgress,
    required TResult Function(_CaptureSuccess value) captureSuccess,
    required TResult Function(_CaptureFailure value) captureFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_CaptureInProgress value)? captureInProgress,
    TResult? Function(_CaptureSuccess value)? captureSuccess,
    TResult? Function(_CaptureFailure value)? captureFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ready value)? ready,
    TResult Function(_Failure value)? failure,
    TResult Function(_Closed value)? closed,
    TResult Function(_CaptureInProgress value)? captureInProgress,
    TResult Function(_CaptureSuccess value)? captureSuccess,
    TResult Function(_CaptureFailure value)? captureFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CameraBlocState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ReadyImplCopyWith<$Res> {
  factory _$$ReadyImplCopyWith(
          _$ReadyImpl value, $Res Function(_$ReadyImpl) then) =
      __$$ReadyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadyImplCopyWithImpl<$Res>
    extends _$CameraBlocStateCopyWithImpl<$Res, _$ReadyImpl>
    implements _$$ReadyImplCopyWith<$Res> {
  __$$ReadyImplCopyWithImpl(
      _$ReadyImpl _value, $Res Function(_$ReadyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReadyImpl implements _Ready {
  const _$ReadyImpl();

  @override
  String toString() {
    return 'CameraBlocState.ready()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReadyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
    required TResult Function(String error) failure,
    required TResult Function() closed,
    required TResult Function() captureInProgress,
    required TResult Function(XFile image) captureSuccess,
    required TResult Function() captureFailure,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
    TResult? Function(String error)? failure,
    TResult? Function()? closed,
    TResult? Function()? captureInProgress,
    TResult? Function(XFile image)? captureSuccess,
    TResult? Function()? captureFailure,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    TResult Function(String error)? failure,
    TResult Function()? closed,
    TResult Function()? captureInProgress,
    TResult Function(XFile image)? captureSuccess,
    TResult Function()? captureFailure,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Closed value) closed,
    required TResult Function(_CaptureInProgress value) captureInProgress,
    required TResult Function(_CaptureSuccess value) captureSuccess,
    required TResult Function(_CaptureFailure value) captureFailure,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_CaptureInProgress value)? captureInProgress,
    TResult? Function(_CaptureSuccess value)? captureSuccess,
    TResult? Function(_CaptureFailure value)? captureFailure,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ready value)? ready,
    TResult Function(_Failure value)? failure,
    TResult Function(_Closed value)? closed,
    TResult Function(_CaptureInProgress value)? captureInProgress,
    TResult Function(_CaptureSuccess value)? captureSuccess,
    TResult Function(_CaptureFailure value)? captureFailure,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class _Ready implements CameraBlocState {
  const factory _Ready() = _$ReadyImpl;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$CameraBlocStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'CameraBlocState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
    required TResult Function(String error) failure,
    required TResult Function() closed,
    required TResult Function() captureInProgress,
    required TResult Function(XFile image) captureSuccess,
    required TResult Function() captureFailure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
    TResult? Function(String error)? failure,
    TResult? Function()? closed,
    TResult? Function()? captureInProgress,
    TResult? Function(XFile image)? captureSuccess,
    TResult? Function()? captureFailure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    TResult Function(String error)? failure,
    TResult Function()? closed,
    TResult Function()? captureInProgress,
    TResult Function(XFile image)? captureSuccess,
    TResult Function()? captureFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Closed value) closed,
    required TResult Function(_CaptureInProgress value) captureInProgress,
    required TResult Function(_CaptureSuccess value) captureSuccess,
    required TResult Function(_CaptureFailure value) captureFailure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_CaptureInProgress value)? captureInProgress,
    TResult? Function(_CaptureSuccess value)? captureSuccess,
    TResult? Function(_CaptureFailure value)? captureFailure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ready value)? ready,
    TResult Function(_Failure value)? failure,
    TResult Function(_Closed value)? closed,
    TResult Function(_CaptureInProgress value)? captureInProgress,
    TResult Function(_CaptureSuccess value)? captureSuccess,
    TResult Function(_CaptureFailure value)? captureFailure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CameraBlocState {
  const factory _Failure(final String error) = _$FailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosedImplCopyWith<$Res> {
  factory _$$ClosedImplCopyWith(
          _$ClosedImpl value, $Res Function(_$ClosedImpl) then) =
      __$$ClosedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosedImplCopyWithImpl<$Res>
    extends _$CameraBlocStateCopyWithImpl<$Res, _$ClosedImpl>
    implements _$$ClosedImplCopyWith<$Res> {
  __$$ClosedImplCopyWithImpl(
      _$ClosedImpl _value, $Res Function(_$ClosedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClosedImpl implements _Closed {
  const _$ClosedImpl();

  @override
  String toString() {
    return 'CameraBlocState.closed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClosedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
    required TResult Function(String error) failure,
    required TResult Function() closed,
    required TResult Function() captureInProgress,
    required TResult Function(XFile image) captureSuccess,
    required TResult Function() captureFailure,
  }) {
    return closed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
    TResult? Function(String error)? failure,
    TResult? Function()? closed,
    TResult? Function()? captureInProgress,
    TResult? Function(XFile image)? captureSuccess,
    TResult? Function()? captureFailure,
  }) {
    return closed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    TResult Function(String error)? failure,
    TResult Function()? closed,
    TResult Function()? captureInProgress,
    TResult Function(XFile image)? captureSuccess,
    TResult Function()? captureFailure,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Closed value) closed,
    required TResult Function(_CaptureInProgress value) captureInProgress,
    required TResult Function(_CaptureSuccess value) captureSuccess,
    required TResult Function(_CaptureFailure value) captureFailure,
  }) {
    return closed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_CaptureInProgress value)? captureInProgress,
    TResult? Function(_CaptureSuccess value)? captureSuccess,
    TResult? Function(_CaptureFailure value)? captureFailure,
  }) {
    return closed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ready value)? ready,
    TResult Function(_Failure value)? failure,
    TResult Function(_Closed value)? closed,
    TResult Function(_CaptureInProgress value)? captureInProgress,
    TResult Function(_CaptureSuccess value)? captureSuccess,
    TResult Function(_CaptureFailure value)? captureFailure,
    required TResult orElse(),
  }) {
    if (closed != null) {
      return closed(this);
    }
    return orElse();
  }
}

abstract class _Closed implements CameraBlocState {
  const factory _Closed() = _$ClosedImpl;
}

/// @nodoc
abstract class _$$CaptureInProgressImplCopyWith<$Res> {
  factory _$$CaptureInProgressImplCopyWith(_$CaptureInProgressImpl value,
          $Res Function(_$CaptureInProgressImpl) then) =
      __$$CaptureInProgressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CaptureInProgressImplCopyWithImpl<$Res>
    extends _$CameraBlocStateCopyWithImpl<$Res, _$CaptureInProgressImpl>
    implements _$$CaptureInProgressImplCopyWith<$Res> {
  __$$CaptureInProgressImplCopyWithImpl(_$CaptureInProgressImpl _value,
      $Res Function(_$CaptureInProgressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CaptureInProgressImpl implements _CaptureInProgress {
  const _$CaptureInProgressImpl();

  @override
  String toString() {
    return 'CameraBlocState.captureInProgress()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CaptureInProgressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
    required TResult Function(String error) failure,
    required TResult Function() closed,
    required TResult Function() captureInProgress,
    required TResult Function(XFile image) captureSuccess,
    required TResult Function() captureFailure,
  }) {
    return captureInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
    TResult? Function(String error)? failure,
    TResult? Function()? closed,
    TResult? Function()? captureInProgress,
    TResult? Function(XFile image)? captureSuccess,
    TResult? Function()? captureFailure,
  }) {
    return captureInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    TResult Function(String error)? failure,
    TResult Function()? closed,
    TResult Function()? captureInProgress,
    TResult Function(XFile image)? captureSuccess,
    TResult Function()? captureFailure,
    required TResult orElse(),
  }) {
    if (captureInProgress != null) {
      return captureInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Closed value) closed,
    required TResult Function(_CaptureInProgress value) captureInProgress,
    required TResult Function(_CaptureSuccess value) captureSuccess,
    required TResult Function(_CaptureFailure value) captureFailure,
  }) {
    return captureInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_CaptureInProgress value)? captureInProgress,
    TResult? Function(_CaptureSuccess value)? captureSuccess,
    TResult? Function(_CaptureFailure value)? captureFailure,
  }) {
    return captureInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ready value)? ready,
    TResult Function(_Failure value)? failure,
    TResult Function(_Closed value)? closed,
    TResult Function(_CaptureInProgress value)? captureInProgress,
    TResult Function(_CaptureSuccess value)? captureSuccess,
    TResult Function(_CaptureFailure value)? captureFailure,
    required TResult orElse(),
  }) {
    if (captureInProgress != null) {
      return captureInProgress(this);
    }
    return orElse();
  }
}

abstract class _CaptureInProgress implements CameraBlocState {
  const factory _CaptureInProgress() = _$CaptureInProgressImpl;
}

/// @nodoc
abstract class _$$CaptureSuccessImplCopyWith<$Res> {
  factory _$$CaptureSuccessImplCopyWith(_$CaptureSuccessImpl value,
          $Res Function(_$CaptureSuccessImpl) then) =
      __$$CaptureSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile image});
}

/// @nodoc
class __$$CaptureSuccessImplCopyWithImpl<$Res>
    extends _$CameraBlocStateCopyWithImpl<$Res, _$CaptureSuccessImpl>
    implements _$$CaptureSuccessImplCopyWith<$Res> {
  __$$CaptureSuccessImplCopyWithImpl(
      _$CaptureSuccessImpl _value, $Res Function(_$CaptureSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$CaptureSuccessImpl(
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile,
    ));
  }
}

/// @nodoc

class _$CaptureSuccessImpl implements _CaptureSuccess {
  const _$CaptureSuccessImpl(this.image);

  @override
  final XFile image;

  @override
  String toString() {
    return 'CameraBlocState.captureSuccess(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaptureSuccessImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CaptureSuccessImplCopyWith<_$CaptureSuccessImpl> get copyWith =>
      __$$CaptureSuccessImplCopyWithImpl<_$CaptureSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
    required TResult Function(String error) failure,
    required TResult Function() closed,
    required TResult Function() captureInProgress,
    required TResult Function(XFile image) captureSuccess,
    required TResult Function() captureFailure,
  }) {
    return captureSuccess(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
    TResult? Function(String error)? failure,
    TResult? Function()? closed,
    TResult? Function()? captureInProgress,
    TResult? Function(XFile image)? captureSuccess,
    TResult? Function()? captureFailure,
  }) {
    return captureSuccess?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    TResult Function(String error)? failure,
    TResult Function()? closed,
    TResult Function()? captureInProgress,
    TResult Function(XFile image)? captureSuccess,
    TResult Function()? captureFailure,
    required TResult orElse(),
  }) {
    if (captureSuccess != null) {
      return captureSuccess(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Closed value) closed,
    required TResult Function(_CaptureInProgress value) captureInProgress,
    required TResult Function(_CaptureSuccess value) captureSuccess,
    required TResult Function(_CaptureFailure value) captureFailure,
  }) {
    return captureSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_CaptureInProgress value)? captureInProgress,
    TResult? Function(_CaptureSuccess value)? captureSuccess,
    TResult? Function(_CaptureFailure value)? captureFailure,
  }) {
    return captureSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ready value)? ready,
    TResult Function(_Failure value)? failure,
    TResult Function(_Closed value)? closed,
    TResult Function(_CaptureInProgress value)? captureInProgress,
    TResult Function(_CaptureSuccess value)? captureSuccess,
    TResult Function(_CaptureFailure value)? captureFailure,
    required TResult orElse(),
  }) {
    if (captureSuccess != null) {
      return captureSuccess(this);
    }
    return orElse();
  }
}

abstract class _CaptureSuccess implements CameraBlocState {
  const factory _CaptureSuccess(final XFile image) = _$CaptureSuccessImpl;

  XFile get image;
  @JsonKey(ignore: true)
  _$$CaptureSuccessImplCopyWith<_$CaptureSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CaptureFailureImplCopyWith<$Res> {
  factory _$$CaptureFailureImplCopyWith(_$CaptureFailureImpl value,
          $Res Function(_$CaptureFailureImpl) then) =
      __$$CaptureFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CaptureFailureImplCopyWithImpl<$Res>
    extends _$CameraBlocStateCopyWithImpl<$Res, _$CaptureFailureImpl>
    implements _$$CaptureFailureImplCopyWith<$Res> {
  __$$CaptureFailureImplCopyWithImpl(
      _$CaptureFailureImpl _value, $Res Function(_$CaptureFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CaptureFailureImpl implements _CaptureFailure {
  const _$CaptureFailureImpl();

  @override
  String toString() {
    return 'CameraBlocState.captureFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CaptureFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() ready,
    required TResult Function(String error) failure,
    required TResult Function() closed,
    required TResult Function() captureInProgress,
    required TResult Function(XFile image) captureSuccess,
    required TResult Function() captureFailure,
  }) {
    return captureFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? ready,
    TResult? Function(String error)? failure,
    TResult? Function()? closed,
    TResult? Function()? captureInProgress,
    TResult? Function(XFile image)? captureSuccess,
    TResult? Function()? captureFailure,
  }) {
    return captureFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? ready,
    TResult Function(String error)? failure,
    TResult Function()? closed,
    TResult Function()? captureInProgress,
    TResult Function(XFile image)? captureSuccess,
    TResult Function()? captureFailure,
    required TResult orElse(),
  }) {
    if (captureFailure != null) {
      return captureFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Ready value) ready,
    required TResult Function(_Failure value) failure,
    required TResult Function(_Closed value) closed,
    required TResult Function(_CaptureInProgress value) captureInProgress,
    required TResult Function(_CaptureSuccess value) captureSuccess,
    required TResult Function(_CaptureFailure value) captureFailure,
  }) {
    return captureFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Ready value)? ready,
    TResult? Function(_Failure value)? failure,
    TResult? Function(_Closed value)? closed,
    TResult? Function(_CaptureInProgress value)? captureInProgress,
    TResult? Function(_CaptureSuccess value)? captureSuccess,
    TResult? Function(_CaptureFailure value)? captureFailure,
  }) {
    return captureFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Ready value)? ready,
    TResult Function(_Failure value)? failure,
    TResult Function(_Closed value)? closed,
    TResult Function(_CaptureInProgress value)? captureInProgress,
    TResult Function(_CaptureSuccess value)? captureSuccess,
    TResult Function(_CaptureFailure value)? captureFailure,
    required TResult orElse(),
  }) {
    if (captureFailure != null) {
      return captureFailure(this);
    }
    return orElse();
  }
}

abstract class _CaptureFailure implements CameraBlocState {
  const factory _CaptureFailure() = _$CaptureFailureImpl;
}
