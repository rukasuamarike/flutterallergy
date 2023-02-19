import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DisplayDanger extends StatefulWidget {
  const DisplayDanger({super.key});

  @override
  State<DisplayDanger> createState() => _DisplayDangerState();
}

class _DisplayDangerState extends State<DisplayDanger> {
  //receive list of dangerous ingredients to display
  Set getDangerous() {
    return {};
  }

  // Set ingredients = getDangerous();

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
