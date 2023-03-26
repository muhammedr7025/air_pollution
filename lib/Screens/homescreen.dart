import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../UserDetails/UserName.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future future;
  DocumentReference<Map<String, dynamic>> usId =
      FirebaseFirestore.instance.collection("users").doc();
  final userId = FirebaseAuth.instance.currentUser!;
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
      appBar: AppBar(
        title: Text(
          "LOGGED IN AS: ${userId.email!}",
          style: const TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
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
                          leading: const CircleAvatar(child: Text("A")),
                          tileColor: Colors.purple[300],
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
