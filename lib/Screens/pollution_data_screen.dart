import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Components/pollution_dialog.dart';
import '../keys.dart';

class PullutionDataScreen extends StatefulWidget {
  const PullutionDataScreen({Key? key}) : super(key: key);

  @override
  State<PullutionDataScreen> createState() => _PullutionDataScreenState();
}

class _PullutionDataScreenState extends State<PullutionDataScreen> {
  late Future _future;
  String state = '';
  String city = '';

  @override
  void initState() {
    super.initState();
    _future = getStates();
    // _locationController = TextEditingController();
  }

  Future<List<String>> getStates() async {
    const url = "http://api.airvisual.com/v2/states?country=India&key=$apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final states = data["data"] as List;
        return states.map((e) => e["state"] as String).toList();
      } else {
        debugPrint(response.body);
        throw (response.body);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<String>> getCities(String state) async {
    final url =
        "http://api.airvisual.com/v2/cities?state=$state&country=India&key=$apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final cities = data["data"] as List;
        return cities.map((e) => e["city"] as String).toList();
      } else {
        debugPrint(response.body);
        throw Exception("Error in getting cities");
      }
    } catch (e) {
      debugPrint("Error in getting cities");
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pollution Data'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: _future,
                builder: (_, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    if ((snapshot.error.toString())
                        .toLowerCase()
                        .contains("too many requests")) {
                      return const Center(
                          child: Text("Too many requests, try again later"));
                    }
                    return const Center(child: Text("Error in getting data"));
                  } else {
                    final data = snapshot.data as List<String>;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          title: Text(data[index]),
                          onTap: () {
                            if (state.isEmpty) {
                              setState(() {
                                state = data[index];
                                _future = getCities(data[index]);
                              });
                            } else {
                              city = data[index];
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return PollutionDataDialog(
                                        city: city, state: state);
                                  });
                            }
                          },
                        );
                      },
                    );
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _future = getStates();
                  state = '';
                });
              },
              child: const Text("Reset"),
            ),
          )
        ],
      ),
    );
  }
}
