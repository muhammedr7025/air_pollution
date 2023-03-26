import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Components/TextField/text_field.dart';
import 'Package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailIdController = TextEditingController();

  final passController = TextEditingController();

  final nameController = TextEditingController();
  void userSignUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailIdController.text.trim(),
        password: passController.text.trim());
    Navigator.pop(context);
    addUserDetails(nameController.text.trim(), emailIdController.text.trim());
  }

  @override
  void dispose() {
    emailIdController.dispose();
    passController.dispose();
    super.dispose();
  }

  Future addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection("users").add({
      'Name ': name,
      'email': email,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bground.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Create Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LoginTextField(
                            controller: nameController,
                            hintText: 'Name',
                            labelText: 'Name',
                            obscureText: false,
                            obsuringCharacter: '',
                            icons: Icons.person,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginTextField(
                            controller: emailIdController,
                            hintText: 'Email',
                            labelText: 'Email id ',
                            obscureText: false,
                            obsuringCharacter: '',
                            icons: Icons.email,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginTextField(
                            controller: passController,
                            hintText: 'Password',
                            labelText: 'Password',
                            obscureText: true,
                            obsuringCharacter: '',
                            icons: Icons.key_sharp,
                          ),
                          const SizedBox(height: 40),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Sign In ",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.indigo,
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: userSignUp,
                                    icon: const Icon(Icons.arrow_forward),
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
