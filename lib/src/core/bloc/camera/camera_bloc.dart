import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:camera/camera.dart';

part 'camera_bloc_event.dart';
part 'camera_bloc_state.dart';
part 'camera_bloc.freezed.dart';

class CameraBloc extends Bloc<CameraBlocEvent, CameraBlocState> {
  late CameraController _cameraController;
  late List<CameraDescription> cameras;
  late FlashMode flashMode;
  CameraBloc() : super(_Initial()) {
    on<_Initialized>((event, emit) async {
      try {
        cameras = await availableCameras();
        flashMode = FlashMode.auto;
        _cameraController =
            CameraController(cameras.first, ResolutionPreset.max);
        await _cameraController.initialize();
        try {
          await _cameraController.setFlashMode(flashMode);
        } on CameraException catch (e) {
          flashMode = FlashMode.off;
          await _cameraController.setFlashMode(flashMode);
          print('Error: ${e.description}');
        }
        if (_cameraController.value.isInitialized) {
          emit(_Ready());
        } else {
          emit(_Failure("Something went wrong"));
        }
      } on CameraException catch (e) {
        emit(_Failure("${e.description}"));
      }
    });
    on<_ToggleCamera>((event, emit) async {
      emit(_Initial());
      if (cameras.length < 2) {
        emit(_Ready());
        return;
      }
      final lensDirection = _cameraController.description.lensDirection;
      CameraController newController;
      if (lensDirection == CameraLensDirection.front) {
        newController = CameraController(
          cameras.first,
          ResolutionPreset.max,
        );
      } else {
        newController = CameraController(
          cameras.last,
          ResolutionPreset.max,
        );
      }

      _cameraController = newController;
      try {
        await _cameraController.initialize();
        if (_cameraController.value.isInitialized) {
          try {
            await _cameraController.setFlashMode(flashMode);
          } on CameraException catch (e) {
            flashMode = FlashMode.off;
            await _cameraController.setFlashMode(flashMode);
            print('Error: ${e.description}');
          }
          emit(_Ready());
        } else {
          emit(_Failure("Something went wrong"));
        }
      } on CameraException catch (e) {
        emit(_Failure("${e.description}"));
      }
    });
    on<_ToggleFlash>((event, emit) {
      emit(_Initial());
      try {
        if (_cameraController.value.flashMode == FlashMode.off) {
          flashMode = FlashMode.auto;
        }
        if (_cameraController.value.flashMode == FlashMode.auto) {
          flashMode = FlashMode.always;
        }
        if (_cameraController.value.flashMode == FlashMode.always) {
          flashMode = FlashMode.torch;
        }
        if (_cameraController.value.flashMode == FlashMode.torch) {
          flashMode = FlashMode.off;
        }
        _cameraController.setFlashMode(flashMode);
        emit(_Ready());
      } on CameraException catch (e) {
        _cameraController.setFlashMode(FlashMode.off);
        print("Error: ${e.description}");
        emit(_Ready());
      }
    });
    on<_Captured>((event, emit) async {
      emit(_CaptureInProgress());
      try {
        XFile image = await _cameraController.takePicture();
        emit(_CaptureSuccess(image));
      } on CameraException catch (e) {
        emit(_CaptureFailure());
        print("Error: ${e}");
      }
    });
    on<_Retake>((event, emit) {
      emit(_Ready());
    });
    on<_DisposeCamera>((event, emit) async {
      await _cameraController.dispose();
      emit(_Closed());
    });
  }
  CameraController getController() => _cameraController;
  List<CameraDescription> getCamera() => cameras;

  @override
  Future<void> close() {
    _cameraController.dispose();
    return super.close();
  }
}
