import 'package:flutter/material.dart';
import 'package:two_expenses_app/models/transaction.dart'; 
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions; 

  TransactionList(this.transactions); 

  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 300,
      child: transactions.isEmpty ? Column(children: [
        Text(
          'No hay ningun gasto registrado', 
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 200,
          child: Image.asset(
            'assets/images/waiting.png', 
            fit: BoxFit.cover,
          ),
        )
      ]) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
                  child: Row(
                    children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10, 
                            horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).primaryColor, 
                              width: 2, 
                            )
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '\$ ${transactions[index].amount.toStringAsFixed(2)}',
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
                              transactions[index].title,
                              style: Theme.of(context).textTheme.headline6, 
                            ),
                            Text(
                              DateFormat.yMMMd().format(transactions[index].date),
                              style: const TextStyle(
                                color: Colors.grey, 
                              ),
                            ),
                          ],
                        )
                      ],
                    ), 
                ); 
          },
          itemCount: transactions.length,
        )
    );
  }
}