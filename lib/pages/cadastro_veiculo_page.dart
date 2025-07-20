import 'package:flutter/material.dart';
import '../services/veiculo_service.dart';

class CadastroVeiculoPage extends StatefulWidget {
  const CadastroVeiculoPage({super.key});

  @override
  State<CadastroVeiculoPage> createState() => _CadastroVeiculoPageState();
}

class _CadastroVeiculoPageState extends State<CadastroVeiculoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _modeloController = TextEditingController();

  Future<void> _cadastrarVeiculo() async {
    if (_formKey.currentState!.validate()) {
      final sucesso = await VeiculoService.cadastrarVeiculo(
        placa: _placaController.text,
        modelo: _modeloController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(sucesso ? 'Veículo cadastrado!' : 'Erro ao cadastrar'),
        ),
      );

      if (sucesso) {
        _placaController.clear();
        _modeloController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Veículo')),
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
                controller: _modeloController,
                decoration: const InputDecoration(labelText: 'Modelo'),
                validator: (value) =>
                    value!.isEmpty ? 'Informe o modelo' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrarVeiculo,
                child: const Text('Cadastrar Veículo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
