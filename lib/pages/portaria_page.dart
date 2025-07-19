import 'package:flutter/material.dart';
import '../services/veiculo_service.dart';

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
      body: ListView.builder(
        itemCount: veiculos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(veiculos[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: carregarVeiculosNoPatio,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
