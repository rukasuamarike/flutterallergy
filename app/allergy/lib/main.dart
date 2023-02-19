import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_camera_practice/home_page_dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const algScan());
  final cameras = await availableCameras();
}

await availableCameras().then(
  (value) => Navigator.push(
    context, MaterialPageRoute(
      builder: (_) => CameraPage(cameras: value)
    ),
  )
);

class algScan extends StatefulWidget{
  const algScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: 'Flutter Camera Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
