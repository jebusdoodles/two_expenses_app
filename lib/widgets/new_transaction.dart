import 'package:flutter/material.dart'; 

class NewTransaction extends StatelessWidget {
  final Function addTx; 
  final titleController = TextEditingController(); 
  final amountController = TextEditingController(); 

  NewTransaction(this.addTx); 

  void submitData(){

    final enteredTitle = titleController.text; 
    final enteredAmount = double.parse(amountController.text); 

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return; 
    }

    addTx(
      enteredTitle, 
      enteredAmount, 
    ); 

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