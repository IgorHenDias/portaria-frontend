import 'dart:convert';
import 'package:http/http.dart' as http;

class VeiculoService {
  static const String baseUrl = 'http://10.0.2.2:8081';

  static Future<List<String>> getVeiculosPorStatus(String status) async {
    final response =
        await http.get(Uri.parse('$baseUrl/viagens/veiculos?status=$status'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((item) => item['placa'].toString()).toList();
    } else {
      return [];
    }
  }

  static Future<bool> cadastrarVeiculo({
    required String placa,
    required String modelo,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/veiculos'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'placa': placa,
        'modelo': modelo,
      }),
    );

    return response.statusCode == 200 || response.statusCode == 201;
  }
}
