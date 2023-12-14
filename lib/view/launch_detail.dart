import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_counter/models/launchpads.dart';
import 'package:http/http.dart' as http;

import '../models/spacex_latest.dart';

class LaunchDetail extends StatelessWidget {
  final SpacexLatest launch;
  const LaunchDetail({Key? key, required this.launch}) : super(key: key);

  Future<Lauchpad> fetchLaunchDetail(String launchId) async {
    final response = await http
        .get(Uri.parse('https://api.spacexdata.com/v4/launches/$launchId'));

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text_Detail('Fight', launch.flightNumber.toString()),
            Text_Detail('Detail', launch.details.toString()),
            Text_Detail('launchpad', launch.launchpad.toString()),
            Text_Detail('launchpad', launch.crew.toString()),

            Padding(padding: const EdgeInsets.all(10)),

            // Add more details as needed
          ],
        ),
      ),
    );
  }

  Widget Text_Detail(String? tt, String? str) {
    return Text(
      '${tt} : ${str}',
      style: TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}
