import 'package:air_pollution/Components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  final String userId;
  final String role;
  const ContactDetails({super.key, required this.userId, required this.role});

  //const UserName({Key? key, required this.UserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection("emergency_contact");
    return FutureBuilder<DocumentSnapshot>(
        future: user.doc(userId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return ListTile(
              title: Column(
                children: [
                  Text('Name : ${data['Name']}'),
                  Text('Role : ${data['role']}'),
                  Text('Phone number : ${data['phoneno']}'),
                ],
              ),
              tileColor: primaryclr,
              trailing: role == "admin"
                  ? IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
                  : const SizedBox(),
            );
          }
          return const Text("Loading");
        }));
  }
}
