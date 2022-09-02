import 'package:flutter/material.dart'; 

class NewTransaction extends StatelessWidget {
  final Function addTx; 
  final titleController = TextEditingController(); 
  final amountController = TextEditingController(); 

  NewTransaction(this.addTx); 

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
                    addTx(
                      titleController.text, 
                      double.parse(amountController.text)
                    ); 
                  },
                ),
              ]),
            ),
          ); 
  }
}