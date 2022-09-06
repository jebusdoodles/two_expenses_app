import 'package:flutter/material.dart';
import 'package:two_expenses_app/widgets/user_transaction.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //String titleInput; 
  //String amountInput; 

  final titleController = TextEditingController(); 
  final amountController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gastos'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container( 
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text('Grafica'),
                  elevation: 5,
                ),
              ),
              UserTransactions(), 
            ],
          ),
        ),
    );
  }
}
