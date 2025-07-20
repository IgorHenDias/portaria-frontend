import 'package:flutter/material.dart';
import '../services/viagem_service.dart';

class SaidaPage extends StatefulWidget {
  const SaidaPage({super.key});

  @override
  State<SaidaPage> createState() => _SaidaPageState();
}

class _SaidaPageState extends State<SaidaPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _motoristaController = TextEditingController();
  final TextEditingController _destinoController = TextEditingController();
  final TextEditingController _passageirosController = TextEditingController();

  Future<void> _enviarSaida() async {
    if (_formKey.currentState!.validate()) {
      final sucesso = await ViagemService.registrarSaida(
        placaVeiculo: _placaController.text,
        idMotorista: int.parse(_motoristaController.text),
        destino: _destinoController.text,
        passageiros: _passageirosController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(sucesso ? 'Saída registrada!' : 'Erro ao registrar saída'),
        ),
      );

      if (sucesso) {
        _placaController.clear();
        _motoristaController.clear();
        _destinoController.clear();
        _passageirosController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Saída')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _placaController,
                decoration:
                    const InputDecoration(labelText: 'Placa do Veículo'),
                validator: (value) => value!.isEmpty ? 'Informe a placa' : null,
              ),
              TextFormField(
                controller: _motoristaController,
                decoration: const InputDecoration(labelText: 'ID do Motorista'),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Informe o ID' : null,
              ),
              TextFormField(
                controller: _destinoController,
                decoration: const InputDecoration(labelText: 'Destino'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe o destino' : null,
              ),
              TextFormField(
                controller: _passageirosController,
                decoration: const InputDecoration(labelText: 'Passageiros'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarSaida,
                child: const Text('Registrar Saída'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
