import 'package:di/api_client.dart';
import 'package:di/github_user.dart';

class ApiService {
  static ApiService _instance = ApiService._();
  ApiService._();

  static ApiService get instance => _instance;

  Future<GithubUser> getGithubUser(String name) async =>
      GithubUser.fromJson(await ApiClient.instance.get("users/$name"));
/*
  Future<GithubUser> login(String email, String password) async =>
      GithubUser.fromJson(jsonDecode(await apiClient.get("users/$name")));

  Future<GithubUser> signup(String email, String password) async =>
      GithubUser.fromJson(jsonDecode(await apiClient.get("users/$name")));

  Future<GithubUser> categories(String email, String password) async =>
      GithubUser.fromJson(jsonDecode(await apiClient.get("users/$name")));
*/
}
