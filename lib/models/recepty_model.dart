import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<ReceptyVypis>> fetchAlbum(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://progresivneaplikacie.sk/project/fitness/novinky.json'));

  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<ReceptyVypis> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ReceptyVypis>((json) => ReceptyVypis.fromJson(json))
      .toList();
}

class ReceptyVypis {
  String nid;
  String imageUrl;
  String name;
  String shortDescription;
  String description;

  ReceptyVypis({
    required this.nid,
    required this.imageUrl,
    required this.name,
    required this.shortDescription,
    required this.description,
  });

  factory ReceptyVypis.fromJson(Map<String, dynamic> json) {
    return ReceptyVypis(
      nid: json['nid'] as String,
      imageUrl: json['Image'] as String,
      name: json['Title'] as String,
      shortDescription: json['DescriptionShort'] as String,
      description: json['Description'] as String,
    );
  }
}

// favorites
List<String> favoriteDataList = [];
