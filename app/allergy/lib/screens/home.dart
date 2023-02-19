import 'package:allergy/screens/LoginScreen.dart';
import 'package:allergy/screens/cameraPage.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SignUpScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    User? user = Provider.of<User?>(context);

    return (user != null)
        ? Scaffold(
            body: Container(
            child: Column(
              children: [
                Text("home"),
                ElevatedButton(
                    onPressed: () async => {
                          await availableCameras()
                              .then((value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            CameraPage(cameras: value)),
                                  ))
                        },
                    child: Text("open camera")),
              ],
            ),
          ))
        : SignUpScreen();
  }
}
