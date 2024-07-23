String validarNome(String nome) {
  if (nome.isEmpty) {
    return 'Por favor, preencha o Nome!';
  } else if (nome.length < 3) {
    return 'O Nome precisa ter no mínimo 3 caracteres'; 
  } else {
    return '';
  }
}

String validarPeso(double? peso) {
  if (peso == null) {
    return 'Por favor, preencha o Peso!';
  } else if (peso <= 0) {
    return 'O Peso não pode ser igual ou menor que Zero'; 
  } else {
    return '';
  }
}

String validarAltura(double? altura) {
  if (altura == null) {
    return 'Por favor, preencha a Altura!';
  } else if (altura <= 0) {
    return 'A Altura não pode ser igual ou menor que Zero'; 
  } else {
    return '';
  }
}