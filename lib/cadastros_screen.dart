import 'package:flutter/material.dart';

class CadastrosScreen extends StatefulWidget {
  @override
  _CadastrosScreenState createState() => _CadastrosScreenState();
}

class _CadastrosScreenState extends State<CadastrosScreen> {
  final _formaPagamentoController = TextEditingController();
  final _produtoNomeController = TextEditingController();
  final _produtoValorVendaController = TextEditingController();

  String _tipoVendaSelecionado = 'UN'; // 'UN' para unidade, 'KG' para peso

  void _salvarFormaPagamento() {
    final nome = _formaPagamentoController.text;
    if (nome.isNotEmpty) {
      // TODO: Lógica para enviar para o backend
      print('Salvando forma de pagamento: $nome');
      _formaPagamentoController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Forma de pagamento "$nome" salva com sucesso!')),
      );
    }
  }

  void _salvarProduto() {
    final nome = _produtoNomeController.text;
    final valor = _produtoValorVendaController.text;
    if (nome.isNotEmpty && valor.isNotEmpty) {
      // TODO: Lógica para enviar para o backend
      print('Salvando produto: $nome, Tipo: $_tipoVendaSelecionado, Valor: $valor');
      _produtoNomeController.clear();
      _produtoValorVendaController.clear();
      setState(() {
        _tipoVendaSelecionado = 'UN';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produto "$nome" salvo com sucesso!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastros'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Bloco de Cadastro de Forma de Pagamento
            _buildCard(
              title: 'Cadastro de Forma de Pagamento',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome da Forma de Pagamento', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  TextField(
                    controller: _formaPagamentoController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ex: Dinheiro, Cartão de Crédito',
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _salvarFormaPagamento,
                      child: Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Bloco de Cadastro de Produtos
            _buildCard(
              title: 'Cadastro de Produtos',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome do Produto', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  TextField(
                    controller: _produtoNomeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ex: Refrigerante, Salgado',
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Tipo de Venda', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'UN',
                        groupValue: _tipoVendaSelecionado,
                        onChanged: (value) {
                          setState(() {
                            _tipoVendaSelecionado = value!;
                          });
                        },
                      ),
                      Text('Unidade (UN)'),
                      Radio<String>(
                        value: 'KG',
                        groupValue: _tipoVendaSelecionado,
                        onChanged: (value) {
                          setState(() {
                            _tipoVendaSelecionado = value!;
                          });
                        },
                      ),
                      Text('Peso (KG)'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Valor de Venda (R\$)', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  TextField(
                    controller: _produtoValorVendaController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Ex: 5.50',
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _salvarProduto,
                      child: Text('Salvar'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required String title, required Widget child}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            Divider(height: 20, thickness: 1),
            child,
          ],
        ),
      ),
    );
  }
}