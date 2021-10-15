import 'dart:async';

// Pensando na arquitetura MVVM, o BloC pode ser a camada de view model,
// tendo em vista que aqui podemos buscar informações na camada model (db, api, etc),
// e atualizar a camada view (através da stream).
class CounterViewModel {

  int _total = 0;

  int get total => _total;

  // O StreamController será responsável pela entrada e saída dos dados.
  // No exemplo, apenas um int está sendo usado, mas pode ser usado um objeto complexo.
  final _blocController = StreamController<int>();

  // Aqui será a saída. O myStream será usado na HomeScreen para apresentar os dados para o usuário
  Stream<int> get myStream => _blocController.stream;

  void sum() {
    // Entrada dos dados. Como informamos no StreamController que os dados tratados serão do tipo int,
    // é necessário que se passe um int no método add.
    _blocController.sink.add(_total++);
  }

  void closeStream() {
    // Importante fechar a stream, para não ter consumo desnecessário de memória.
    _blocController.close();
  }

}