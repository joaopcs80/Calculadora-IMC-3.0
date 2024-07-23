import 'package:flutter_test/flutter_test.dart';
import '../lib/process/validacoes.dart';

void main() {
  group('Validações', () {
    test('validaNome deve retornar erro para nome vazio', () {
      expect(validarNome(''), 'Por favor, preencha o Nome!');
    });

    test('validaNome deve retornar erro para nome com menos de 3 caracteres', () {
      expect(validarNome('Jo'), 'O Nome precisa ter no mínimo 3 caracteres');
    });

    test('validaNome deve retornar vazio para nome válido', () {
      expect(validarNome('João'), '');
    });

    test('validaPeso deve retornar erro para peso nulo', () {
      expect(validarPeso(null), 'Por favor, preencha o Peso!');
    });

    test('validaPeso deve retornar erro para peso menor ou igual a zero', () {
      expect(validarPeso(0), 'O Peso não pode ser igual ou menor que Zero');
    });

    test('validaPeso deve retornar vazio para peso válido', () {
      expect(validarPeso(70), '');
    });

    test('validaAltura deve retornar erro para altura nula', () {
      expect(validarAltura(null), 'Por favor, preencha a Altura!');
    });

    test('validaAltura deve retornar erro para altura menor ou igual a zero', () {
      expect(validarAltura(0), 'A Altura não pode ser igual ou menor que Zero');
    });

    test('validaAltura deve retornar vazio para altura válida', () {
      expect(validarAltura(1.75), '');
    });
  });
}