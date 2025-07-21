import 'package:flutter/material.dart';
import 'portaria_page.dart';
import 'saida_page.dart';
import 'retorno_page.dart';
import 'cadastro_funcionario_page.dart';
import 'cadastro_veiculo_page.dart';
import 'veiculos_em_viagem_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCCCCCC), // Cinza claro
      appBar: AppBar(
        title: const Text('Portaria - Menu Principal'),
        backgroundColor: const Color(0xFF4D7408), // Verde institucional
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF905524), // Marrom AgroTerenas
        onPressed: () {
          // Pode colocar refresh ou ação futura aqui
        },
        child: const Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildButton(
              context,
              label: 'Listar Veículos no Pátio',
              page: const PortariaPage(),
            ),
            _buildButton(
              context,
              label: 'Veículos em Viagem',
              page: const VeiculosEmViagemPage(),
            ),
            _buildButton(
              context,
              label: 'Registrar Saída',
              page: const SaidaPage(),
            ),
            _buildButton(
              context,
              label: 'Registrar Retorno',
              page: const RetornoPage(),
            ),
            _buildButton(
              context,
              label: 'Cadastrar Veículo',
              page: const CadastroVeiculoPage(),
            ),
            _buildButton(
              context,
              label: 'Cadastrar Funcionário',
              page: const CadastroFuncionarioPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String label, required Widget page}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF4D7408),
          // Verde texto
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 2,
        ),
        child: Text(label, textAlign: TextAlign.center),
      ),
    );
  }
}
