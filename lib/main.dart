import 'package:flutter/material.dart';
import 'class/pessoa.dart'; 
import 'process/validacoes.dart'; 

void main() {
  runApp(CalculadoraIMCApp());
}

class CalculadoraIMCApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal, width: 2.0),
          ),
          labelStyle: TextStyle(color: Colors.teal),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.teal,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black54),
          bodyMedium: TextStyle(color: Colors.black54),
          headlineSmall: TextStyle(color: Colors.teal),
        ),
      ),
      home: CalculadoraIMCPage(),
    );
  }
}

class CalculadoraIMCPage extends StatefulWidget {
  @override
  _CalculadoraIMCPageState createState() => _CalculadoraIMCPageState();
}

class _CalculadoraIMCPageState extends State<CalculadoraIMCPage> {
  final _nomeController = TextEditingController();
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  String _resultado = '';
  List<Map<String, String>> _resultados = [];
  
  void _calcularIMC() {
    final nome = _nomeController.text;
    final peso = double.tryParse(_pesoController.text);
    final altura = double.tryParse(_alturaController.text);

    final nomeErro = validarNome(nome);
    final pesoErro = validarPeso(peso);
    final alturaErro = validarAltura(altura);

    if (nomeErro.isNotEmpty) {
      setState(() {
        _resultado = nomeErro;
      });
      return;      
    } else if (pesoErro.isNotEmpty) {
      setState(() {
        _resultado = pesoErro;
      });
      return;        
    } else if (alturaErro.isNotEmpty) {
      setState(() {
        _resultado = alturaErro;
      });
      return;        
    }        

    final pessoa = Pessoa(nome, peso!, altura!);
    final imc = pessoa.calcularIMC();
    final classificacao = pessoa.classificacaoIMC(imc);

    setState(() {
      _resultado = '';
      _resultados.insert(0, {
        'Nome': nome,
        'IMC': imc.toStringAsFixed(2),
        'Classificação': classificacao,
      });
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultadosPage(resultados: _resultados),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
              style: const TextStyle(color: Colors.teal),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _pesoController,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(color: Colors.teal),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _alturaController,
              decoration: InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(color: Colors.teal),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            if (_resultado.isNotEmpty) 
              Text(
                _resultado,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

class ResultadosPage extends StatelessWidget {
  final List<Map<String, String>> resultados;

  ResultadosPage({required this.resultados});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: resultados.length,
          itemBuilder: (context, index) {
            final resultado = resultados[index];
            return Card(
              color: Colors.teal[50],
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: resultado.entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        '${entry.key}: ${entry.value}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.teal[800]),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}