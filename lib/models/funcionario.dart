class Funcionario {
  final int id;
  final String nome;

  Funcionario({required this.id, required this.nome});

  factory Funcionario.fromJson(Map<String, dynamic> json) {
    return Funcionario(
      id: json['id'],
      nome: json['nome'],
    );
  }
}
