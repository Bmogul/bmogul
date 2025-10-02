
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class GitHubProvider extends ChangeNotifier {
  Map<String, dynamic>? _userData;
  List<dynamic>? _repos;
  bool _isLoading = false;
  String? _error;

  Map<String, dynamic>? get userData => _userData;
  List<dynamic>? get repos => _repos;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Use compile-time environment variables
  String get _token =>
      const String.fromEnvironment('API_GH_KEY', defaultValue: 'dev-api-key');
  String get _username =>
      const String.fromEnvironment('USERNAME_GH', defaultValue: 'dev-username');

  Map<String, String> get _headers => {
        'Authorization': 'Bearer $_token',
        'Accept': 'application/vnd.github.v3+json',
      };

  Future<void> loadGitHubData() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final res = await http.get(
        Uri.parse('https://api.github.com/users/$_username'),
        headers: _headers,
      );

      if (res.statusCode == 200) {
        _userData = jsonDecode(res.body);
      } else {
        _error = 'Error: ${res.statusCode}';
        print(_error);
      }
    } catch (e) {
      _error = e.toString();
      print('Exception: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadRepositories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final res = await http.get(
        Uri.parse(
            'https://api.github.com/users/$_username/repos?sort=updated&per_page=100'),
        headers: _headers,
      );

      if (res.statusCode == 200) {
        _repos = jsonDecode(res.body);
      } else {
        _error = 'Failed to load repositories: ${res.statusCode}';
        throw Exception(_error);
      }
    } catch (e) {
      _error = e.toString();
      print('Exception: $_error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

