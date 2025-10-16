import 'package:flutter/material.dart';
import 'cadastros_screen.dart'; // 1. Importe a nova tela

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // 2. Navegue para a tela de cadastros
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastrosScreen()),
                  );
                },
                child: Text('Cadastros'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  textStyle: TextStyle(fontSize: 18),
                ),
                onPressed: () {
                  // TODO: Navegar para a tela de venda
                  print('Botão Tela de Venda pressionado');
                },
                child: Text('Tela de Venda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}