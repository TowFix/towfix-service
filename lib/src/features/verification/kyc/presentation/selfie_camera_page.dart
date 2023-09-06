import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../core/constants/assets/images.dart';

class SelfieCameraPage extends ConsumerStatefulWidget {
  const SelfieCameraPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelfieCameraPageState();
}

class _SelfieCameraPageState extends ConsumerState<SelfieCameraPage> {
  late CameraController cameraController;
  final isLoading = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await requestCameraPermission();

      await initCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          print('object');
        },
        child: Stack(
          children: [
            ValueListenableBuilder<bool>(
                valueListenable: isLoading,
                builder: (context, loading, _) {
                  return loading
                      ? GestureDetector(
                          onTap: () {
                            isLoading.value = false;
                            log('object');
                          },
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Stack(children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: CameraPreview(cameraController)),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              top: 0,
                              right: 0,
                              child: Image.asset(Images.faceShape,
                                  fit: BoxFit.cover)),
                          Positioned(
                              bottom: 30,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  radius: 30,
                                  child: IconButton(
                                    onPressed: () async {
                                      final image =
                                          await cameraController.takePicture();

                                      // await Navigator.pushReplacement(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             CardDetailsPage(
                                      //                 image: image.path)));
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )),
                          Positioned(
                              bottom: 100,
                              left: 0,
                              right: 0,
                              child: Card(
                                elevation: 0,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  child: Center(
                                    child: Text(
                                      "Frame your ID card in the box.\nAll four corners should be visible.  Make sure it's centered and in focus.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                        ]);
                }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isDenied) {
      await Permission.camera.request();
    }
  }

  Future<void> initCamera() async {
    try {
      final cameras = await availableCameras();
      final front = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.back);
      cameraController = CameraController(front, ResolutionPreset.max);
      await cameraController.initialize();

      isLoading.value = false;
      return;
    } catch (e) {
      return;
    }
  }
}
