import 'package:allergy/screens/PreviewPage.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/scheduler.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class CameraApp extends StatefulWidget {
  /// Default Constructor

  const CameraApp({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;
  void _logError(String code, String? message) {
    // ignore: avoid_print
    print('Error: $code${message == null ? '' : '\nError Message: $message'}');
  }

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  Future takePicture() async {
    if (!controller.value.isInitialized) {
      return null;
    }
    if (controller.value.isTakingPicture) {
      return null;
    }
    try {
      await controller.setFlashMode(FlashMode.off);
      XFile picture = await controller.takePicture();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewPage(
                    picture: picture,
                  )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
                child: Stack(children: [
      CameraPreview(controller),
      Positioned(
          left: (MediaQuery.of(context).size.width / 2) - 10,
          bottom: MediaQuery.of(context).size.height / 5,
          child: Container(
              decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            color: Colors.white,
          ))),
      Positioned(
          left: (MediaQuery.of(context).size.width / 2) - 10,
          bottom: MediaQuery.of(context).size.height / 5,
          child: IconButton(
              iconSize: 20.0,
              onPressed: () => {takePicture()},
              icon: Icon(Icons.camera_alt_rounded))),
    ]))));
  }
}
