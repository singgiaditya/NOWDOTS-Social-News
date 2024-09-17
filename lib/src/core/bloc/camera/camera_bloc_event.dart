part of 'camera_bloc.dart';

@freezed
class CameraBlocEvent with _$CameraBlocEvent {
  const factory CameraBlocEvent.initialized() = _Initialized;
  const factory CameraBlocEvent.captured() = _Captured;
  const factory CameraBlocEvent.toggleCamera() = _ToggleCamera;
  const factory CameraBlocEvent.toggleFlash() = _ToggleFlash;
  const factory CameraBlocEvent.disposeCamera() = _DisposeCamera;
  const factory CameraBlocEvent.retake() = _Retake;
}
