import 'package:flutter/material.dart';
import '../services/funcionario_service.dart';

class CadastroFuncionarioPage extends StatefulWidget {
  const CadastroFuncionarioPage({super.key});

  @override
  State<CadastroFuncionarioPage> createState() =>
      _CadastroFuncionarioPageState();
}

class _CadastroFuncionarioPageState extends State<CadastroFuncionarioPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cnhController = TextEditingController();

  Future<void> _cadastrar() async {
    if (_formKey.currentState!.validate()) {
      final sucesso = await FuncionarioService.cadastrarFuncionario(
        nome: _nomeController.text,
        cnh: _cnhController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text(sucesso ? 'Funcionário cadastrado!' : 'Erro ao cadastrar'),
        ),
      );

      if (sucesso) {
        _nomeController.clear();
        _cnhController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastrar Funcionário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                controller: _cnhController,
                decoration: const InputDecoration(labelText: 'CNH'),
                validator: (value) => value!.isEmpty ? 'Informe a CNH' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrar,
                child: const Text('Cadastrar Funcionário'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
