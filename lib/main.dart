import 'package:flutter/material.dart';
import 'package:two_expenses_app/transaction.dart';
import 'package:intl/intl.dart'; 

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

  final List<Transaction> transactions = [
    Transaction(
      id: 't1', 
      title: 'New Shoes', 
      amount: 69.99, 
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2', 
      title: 'Despensa', 
      amount: 16.53, 
      date: DateTime.now(),
    ),
  ];
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
      body: Column(
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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                TextField( 
                  decoration: const InputDecoration( labelText: 'Titulo' ),
                  controller: titleController, 
                  onChanged: (val) {
                    //titleInput = val; 
                  },
                ),
                TextField( 
                  decoration: const InputDecoration( labelText: 'Cantidad' ),
                  controller: amountController,
                  onChanged: (val){
                    //amountInput = val; 
                  }, 
                ),
                TextButton( 
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: const Text('Agregar gasto'), 
                  onPressed: (){
                    print(titleController.text); 
                    print(amountController.text); 
                  },
                ),
              ]),
            ),
          ),
          Column(
            children: transactions.map(
              (tx){
                return Card(
                  child: Row(
                    children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10, 
                            horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple, 
                              width: 2, 
                            )
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '\$ ${tx.amount}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple, 
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tx.title,
                              style: const TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: const TextStyle(
                                color: Colors.grey, 
                              ),
                            ),
                          ],
                        )
                      ],
                    ), 
                ); 
              }
            ).toList(),
          ),
        ],
      ),
    );
  }
}
