import 'package:allergy/widgets/text_field_input.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser() async {}

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
                      //logo
                      const SizedBox(height: 64),

                      //circular widget to accept and show our selected file
                      Stack(children: [
                        const SizedBox(height: 24),
                        //text field input for username
                        TextFieldInput(
                            textEditingController: _nameController,
                            hintText: 'Enter your name',
                            textInputType: TextInputType.text),
                        //add space between the text fields
                        const SizedBox(height: 24),
                        //text field for email
                        TextFieldInput(
                            textEditingController: _emailController,
                            hintText: 'Enter your email',
                            textInputType: TextInputType.emailAddress),
                        //add space between the text fields
                        const SizedBox(height: 24),
                        //text field for pw
                        TextFieldInput(
                          textEditingController: _passwordController,
                          hintText: 'Enter your password',
                          textInputType: TextInputType.text,
                          isPass: true,
                        ),

                        const SizedBox(height: 24),
                        //login button
                        InkWell(
                          onTap: () {},
                          child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4))),
                                  color: Colors.blue),
                              child: _isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                          color: Colors.white),
                                    )
                                  : const Text('Sign up')),
                        ),
                        const SizedBox(height: 12),
                        Flexible(child: Container(), flex: 2),

                        //sign up button
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: const Text("Already have an account?"),
                                ),
                              ),
                              Container(
                                  child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ))
                            ])
                      ])
                    ]))));
  }
}
