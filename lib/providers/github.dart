import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GitHubProvider extends ChangeNotifier {
  Map<String, dynamic>? _userData;
  List<dynamic>? _repos;
  bool _isLoading = false;
  String? _error;

  Map<String, dynamic>? get userData => _userData;
  List<dynamic>? get repos => _repos;
  bool get isLoading => _isLoading;
  String? get error => _error;

  String get _token => dotenv.env['API_GH_KEY'] ?? '';
  String get _username => dotenv.env['USERNAME_GH'] ?? '';

  Map<String, String> get _headers => {
    'Authorization': 'Bearer $_token',
    'Accept': 'application/vnd.github.v3+json',
  };

  Future<void> loadGitHubData() async {
    final res = await http.get(
      Uri.parse('https://api.github.com/users/$_username'),
      headers: _headers,
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      _userData = data;
      print('\nGITHUB DATA: $data\n');
    } else {
      print('Error: ${res.statusCode}');
    }
  }

  Future<void> loadRepositories() async {
    final res = await http.get(
      Uri.parse(
        'https://api.github.com/users/$_username/repos?sort=updated&per_page=100',
      ),
      headers: _headers,
    );

    if (res.statusCode == 200) {
      _repos = json.decode(res.body);
      print("\nGITHUB REPOS: ${_repos}");
    } else {
      throw Exception('Failed to load repositories: ${res.statusCode}');
    }
  }
}
