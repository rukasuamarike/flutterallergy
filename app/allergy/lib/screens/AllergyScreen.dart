import 'package:allergy/screens/AddAllergyScreen.dart';
import 'package:allergy/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AllergyScreen extends StatefulWidget {
  const AllergyScreen({super.key});

  @override
  State<AllergyScreen> createState() => _AllergyScreenState();
}

class _AllergyScreenState extends State<AllergyScreen> {
  final TextEditingController _allergyController = TextEditingController();

  void dispose() {
    _allergyController.dispose();
  }

  void addAllergy() async {
    if (_allergyController.text.isNotEmpty) {
      //add allergy to firebase
    }
  }

  Set getAllergies() {
    //call firebase to get a set of allergies for the user
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AddAllergyScreen())),
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 5),
                                decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4))),
                                    color: Colors.blue),
                                child: const Text("Add an allergy"),
                              ),
                            ),
                          ]),
                    ]))));
  }
}
