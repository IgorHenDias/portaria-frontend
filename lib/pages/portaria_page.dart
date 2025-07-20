import 'package:flutter/material.dart';
import '../services/veiculo_service.dart';
import 'saida_page.dart';
import 'retorno_page.dart';

class PortariaPage extends StatefulWidget {
  const PortariaPage({super.key});

  @override
  State<PortariaPage> createState() => _PortariaPageState();
}

class _PortariaPageState extends State<PortariaPage> {
  List<String> veiculos = [];

  Future<void> carregarVeiculosNoPatio() async {
    final resultado = await VeiculoService.getVeiculosPorStatus("NO_PATIO");
    setState(() {
      veiculos = resultado;
    });
  }

  @override
  void initState() {
    super.initState();
    carregarVeiculosNoPatio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Portaria - Veículos no Pátio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SaidaPage()),
                );
              },
              child: const Text('Registrar Saída'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RetornoPage()),
                );
              },
              child: const Text('Registrar Retorno'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: veiculos.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(veiculos[index]),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: carregarVeiculosNoPatio,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
