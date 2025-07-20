import 'package:flutter/material.dart';
import 'portaria_page.dart';
import 'saida_page.dart';
import 'retorno_page.dart';
import 'cadastro_funcionario_page.dart';
import 'cadastro_veiculo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portaria - Menu Principal')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PortariaPage()));
              },
              child: const Text('Listar Veículos no Pátio'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const SaidaPage()));
              },
              child: const Text('Registrar Saída'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RetornoPage()));
              },
              child: const Text('Registrar Retorno'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CadastroVeiculoPage()));
              },
              child: const Text('Cadastrar Veículo'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CadastroFuncionarioPage()));
              },
              child: const Text('Cadastrar Funcionário'),
            ),
          ],
        ),
      ),
    );
  }
}
