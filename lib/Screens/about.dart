import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'About',
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
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              children: const [
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Our team of environmental experts has developed this app with the goal of making air pollution data easily accessible to everyone. We believe that by providing this information, we can empower individuals and communities to take action to reduce air pollution and its harmful effects.\nOur app allows you to monitor air pollution levels in real-time and view historical data to track trends over time. We also provide educational resources to help you learn more about the causes and effects of air pollution, as well as ways you can reduce your exposure.\nIn addition to monitoring air pollution levels, our app also features a community forum where users can share information and tips for reducing air pollution in their neighborhoods. We believe that by working together, we can make a positive impact on the environment and improve the air quality in our communities.\nIf you have any questions or concerns about air pollution in your area, we encourage you to contact the relevant authorities. We provide a list of contact details for local and national agencies responsible for monitoring air quality and enforcing regulations.\nThank you for choosing our app to stay informed about air pollution levels in your area. We hope that our app will help you take steps to protect your health and improve the quality of the air we all breathe.\n',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Developed by:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '-Rahul',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '-Athul',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '',
                      style: TextStyle(
                        fontSize: 19,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
