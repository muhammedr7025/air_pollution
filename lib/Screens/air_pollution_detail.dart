import 'package:flutter/material.dart';

class AirPollutionCausesPage extends StatelessWidget {
  const AirPollutionCausesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Causes of Air Pollution'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
                'Industrial emissions: Factories, power plants, and other industrial facilities release pollutants into the air during their operations.'),
            Text(
                'Transportation: Vehicles such as cars, buses, and airplanes emit pollutants into the air from their exhaust pipes.'),
            Text(
                'Burning fossil fuels: Burning coal, oil, and natural gas for energy releases pollutants into the air.'),
            Text(
                'Agriculture: Fertilizers, pesticides, and animal waste from farms can contribute to air pollution.'),
            Text(
                'Natural sources: Dust, smoke, and other particles from wildfires and dust storms can contribute to air pollution.'),
          ],
        ),
      ),
    );
  }
}
