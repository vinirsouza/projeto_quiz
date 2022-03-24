soma(int a, int b) {
  return a + b;
}

int exec(int a, int b, int Function(int, int) fn) {
  return fn(a, b);
}

class Produto {
  late String nome;
  late double preco;

  Produto(this.nome, this.preco);
}

void main() {
  int a = 3;
  double b = 5.7;
  var d = 'Ele infere que é uma String';
  bool estaQuente = true;

  print(d is String);
  print(d is int);
  print(!(d is int));

  var nomes = ['Pedro', 'Tiago', 'João'];
  nomes.add('Mateus');
  print(nomes.length);
  print(nomes.elementAt(2));
  print(nomes[0]);
  print('--------------------');

  var conjunto = {0, 1, 2, 3, 4, 4, 4, 4, 4, 4, 4, 4};
  Set<int> inteiros = {2, 6, 8, 3, 4};
  print(conjunto.length);
  print(conjunto is Set);
  print('--------------------');
  Map<String, double> notasDosAlunos;
  notasDosAlunos = {'Pedro': 9.7, 'Tiago': 8.5, 'João': 7.9};

  for (var chave in notasDosAlunos.keys) {
    print('chave = $chave');
  }

  for (var valor in notasDosAlunos.values) {
    print('valor = $valor');
  }

  for (var registro in notasDosAlunos.entries) {
    print('${registro.key} = ${registro.value}');
  }
  print('--------------------');

  dynamic x = 'Teste';
  x = 123;
  x = false;

  var z = 3;
  z = 2;

  print(soma(1, 3));
  print(soma(4, 1));
  print('--------------------');

  final r = exec(3, 2, (g, h) {
    return g - h;
  });

  final p = exec(5, 4, (a, b) => a * b * 1000);

  print(r);
  print(p);
  print('--------------------');

  Produto p1 = new Produto('Lapis', 1.50);

  print("O produto ${p1.nome} custa ${p1.preco}.");
}
