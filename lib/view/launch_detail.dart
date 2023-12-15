import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_counter/models/launchpad/launchpads.dart';
import 'package:flutter_counter/models/playload/playload.dart';
import 'package:flutter_counter/models/rocket/rocket.dart';
import 'package:flutter_counter/models/spacexLatest/spacex_latest.dart';
import 'package:http/http.dart' as http;

class LaunchDetail extends StatelessWidget {
  final SpacexLatest launch;
  const LaunchDetail({Key? key, required this.launch}) : super(key: key);

  Future<Lauchpad> fetchLaunchPads(String launchpadsId) async {
    final response = await http.get(
        Uri.parse('https://api.spacexdata.com/v4/launchpads/$launchpadsId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return Lauchpad.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch launch details');
    }
  }

  Future<Rocket> fetchRocket(String rocketID) async {
    final response = await http
        .get(Uri.parse('https://api.spacexdata.com/v4/rockets/$rocketID'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return Rocket.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch Rocket');
    }
  }

  Future<Playload> fetchPlayLoad(String playloadID) async {
    final response = await http
        .get(Uri.parse('https://api.spacexdata.com/v4/payloads/$playloadID'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return Playload.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch Playload');
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<Lauchpad>(
                    future: fetchLaunchPads(
                      launch.launchpad.toString(),
                    ),
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
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Image.network(launchpad.images!.large
                                        .toString()
                                        .replaceAll(RegExp(r'[\[\]]'), '')),
                                  ),
                                  Text_Detail('Launchpad Name', launchpad.name),
                                  Text_Detail('Local', launchpad.locality),
                                  Text_Detail('Region', launchpad.region),
                                  Text_Detail('Time zone', launchpad.timezone),
                                  Text_Detail('Status', launchpad.status),
                                ],
                              ),
                            ),
                            Text_Detail(
                                'Fight', launch.flightNumber.toString()),
                          ],
                        );
                      }
                    },
                  ),
                  FutureBuilder<Rocket>(
                    future: fetchRocket(
                      launch.rocket.toString(),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // or a loading indicator
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final rocket = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text_Detail(
                                      'Rocket Name', rocket.name.toString()),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  FutureBuilder<Playload>(
                    future: fetchPlayLoad(
                      launch.payloads
                          .toString()
                          .replaceAll(RegExp(r'[\[\]]'), ''),
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // or a loading indicator
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final playload = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text_Detail('Playload Name', playload.name),
                                  Text_Detail(
                                      'Customer ',
                                      playload.customers
                                          .toString()
                                          .replaceAll(RegExp(r'[\[\]]'), '')),
                                  Text_Detail(
                                      'Manufacturers ',
                                      playload.manufacturers
                                          .toString()
                                          .replaceAll(RegExp(r'[\[\]]'), '')),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            )));
  }

  Widget Text_Detail(String? tt, String? str) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  // '${tt} : ${str}',
                  '${tt} :',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    // '${tt} : ${str}',
                    '${str}',
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
