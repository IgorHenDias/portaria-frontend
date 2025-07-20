import 'dart:convert';
import 'package:http/http.dart' as http;

class FuncionarioService {
  static const String baseUrl = 'http://10.0.2.2:8081';

  static Future<bool> cadastrarFuncionario({
    required String nome,
    required String cnh,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/funcionarios'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nome': nome,
        'cnh': cnh,
      }),
    );

    return response.statusCode == 200 || response.statusCode == 201;
  }
}
