import 'package:flutter/material.dart';

class SalseTypeCraditOptionAdd extends StatefulWidget {
  const SalseTypeCraditOptionAdd({super.key});

  @override
  State<SalseTypeCraditOptionAdd> createState() => _SalseTypeCraditOptionAddState();
}

class _SalseTypeCraditOptionAddState extends State<SalseTypeCraditOptionAdd> {

  final TextEditingController _paidAmountTEController = TextEditingController();

  ///---------------------------------------- List of Salse Type Dropdown Button -----------------------------------------------------///
  String? salseTypeselectedItem = 'Cash';
  List <String> listItem = ["Cash", "Card", "Both", "Cradit"];
  bool isCreditSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Order Placement 4'),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                ///------------------------------ Sales Type Field ---------------------------------------------------------///
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text(
                        'Sales Type',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerRight,
                        //color: Colors.redAccent,
                        child: const Text(
                          ' : ',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Container(
                          width: 100,
                          //color: Colors.redAccent,
                          child: Center(
                            child: DropdownButton<String>(
                              value: salseTypeselectedItem,

                              onChanged: (newValue) {
                                setState(() {
                                  salseTypeselectedItem = newValue!;
                                  isCreditSelected = newValue == 'Cradit'; // Correct the value to check
                                  if (isCreditSelected) {
                                    // If 'Cradit' is selected, clear the text field
                                    _paidAmountTEController.clear();
                                  }
                                });
                              },

                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5,),
                ///------------------------------ Paid Amount Field --------------------------------------------------------///
                Row(
                  children: [
                    const Expanded(
                      flex: 4,
                      child: Text(
                        'Paid Amount',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        ':',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: TextFormField(
                        controller: _paidAmountTEController,
                        keyboardType: TextInputType.number,
                        readOnly: isCreditSelected, // Set readOnly based on selection
                        decoration: const InputDecoration(
                          hintText: 'Enter Paid Amount',
                          filled: true,
                          fillColor: Colors.white70,
                        ),
                        validator: ( String? value){
                          if (value?.trim().isEmpty ?? true){
                            return 'Enter Your Paid Amount';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60,),
                ///------------------------------ Submit Button ------------------------------------------------------------///
                ElevatedButton(onPressed: (){
                  _paidAmountTEController.clear();
                }, child: Text('Submit'),),
              ],
            )
          ),
        ),
      ),
    );
  }
}
