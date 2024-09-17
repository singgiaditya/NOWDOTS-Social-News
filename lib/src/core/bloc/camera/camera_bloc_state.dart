part of 'camera_bloc.dart';

@freezed
class CameraBlocState with _$CameraBlocState {
  const factory CameraBlocState.initial() = _Initial;
  const factory CameraBlocState.ready() = _Ready;
  const factory CameraBlocState.failure(String error) = _Failure;
  const factory CameraBlocState.closed() = _Closed;
  const factory CameraBlocState.captureInProgress() = _CaptureInProgress;
  const factory CameraBlocState.captureSuccess(XFile image) = _CaptureSuccess;
  const factory CameraBlocState.captureFailure() = _CaptureFailure;
}
