import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/menu.dart';
import '../models/berita.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<Menu>> fetchMenus() async {
    final response = await http.get(Uri.parse('$baseUrl/menus'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Menu.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load menus');
    }
  }

  Future<List<Berita>> fetchBerita() async {
    final response = await http.get(Uri.parse('$baseUrl/berita'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Berita.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load berita');
    }
  }

  Future<void> kirimAduan({
  required String token,
  required String nama,
  required String email,
  required String isi,
}) async {
  final response = await http.post(
    Uri.parse('$baseUrl/aduan'),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'nama': nama,
      'email': email,
      'isi': isi,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Gagal mengirim aduan: ${response.body}');
  }
}

Future<Map<String, dynamic>> fetchUser(String token) async {
  final response = await http.get(
    Uri.parse('$baseUrl/me'),
    headers: {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Gagal mengambil data user');
  }
}

}



