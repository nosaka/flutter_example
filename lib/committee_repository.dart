import 'dart:convert';

import 'package:http/http.dart' as http;

import 'github_repository.dart';

class CommitteesRepository {
  static const String URL =
      'https://api.github.com/search/repositories?q=test&sort=stars&order=desc';

  void sss() {}

  Future<List<GithubRepository>> find() async {
    final response = await http.get(URL);
    if (response.statusCode == 200) {
      List<GithubRepository> list = [];
      Map<String, dynamic> decoded = json.decode(response.body);
      for (var item in decoded['items']) {
        list.add(GithubRepository.fromJson(item));
      }
      return list;
    } else {
      throw Exception('Fail to search repository');
    }
  }
}
