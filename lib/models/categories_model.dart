import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<KategorieVypis>> fetchKategorie(http.Client client) async {
  final response = await client.get(Uri.parse(
      'https://progresivneaplikacie.sk/project/fitness/kategorie.json'));

  return compute(parseKategorie, response.body);
}

List<KategorieVypis> parseKategorie(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<KategorieVypis>((json) => KategorieVypis.fromJson(json))
      .toList();
}

class KategorieVypis {
  String name;

  KategorieVypis({
    required this.name,
  });

  factory KategorieVypis.fromJson(Map<String, dynamic> json) {
    return KategorieVypis(
      name: json['name'] as String,
    );
  }
}
