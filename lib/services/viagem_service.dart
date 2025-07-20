import 'dart:convert';
import 'package:http/http.dart' as http;

class ViagemService {
  static const String baseUrl = 'http://10.0.2.2:8081';

  static Future<bool> registrarSaida({
    required String placaVeiculo,
    required int idMotorista,
    required String destino,
    required String passageiros,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/viagens/saida'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'placaVeiculo': placaVeiculo,
        'idMotorista': idMotorista,
        'destino': destino,
        'passageiros': passageiros,
      }),
    );

    return response.statusCode == 200;
  }
  static Future<bool> registrarRetorno(String placaVeiculo) async {
    final response = await http.post(
      Uri.parse('$baseUrl/viagens/retorno'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'placaVeiculo': placaVeiculo}),
    );

    return response.statusCode == 200;
  }

}
