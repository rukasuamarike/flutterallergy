import 'dart:typed_data';

import 'package:allergy/screens/PreviewPage.dart';
import 'package:allergy/widgets/imgfile.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/scheduler.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

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
      XFile k = await controller.takePicture();
      String b64_image =
          await k.readAsBytes().then((value) => base64Encode(value));

      var uri = 'http://127.0.0.1:5000/find-allergens-in-image';

      Map data = {
        'userID': 'VG7TtCGO49oNUZ8VFTuz',
        'allergens': [],
        'hasAllergens': false,
        'image': b64_image
      };
      var body = json.encode(data);

      var response = await http.post(Uri.parse(uri),
          headers: {"Content-Type": "application/json"}, body: body);
      // if (response.statusCode == 201) {
      var imgFile = ImgFile.fromJson(json.decode(response.body));
      var decoded = base64.decode(imgFile.image);

      final _directory = await getTemporaryDirectory();
      File file = await File('${_directory.path}/final-image.jpg').create();
      file.writeAsBytesSync(decoded);

      XFile final_image = XFile('${_directory.path}/final-image.jpg');
      // } else {
      //   throw Exception("failed to load picture");
      // }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PreviewPage(
                    picture: final_image,
                  )));
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
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
