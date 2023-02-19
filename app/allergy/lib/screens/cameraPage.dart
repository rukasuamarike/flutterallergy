import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:microphone/microphone.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/scheduler.dart';

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
  late MicrophoneRecorder _recorder;

  @override
  void initState() {
    super.initState();
    _initRecorder();
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
    _recorder.dispose();
    super.dispose();
  }

  void _initRecorder() {
    // Dispose the previous recorder.
    _recorder?.dispose();

    _recorder = MicrophoneRecorder()
      ..init()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return MaterialApp(
      home: CameraPreview(controller),
    );
  }
}
