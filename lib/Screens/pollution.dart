import 'package:flutter/material.dart';

class Pollution extends StatefulWidget {
  const Pollution({super.key});

  @override
  State<Pollution> createState() => _PollutionState();
}

class _PollutionState extends State<Pollution> {
  late TextEditingController searchController;
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TextField(
            controller: searchController,
          ),
        ],
      )),
    );
  }
}
