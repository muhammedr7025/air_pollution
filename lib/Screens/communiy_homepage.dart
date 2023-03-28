import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'PostDetals/post_details.dart';
import 'addPost.dart';

class CommunityHomePage extends StatefulWidget {
  const CommunityHomePage({super.key});

  @override
  State<CommunityHomePage> createState() => _CommunityHomePageState();
}

class _CommunityHomePageState extends State<CommunityHomePage> {
  late Future future;
//  DocumentReference<Map<String, dynamic>> usId = FirebaseFirestore.instance.collection("users").doc();
  List<String> postsDetails = [];

  Future getUserDetail() async {
    await FirebaseFirestore.instance
        .collection("CommunityPost")
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
              postsDetails.add(element.reference.id);
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
                    itemCount: postsDetails.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: const CircleAvatar(child: Text("A")),
                          tileColor: Colors.purple[300],
                          title: PostDetails(
                            userId: postsDetails[index],
                          ),
                          // trailing: IconButton(
                          //     onPressed: () {
                          //       setState(() {
                          //         PostsDetails.removeAt(index);
                          //       });
                          //     },
                          //     icon: Icon(Icons.delete)),
                        ),
                      );
                    },
                  );
                })),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => (const AddPost()),
                ),
              );
            },
            child: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
    );
  }
}
