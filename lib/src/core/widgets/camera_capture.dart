import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nowdots_social_news/src/config/themes/app_colors.dart';
import 'package:nowdots_social_news/src/config/themes/app_textstyles.dart';
import 'package:nowdots_social_news/src/core/bloc/camera/camera_bloc.dart';
import 'package:nowdots_social_news/src/core/utils/image_picker_gallery_camera.dart';
import 'package:nowdots_social_news/src/injection_container.dart';

class CameraCapture extends StatefulWidget {
  const CameraCapture({super.key});

  @override
  State<CameraCapture> createState() => _CameraCaptureState();
}

class _CameraCaptureState extends State<CameraCapture> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CameraBloc>(
      create: (context) => sl<CameraBloc>()..add(CameraBlocEvent.initialized()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocConsumer<CameraBloc, CameraBlocState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () {
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              ready: () {
                return _buildBody();
              },
              failure: (error) => Center(
                child: Text("$error"),
              ),
              captureSuccess: (image) {
                return Stack(
                  children: [
                    Center(
                      child: Image.file(File(image.path)),
                    ),
                    Positioned(
                      top: 30,
                      left: 21,
                      right: 21,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 35,
                            height: 35,
                            child: IconButton.filled(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      primaryColor.withOpacity(0.8))),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.clear_outlined,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 21,
                      right: 21,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  context
                                      .read<CameraBloc>()
                                      .add(CameraBlocEvent.retake());
                                },
                                child: Text(
                                  "Retake",
                                  style: subtitleProximaNovaTextStyle.copyWith(
                                      fontSize: 17, color: Colors.white),
                                )),
                            SizedBox(
                                height: 35,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.white)),
                                    onPressed: () {
                                      Navigator.pop(context, image);
                                    },
                                    child: Text(
                                      "Use",
                                      style:
                                          subtitleProximaNovaTextStyle.copyWith(
                                              fontSize: 18,
                                              color: primaryColor),
                                    ))),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _buildFlashIcon(FlashMode flashmode) {
  if (flashmode == FlashMode.auto) {
    return Icon(
      Icons.flash_auto_outlined,
      color: Colors.white,
      size: 18,
    );
  }
  if (flashmode == FlashMode.always) {
    return Icon(
      Icons.flash_on_outlined,
      color: Colors.white,
      size: 18,
    );
  }
  if (flashmode == FlashMode.torch) {
    return Icon(
      Icons.flashlight_on_outlined,
      color: Colors.white,
      size: 18,
    );
  }
  if (flashmode == FlashMode.off) {
    return Icon(
      Icons.flash_off_outlined,
      color: Colors.white,
      size: 18,
    );
  }
  return Icon(
    Icons.flash_off_outlined,
    color: Colors.white,
    size: 18,
  );
}

class _buildBody extends StatelessWidget {
  const _buildBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
              child: CameraPreview(context.read<CameraBloc>().getController())),
          Positioned(
            top: 30,
            left: 21,
            right: 21,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: IconButton.filled(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            primaryColor.withOpacity(0.8))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.clear_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                SizedBox(
                  width: 35,
                  height: 35,
                  child: IconButton.filled(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            primaryColor.withOpacity(0.8))),
                    onPressed: () {
                      context
                          .read<CameraBloc>()
                          .add(CameraBlocEvent.toggleFlash());
                      print(context
                          .read<CameraBloc>()
                          .getController()
                          .value
                          .flashMode);
                    },
                    icon: _buildFlashIcon(context
                        .read<CameraBloc>()
                        .getController()
                        .value
                        .flashMode),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton.filled(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              primaryColor.withOpacity(0.8))),
                      onPressed: () async {
                        var image = await ImagePickerGalleryCamera
                            .pickImageFromGallery();
                        if (image != null) {
                          Navigator.pop(context, image);
                        }
                      },
                      icon: Icon(
                        Icons.image_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<CameraBloc>()
                          .add(CameraBlocEvent.captured());
                    },
                    child: Container(
                      width: 65,
                      height: 65,
                      padding: EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: IconButton.filled(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              primaryColor.withOpacity(0.8))),
                      onPressed: () {
                        context
                            .read<CameraBloc>()
                            .add(CameraBlocEvent.toggleCamera());
                      },
                      icon: Icon(
                        Icons.cameraswitch_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
