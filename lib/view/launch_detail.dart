import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_counter/models/launchpads.dart';
import 'package:http/http.dart' as http;

import '../models/spacex_latest.dart';

class LaunchDetail extends StatelessWidget {
  final SpacexLatest launch;
  const LaunchDetail({Key? key, required this.launch}) : super(key: key);

  Future<Lauchpad> fetchLaunchDetail(String launchpadsId) async {
    final response = await http.get(
        Uri.parse('https://api.spacexdata.com/v4/launchpads/$launchpadsId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return Lauchpad.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch launch details');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            launch.name.toString(),
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.blue[50],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder<Lauchpad>(
            future: fetchLaunchDetail(launch.launchpad.toString()),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // or a loading indicator
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                final launchpad = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LaunchPad :'),
                    Image.network(launchpad.images!.large.toString()),
                    Text_Detail('Launchpad', launchpad.name),
                    Text_Detail('Fight', launch.flightNumber.toString()),
                    Text_Detail('Detail', launch.details.toString()),
                    Text_Detail(
                        'Detail',
                        launchpad.images!.large!
                            .toString()
                            .replaceAll(RegExp(r'[\[\]]'), '')),

                    // Add more launch pad details as needed
                    // ...
                  ],
                );
              }
            },
          ),
        ));
  }

  Widget Text_Detail(String? tt, String? str) {
    return Text(
      '${tt} : ${str}',
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}
