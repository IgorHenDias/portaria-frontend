import 'package:flutter/material.dart';
import '../services/viagem_service.dart';
import '../services/funcionario_service.dart';
import '../models/funcionario.dart';

class SaidaPage extends StatefulWidget {
  const SaidaPage({super.key});

  @override
  State<SaidaPage> createState() => _SaidaPageState();
}

class _SaidaPageState extends State<SaidaPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _placaController = TextEditingController();
  final TextEditingController _destinoController = TextEditingController();
  final TextEditingController _passageirosController = TextEditingController();

  List<Funcionario> funcionarios = [];
  Funcionario? funcionarioSelecionado;

  @override
  void initState() {
    super.initState();
    carregarFuncionarios();
  }

  Future<void> carregarFuncionarios() async {
    try {
      final lista = await FuncionarioService.getFuncionarios();
      setState(() {
        funcionarios = lista;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar funcionários')),
      );
    }
  }

  Future<void> _enviarSaida() async {
    if (_formKey.currentState!.validate() && funcionarioSelecionado != null) {
      final sucesso = await ViagemService.registrarSaida(
        placaVeiculo: _placaController.text,
        idMotorista: funcionarioSelecionado!.id,
        destino: _destinoController.text,
        passageiros: _passageirosController.text,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(sucesso ? 'Saída registrada!' : 'Erro ao registrar saída'),
        ),
      );

      if (sucesso) {
        _placaController.clear();
        _destinoController.clear();
        _passageirosController.clear();
        setState(() {
          funcionarioSelecionado = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Saída'),
        backgroundColor: const Color(0xFF4D7408),
        foregroundColor: Colors.white,
      ),
      backgroundColor: const Color(0xFFCCCCCC),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _placaController,
                decoration: const InputDecoration(labelText: 'Placa do Veículo'),
                validator: (value) => value!.isEmpty ? 'Informe a placa' : null,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<Funcionario>(
                value: funcionarioSelecionado,
                items: funcionarios.map((f) {
                  return DropdownMenuItem(
                    value: f,
                    child: Text('${f.nome} (ID: ${f.id})'),
                  );
                }).toList(),
                decoration: const InputDecoration(labelText: 'Motorista'),
                validator: (value) =>
                value == null ? 'Selecione o motorista' : null,
                onChanged: (f) {
                  setState(() {
                    funcionarioSelecionado = f;
                  });
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _destinoController,
                decoration: const InputDecoration(labelText: 'Destino'),
                validator: (value) => value!.isEmpty ? 'Informe o destino' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _passageirosController,
                decoration: const InputDecoration(labelText: 'Passageiros (opcional)'),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _enviarSaida,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4D7408),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Registrar Saída'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
