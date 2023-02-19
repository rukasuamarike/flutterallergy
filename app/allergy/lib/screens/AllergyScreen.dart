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
                      Flexible(child: Container(), flex: 2),
                      //add logo
                      const SizedBox(height: 64),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: Text("Add an allergy"),
                                padding: EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                child: Text("Delete an allergy"),
                                padding: EdgeInsets.symmetric(vertical: 8),
                              ),
                            ),
                          ]),
                    ]))));
  }
}
