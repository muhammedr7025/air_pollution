import 'package:air_pollution/Components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../UserDetails/user_name.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  late Future future;
  DocumentReference<Map<String, dynamic>> usId =
      FirebaseFirestore.instance.collection("users").doc();

  List<String> userDetails = [];

  Future getUserDetail() async {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              userDetails.add(element.reference.id);
            }));
  }

  @override
  void initState() {
    future = getUserDetail();
    super.initState();
  }

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          ListTile(
            title: const Text(
              'Users',
              style: TextStyle(fontSize: 27),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 27,
                )),
          ),
          Expanded(
            child: FutureBuilder(
                future: future,
                builder: ((context, snapshot) {
                  return ListView.builder(
                    itemCount: userDetails.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          dense: true,
                          visualDensity: const VisualDensity(vertical: 3),
                          leading: const Icon(Icons.person_2),
                          tileColor: primaryclr,
                          title: UserName(
                            userId: userDetails[index],
                          ),
                          trailing: IconButton(
                              onPressed: () {
                                setState(() {
                                  userDetails.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      );
                    },
                  );
                })),
          ),
        ],
      ),
    );
  }
}
