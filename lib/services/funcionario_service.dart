import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/funcionario.dart';

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

  static Future<List<Funcionario>> getFuncionarios() async {
    final response = await http.get(Uri.parse('$baseUrl/viagens/funcionarios'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Funcionario.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao buscar funcionários');
    }
  }
}
