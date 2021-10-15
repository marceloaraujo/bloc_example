import 'package:bloc_example/viewmodel/CounterViewModel.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  CounterViewModel _viewModel = CounterViewModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Quando a tela for fechada, o nosso stream será fechado também.
    _viewModel.closeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BloC'),
      ),
      body: Container(
        width: double.infinity,
        child: Center(
          child: StreamBuilder<int>( //Usamos o StreamBuilder para operações com a stream.
            stream: _viewModel.myStream, // informamos a nossa stream definida no BloC
            builder: (context, snapshot) { // O builder possui dois parâmetros: context e snapshot.
              // O snapshot é usado para tratamento de erros e também para recuperar o valor 
              //retornado pela stream.
              if(snapshot.hasData) {
                // Se houver dado retornado pela stream, exibimos o resultado na tela.
                return Text('${snapshot.data}');
              } else {
                // Caso contrário, exibimos uma instrução qualquer na tela
                return Text('Clique no botão abaixo para começar');
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Podemos chamar o método criado no nosso BloC aqui.
          _viewModel.sum();
        },
        child: Icon(Icons.plus_one),
      ),
    );
  }
}