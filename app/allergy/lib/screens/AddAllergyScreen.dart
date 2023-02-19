import 'package:allergy/screens/AllergyScreen.dart';
import 'package:allergy/widgets/text_field_input.dart';
import 'package:allergy/widgets/user.dart';
import 'package:allergy/widgets/user.dart';
import 'package:allergy/widgets/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../widgets/user.dart';
import '../widgets/user.dart';

class AddAllergyScreen extends StatefulWidget {
  const AddAllergyScreen({super.key});

  @override
  State<AddAllergyScreen> createState() => _AddAllergyScreenState();
}

class _AddAllergyScreenState extends State<AddAllergyScreen> {
  String _allergyController = "";

  //clear the text box

  //add an allergy once user enters it
  void addAllergy(String uid, List<String> als) async {
    if (_allergyController.isNotEmpty) {
      List<String> cool = als;
      FirebaseFirestore.instance.collection("users").doc(uid);
      DocumentReference<Map<String, dynamic>> docref =
          FirebaseFirestore.instance.collection('users').doc(uid);
      Map<String, dynamic> data = {"allergies": cool};
      await docref.set(data, SetOptions(merge: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    List<String> bonk = [
      "egg",
      "nuts",
      "dairy",
      "shellfish",
      "sesame",
      "gluten",
      "soy",
      "avocado"
    ];

    List<String> adds = [];

    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SafeArea(
                          child: ListView.builder(
                              itemCount: bonk.length,
                              shrinkWrap: true,
                              itemBuilder: (context, i) => ListTile(
                                    title: Text(bonk[i]),
                                    onTap: () =>
                                        {_allergyController += '${bonk[i]},'},
                                  ))),
                      InkWell(
                        onTap: () {
                          addAllergy(user.uid, _allergyController.split(","));
                        },
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
