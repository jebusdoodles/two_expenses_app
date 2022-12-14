import 'package:flutter/material.dart'; 

class NewTransaction extends StatefulWidget {
  final Function addTx; 

  NewTransaction(this.addTx); 

  @override
  _NewTransactionState createState() => _NewTransactionState(); 
}

class _NewTransactionState extends State<NewTransaction>{

  final titleController = TextEditingController(); 
  final amountController = TextEditingController(); 

  void submitData(){

    final enteredTitle = titleController.text; 
    final enteredAmount = double.parse(amountController.text); 

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return; 
    }

    widget.addTx(
      enteredTitle, 
      enteredAmount, 
    ); 

    Navigator.of(context).pop(); 

  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column( 
                crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                TextField( 
                  decoration: const InputDecoration( labelText: 'Nombre' ),
                  controller: titleController, 
                  onSubmitted: (_) => submitData(),
                ),
                TextField( 
                  decoration: const InputDecoration( labelText: 'Cantidad' ),
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (_) => submitData(),
                ),
                TextButton( 
                  style: TextButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: const Text('Agregar gasto'), 
                  onPressed: submitData,
                ),
              ]),
            ),
          ); 
  }
}