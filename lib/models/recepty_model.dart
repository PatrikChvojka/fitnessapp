import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<ReceptyVypis>> fetchAlbum(http.Client client) async {
  final response = await client.get(Uri.parse('https://progresivneaplikacie.sk/project/fitness/novinky.json'));

  return compute(parsePhotos, response.body);
}

// A function that converts a response body into a List<Photo>.
List<ReceptyVypis> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<ReceptyVypis>((json) => ReceptyVypis.fromJson(json)).toList();
}

class ReceptyVypis {
  String nid, imageUrl, name, shortDescription, description, Kategorie, Ingrediencie, Postup, porcii, cas, Bielkoviny, KCal, Sacharidy, Tuky, Vlaknina;

  ReceptyVypis({
    required this.nid,
    required this.imageUrl,
    required this.name,
    required this.shortDescription,
    required this.description,
    required this.Kategorie,
    required this.Ingrediencie,
    required this.Postup,
    required this.porcii,
    required this.cas,
    required this.Bielkoviny,
    required this.KCal,
    required this.Sacharidy,
    required this.Tuky,
    required this.Vlaknina,
  });

  factory ReceptyVypis.fromJson(Map<String, dynamic> json) {
    return ReceptyVypis(
      nid: json['nid'] as String,
      imageUrl: json['Image'] as String,
      name: json['Title'] as String,
      shortDescription: json['DescriptionShort'] as String,
      description: json['Description'] as String,
      Kategorie: json['Kategorie'] as String,
      Ingrediencie: json['Ingrediencie'] as String,
      Postup: json['Postup'] as String,
      porcii: json['porcii'] as String,
      cas: json['cas'] as String,
      Bielkoviny: json['Bielkoviny'] as String,
      KCal: json['KCal'] as String,
      Sacharidy: json['Sacharidy'] as String,
      Tuky: json['Tuky'] as String,
      Vlaknina: json['Vlaknina'] as String,
    );
  }
}

// favorites

// nacitat recepty z uložiska
loadData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getStringList('favoriteslistt') ?? '';
}

// ADD & REMOVE TO FAVORITES AND SAVE
Future<void> addRemoveToFavorites(String nid) async {
  List<String>? favoriteDataList = [];

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  favoriteDataList = prefs.getStringList('favoriteslistt');

  // add to list
  if (favoriteDataList != null) {
    if (!favoriteDataList!.contains(nid)) {
      favoriteDataList.add(nid);
    } else {
      favoriteDataList.remove(nid);
    }

    // add list to shared preferences
    await prefs.setStringList('favoriteslistt', favoriteDataList);
  } else {
    //firt time load
    List<String> favoriteDataList = [];
    favoriteDataList.add(nid);
    await prefs.setStringList('favoriteslistt', favoriteDataList);
  }
}
