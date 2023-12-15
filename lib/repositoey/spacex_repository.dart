import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/spacex_past/spacex_latest.dart';

abstract class LaunchRepository {
  Future<List<SpacexLatest>> fetchLaunches();
  Future<SpacexLatest> fetchLaunchDetail(String launchId);
}

class LaunchRepositoryImpl implements LaunchRepository {
  @override
  Future<List<SpacexLatest>> fetchLaunches() async {
    final response =
        await http.get(Uri.parse('https://api.spacexdata.com/v4/launches'));

    if (response.statusCode == 200) {
      final jsonDataList = json.decode(response.body) as List;
      return jsonDataList.map((data) => SpacexLatest.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch launches');
    }
  }

  @override
  Future<SpacexLatest> fetchLaunchDetail(String launchId) async {
    final response = await http
        .get(Uri.parse('https://api.spacexdata.com/v4/launches/$launchId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body) as Map<String, dynamic>;
      return SpacexLatest.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch launch details');
    }
  }
}
