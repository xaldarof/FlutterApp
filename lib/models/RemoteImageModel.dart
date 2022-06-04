import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

Future<List<RemoteImageModel>> getPhotos() async {
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

  return compute(Photos_parser, response.body);
}

List<RemoteImageModel> Photos_parser(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed
      .map<RemoteImageModel>((json) => RemoteImageModel.fromJson(json))
      .toList();
}

class RemoteImageModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  RemoteImageModel(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  RemoteImageModel.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = albumId;
    data['id'] = id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }
}
