import 'package:flutter/material.dart';
import '../services/veiculo_service.dart';
import 'saida_page.dart';
import 'retorno_page.dart';
import 'cadastro_funcionario_page.dart';

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
      backgroundColor: const Color(0xFFCCCCCC), // fundo cinza
      appBar: AppBar(
        title: const Text('Portaria - Veículos no Pátio'),
        backgroundColor: const Color(0xFF4D7408), // verde
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: carregarVeiculosNoPatio,
        backgroundColor: const Color(0xFF905524), // marrom
        child: const Icon(Icons.refresh),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildBotao(context, 'Registrar Saída', const SaidaPage()),
            _buildBotao(context, 'Registrar Retorno', const RetornoPage()),
            _buildBotao(context, 'Cadastrar Funcionário', const CadastroFuncionarioPage()),
            const SizedBox(height: 16),
            Expanded(
              child: veiculos.isEmpty
                  ? const Center(child: Text('Nenhum veículo no pátio.'))
                  : ListView.builder(
                itemCount: veiculos.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Colors.white,
                    child: ListTile(
                      leading: const Icon(Icons.directions_car, color: Color(0xFF905524)),
                      title: Text(
                        veiculos[index],
                        style: const TextStyle(
                          color: Color(0xFF4D7408),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBotao(BuildContext context, String label, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => page));
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(55),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF4D7408),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            elevation: 2,
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
