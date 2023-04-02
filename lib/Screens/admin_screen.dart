import 'package:air_pollution/Components/constants.dart';
import 'package:air_pollution/Screens/air_pollution_detail.dart';
import 'package:air_pollution/Screens/communiy_homepage.dart';
import 'package:air_pollution/Screens/emergency_contact.dart';
import 'package:air_pollution/Screens/users.dart';
import 'package:air_pollution/Screens/loginscreen.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 92,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    "https://cdn.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.webp"),
              ),
            ),
            const SizedBox(
              height: 10, //just for a padding
            ),
            const SizedBox(
              child: Text(
                "Admin",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
            ),
            const SizedBox(
              height: 26, //just for a padding
            ),
            const SizedBox(
              height: 35, //just for a padding
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  Material(
                    color: primaryclr,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      splashColor: secondaryclr,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const UsersList()));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.person,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Users",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: primaryclr,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      splashColor: secondaryclr,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CommunityHomePage()));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.post_add,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Community posts",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: primaryclr,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      splashColor: secondaryclr,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const About()));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.info,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "About",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: primaryclr,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      splashColor: secondaryclr,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmergencyContact(
                                      role1: "admin",
                                    )));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.call,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Emergency contacts",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: primaryclr,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      splashColor: secondaryclr,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const AirPollutionCausesPage()));
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.security,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Air pollution info",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    color: primaryclr,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: InkWell(
                      splashColor: secondaryclr,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      onTap: () {
                        signout(context);
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Icon(
                                Icons.logout,
                                color: Colors.grey[800],
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(Icons.navigate_next),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<void> signout(BuildContext ctx) async {
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => const LoginScreen()),
        (route) => false);
  }
}
