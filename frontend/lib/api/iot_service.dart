import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class IotService {
  final String baseUrl = 'http://127.0.0.1:8000';

  // Login with application/x-www-form-urlencoded
  Future<bool> login(String username, String password) async {
    final url = Uri.parse('$baseUrl/token/');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonDecode(response.body)['access_token']);
      await prefs.setString('username', jsonDecode(response.body)['username']);
      return true;
    } else {
      return false;
    }
  }

  // register with email and password
  Future<bool> register(String username, String email, String password) async {
    final url = Uri.parse('$baseUrl/users/');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': username,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  // Fetch environment data (temperature, pH, turbidity)
  Future<Map<String, dynamic>> fetchEnvData(String token) async {
    final url = Uri.parse('$baseUrl/env-data');

    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch environmental data: ${response.body}');
    }
  }

  // toggle device options
  Future<Map<String, dynamic>> toggle_uv(
      {required bool uv_state, required String token}) async {
    final url = Uri.parse('$baseUrl/device_control/uv');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(uv_state),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch environmental data: ${response.body}');
    }
  }

  // toggle device options
  Future<Map<String, dynamic>> toggle_sound(
      {required bool sound_state, required String token}) async {
    final url = Uri.parse('$baseUrl/device_control/sound');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(sound_state),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch environmental data: ${response.body}');
    }
  }

  // toggle device options
  Future<Map<String, dynamic>> toggle_fan(
      {required bool fan_state, required String token}) async {
    final url = Uri.parse('$baseUrl/device_control/fan');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(fan_state),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch environmental data: ${response.body}');
    }
  }
}
