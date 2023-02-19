import 'package:allergy/screens/AllergyScreen.dart';
import 'package:allergy/widgets/text_field_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AddAllergyScreen extends StatefulWidget {
  const AddAllergyScreen({super.key});

  @override
  State<AddAllergyScreen> createState() => _AddAllergyScreenState();
}

class _AddAllergyScreenState extends State<AddAllergyScreen> {
  final TextEditingController _allergyController = TextEditingController();

  //clear the text box
  void dispose() {
    _allergyController.dispose();
  }

  //add an allergy once user enters it
  void addAllergy() {
    if (_allergyController.text.isNotEmpty) {
      //add to firebase
    }
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
                      //login button
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                              color: Colors.blue),
                          child: const Text("Add an allergy"),
                        ),
                      ),
                    ]))));
  }
}
