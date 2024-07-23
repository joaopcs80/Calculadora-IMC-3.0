import 'package:flutter_test/flutter_test.dart';
import '../lib/class/pessoa.dart';

void main() {
  group('Pessoa', () {
    test('calcularIMC deve calcular o IMC corretamente', () {
      final pessoa = Pessoa('João', 70, 1.75);
      final imc = pessoa.calcularIMC();
      expect(imc, closeTo(22.86, 0.01)); // Verifica se o IMC está próximo do valor esperado
    });

    test('classificacaoIMC deve classificar o IMC corretamente', () {
      final pessoa = Pessoa('João', 70, 1.75);
      final imc = pessoa.calcularIMC();
      final classificacao = pessoa.classificacaoIMC(imc);
      expect(classificacao, 'Saudável'); // Verifica a classificação esperada
    });
  });
}
