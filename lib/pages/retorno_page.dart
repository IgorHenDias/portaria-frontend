import 'package:flutter/material.dart';
import '../services/viagem_service.dart';

class RetornoPage extends StatefulWidget {
  const RetornoPage({super.key});

  @override
  State<RetornoPage> createState() => _RetornoPageState();
}

class _RetornoPageState extends State<RetornoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _placaController = TextEditingController();

  Future<void> _enviarRetorno() async {
    if (_formKey.currentState!.validate()) {
      final sucesso =
          await ViagemService.registrarRetorno(_placaController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              sucesso ? 'Retorno registrado!' : 'Erro ao registrar retorno'),
        ),
      );

      if (sucesso) {
        _placaController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Retorno')),
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _enviarRetorno,
                child: const Text('Registrar Retorno'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
