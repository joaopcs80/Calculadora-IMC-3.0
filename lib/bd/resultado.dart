import 'package:hive/hive.dart';

part 'resultado.g.dart';

@HiveType(typeId: 0)
class Resultado extends HiveObject {
  @HiveField(0)
  final String nome;

  @HiveField(1)
  final double imc;

  @HiveField(2)
  final String classificacao;

  Resultado({required this.nome, required this.imc, required this.classificacao});
}