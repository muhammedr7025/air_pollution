import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../keys.dart';

class PollutionDataDialog extends StatelessWidget {
  const PollutionDataDialog({
    super.key,
    required this.state,
    required this.city,
  });

  final String state;
  final String city;

  @override
  Widget build(BuildContext context) {
    Future<Map<String, dynamic>> getPollutionData() {
      final url =
          "http://api.airvisual.com/v2/city?city=$city&state=$state&country=India&key=$apiKey";
      try {
        return http.get(Uri.parse(url)).then((response) {
          if (response.statusCode == 200) {
            final data = jsonDecode(response.body);
            return data["data"]["current"]["pollution"] as Map<String, dynamic>;
          } else {
            throw Exception("Error in getting pollution data");
          }
        });
      } catch (e) {
        debugPrint("Error in getting pollution data");
        rethrow;
      }
    }

    String getAirQualityLevel(int aqi) {
      if (aqi >= 0 && aqi <= 50) {
        return "Good";
      } else if (aqi >= 51 && aqi <= 100) {
        return "Moderate";
      } else if (aqi >= 101 && aqi <= 150) {
        return "Unhealthy for Sensitive Groups";
      } else if (aqi >= 151 && aqi <= 200) {
        return "Unhealthy";
      } else if (aqi >= 201 && aqi <= 300) {
        return "Very Unhealthy";
      } else {
        return "Hazardous";
      }
    }

    return AlertDialog(
      title: Text(city),
      content: FutureBuilder(
          future: getPollutionData(),
          builder: (_, AsyncSnapshot snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: const CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error in getting data"));
            } else {
              final data = snapshot.data as Map<String, dynamic>;
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "Air Quality Level: ${getAirQualityLevel(data["aqius"])}"),
                  const SizedBox(height: 8),
                  Text("Air Quality Index: ${data["aqius"]}"),
                  const SizedBox(height: 8),
                  Text("Main pollutant: ${data["mainus"].toUpperCase()}"),
                ],
              );
            }
          }),
    );
  }
}
