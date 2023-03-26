import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../Components/TextField/text_field.dart';
import 'Package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final tittleController = TextEditingController();

  final locationController = TextEditingController();

  final descriptionController = TextEditingController();
  Future addPosts() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });
    // await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: tittleController.text.trim(),
    //      password: locationController.text.trim());
    Navigator.pop(context);
    addUserDetails(tittleController.text.trim(), locationController.text.trim(),
        descriptionController.text.trim(), imageUrl);
  }

  @override
  void dispose() {
    tittleController.dispose();
    descriptionController.dispose();
    locationController.dispose();

    super.dispose();
  }

  Future addUserDetails(String tittle, String description, String location,
      String imageUrl) async {
    await FirebaseFirestore.instance.collection("CommunityPost").add({
      'tittle': tittle,
      'description': description,
      'location': location,
      'image': imageUrl,
    });
  }

  late String imageUrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          reverse: true,
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
                      children: [
                        const Text(
                          "add Post Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        IconButton(
                            onPressed: () async {
                              ImagePicker imagePicker = ImagePicker();
                              XFile? file = await imagePicker.pickImage(
                                  source: ImageSource.gallery);

                              if (file == null) return;
                              String uniqueFileName = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              Reference referenceRoot =
                                  FirebaseStorage.instance.ref();
                              Reference referenceDirImage =
                                  referenceRoot.child("PostImages");

                              Reference referenceImageToUpload =
                                  referenceDirImage.child(uniqueFileName);
                              try {
                                await referenceImageToUpload
                                    .putFile(File(file.path));
                              } catch (error) {
                                imageUrl = await referenceImageToUpload
                                    .getDownloadURL();
                              }
                            },
                            icon: const Icon(Icons.camera_alt)),
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
                            controller: tittleController,
                            hintText: 'Tittle',
                            labelText: 'Tittle',
                            obscureText: false,
                            obsuringCharacter: '',
                            icons: Icons.title,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginTextField(
                            controller: descriptionController,
                            hintText: 'Description',
                            labelText: 'Description ',
                            obscureText: false,
                            obsuringCharacter: '',
                            icons: Icons.description,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginTextField(
                            controller: locationController,
                            hintText: 'location',
                            labelText: 'location',
                            obscureText: false,
                            obsuringCharacter: '',
                            icons: Icons.location_city,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(height: 40),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Add Post ",
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.indigo,
                                  child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      addPosts();
                                      Navigator.pop(context);
                                    },
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
