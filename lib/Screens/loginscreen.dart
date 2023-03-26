import 'package:firebase_auth/firebase_auth.dart';
import '../Components/TextField/text_field.dart';
import 'Package:flutter/material.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailIdController = TextEditingController();

  final passController = TextEditingController();

  void userSignIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailIdController.text.trim(),
        password: passController.text.trim());
    Navigator.pop(context);
  }

  @override
  void dispose() {
    emailIdController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: false,
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
                  flex: 3,
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
                          "Login",
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
                                    onPressed: userSignIn,
                                    icon: const Icon(Icons.arrow_forward),
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 60,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => const SignUp(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.black,
                                        fontSize: 18),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "forget Password",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.grey,
                                        fontSize: 18),
                                  ))
                            ],
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
