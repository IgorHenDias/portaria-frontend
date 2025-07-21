import 'package:flutter/material.dart';
import '../services/veiculo_service.dart';

class VeiculosEmViagemPage extends StatefulWidget {
  const VeiculosEmViagemPage({super.key});

  @override
  State<VeiculosEmViagemPage> createState() => _VeiculosEmViagemPageState();
}

class _VeiculosEmViagemPageState extends State<VeiculosEmViagemPage> {
  List<String> veiculos = [];

  Future<void> carregarVeiculosEmViagem() async {
    final resultado = await VeiculoService.getVeiculosPorStatus("EM_VIAGEM");
    setState(() {
      veiculos = resultado;
    });
  }

  @override
  void initState() {
    super.initState();
    carregarVeiculosEmViagem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Veículos em Viagem')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: veiculos.isEmpty
            ? const Center(child: Text('Nenhum veículo em viagem.'))
            : ListView.builder(
                itemCount: veiculos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(veiculos[index]),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: carregarVeiculosEmViagem,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
