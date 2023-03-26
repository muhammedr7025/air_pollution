import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String userId;

  const PostDetails({super.key, required this.userId});

  //const UserName({Key? key, required this.UserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection("CommunityPost");
    return FutureBuilder<DocumentSnapshot>(
        future: user.doc(userId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return ListTile(
              title: Text('tittle : ${data['tittle']}'),
              subtitle: Column(
                children: [
                  Text('description : ${data['description']}'),
                  Text('location : ${data['location']}'),
                ],
              ),
              tileColor: Colors.purple,
            );
          }
          return const Text("Loading");
        }));
  }
}
