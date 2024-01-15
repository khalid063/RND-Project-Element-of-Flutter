import 'package:flutter/material.dart';

class ListAsSharedPreferenceThree extends StatefulWidget {
  const ListAsSharedPreferenceThree({super.key});

  @override
  State<ListAsSharedPreferenceThree> createState() => _ListAsSharedPreferenceThreeState();
}

class _ListAsSharedPreferenceThreeState extends State<ListAsSharedPreferenceThree> {

  ///======================================== All Variable ================================================================================///
  List<Map<String, dynamic>> savedOrderList = [];

  ///---------- Text Controller for taking data from TextFormField ----------///
  final TextEditingController _itemCodeTEditingController = TextEditingController();
  final TextEditingController _itemNameTEditingController = TextEditingController();
  final TextEditingController _totalAmountTEditingController = TextEditingController();

  ///---------- for item Edit ----------///
  int editingIndex = -1; // Index of the item being edited, -1 means no item is being edite

  ///======================================== Function Write Area =========================================================================///

  ///---------- Function of item delete test commit 3 ----------///
  void deleteItem(int index) {
    setState(() {
      savedOrderList.removeAt(index);
    });
  }

  ///---------- Function of item edit ----------///
  void editItem(int index) {
    setState(() {
      editingIndex = index;
      _itemCodeTEditingController.text = savedOrderList[index]['itemCode'];
      _itemNameTEditingController.text = savedOrderList[index]['itemName'];
      _totalAmountTEditingController.text = savedOrderList[index]['totalAmount'].toString();
    });
  }

  ///----------Function for adding item into "savedOrderList" ----------///
  void addItemintosavedOrderList() {
    if (editingIndex == -1) {
      // If not editing, add a new item
      String itemCode = _itemCodeTEditingController.text;
      String itemName = _itemNameTEditingController.text;
      double totalAmount = double.tryParse(_totalAmountTEditingController.text) ?? 0.0;

      if (itemCode.isEmpty || itemName.isEmpty || totalAmount <= 0.0) {
        return;
      }

      Map<String, dynamic> newItem = {
        'itemCode': itemCode,
        'itemName': itemName,
        'totalAmount': totalAmount,
      };

      setState(() {
        savedOrderList.add(newItem);
      });
    } else {
      // If editing, update the existing item
      setState(() {
        savedOrderList[editingIndex]['itemCode'] = _itemCodeTEditingController.text;
        savedOrderList[editingIndex]['itemName'] = _itemNameTEditingController.text;
        savedOrderList[editingIndex]['totalAmount'] =
            double.tryParse(_totalAmountTEditingController.text) ?? 0.0;
        editingIndex = -1; // Reset editingIndex after updating
      });
    }

    // Clear text controllers after adding/editing the item
    _itemCodeTEditingController.clear();
    _itemNameTEditingController.clear();
    _totalAmountTEditingController.clear();
  }

  ///---------- Old Function for adding item into "savedOrderList" ----------///
  // void addItemintosavedOrderList() {
  //   // Get values from text controllers
  //   String itemCode = _itemCodeTEditingController.text;
  //   String itemName = _itemNameTEditingController.text;
  //   double totalAmount = double.tryParse(_totalAmountTEditingController.text) ?? 0.0;
  //
  //   // Check if any of the fields is empty
  //   if (itemCode.isEmpty || itemName.isEmpty || totalAmount <= 0.0) {
  //     // You can add some error handling or show a message to the user
  //     return;
  //   }
  //
  //   // Create a map with the item details
  //   Map<String, dynamic> newItem = {
  //     'itemCode': itemCode,
  //     'itemName': itemName,
  //     'totalAmount': totalAmount,
  //   };
  //
  //   // Add the map to the savedOrderList
  //   setState(() {
  //     savedOrderList.add(newItem);
  //   });
  //
  //   // Optionally, you can clear the text controllers after adding the item
  //   _itemCodeTEditingController.clear();
  //   _itemNameTEditingController.clear();
  //   _totalAmountTEditingController.clear();
  // }



  ///======================================== Scaffold Part ================================================================================///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List as shared preference'),
          centerTitle: true,
          backgroundColor: Colors.pinkAccent,
        ),
        ///---------------------------------------- Body Part ------------------------------------------///
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ///------------------------------ Item Code  ----------------------------------------------///
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      //color: Colors.green,
                      child: const Text(
                        'Item Code',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
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
                    child: Container(
                      child: TextFormField(
                        controller: _itemCodeTEditingController,
                        //controller: pcsPerUnitTEController,
                        // print('')
                        keyboardType: TextInputType. number,
                        decoration: InputDecoration(
                          hintText: 'Item Code',
                        ),
                      ),

                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              ///------------------------------ Item Name  ----------------------------------------------///
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      //color: Colors.green,
                      child: const Text(
                        'Item Name',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
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
                    child: Container(
                      child: TextFormField(
                        controller: _itemNameTEditingController,
                        //controller: pcsPerUnitTEController,
                        // print('')
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Item Name',
                        ),
                      ),

                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              ///------------------------------ Total Amount  -------------------------------------------///
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      //color: Colors.green,
                      child: const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
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
                    child: Container(
                      child: TextFormField(
                        controller: _totalAmountTEditingController,
                        //controller: pcsPerUnitTEController,
                        // print('')
                        keyboardType: TextInputType. number,
                        decoration: InputDecoration(
                          hintText: 'Total Amount',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              ///------------------------------ Add Item Button  ----------------------------------------///
              ElevatedButton(
                onPressed: () {
                  addItemintosavedOrderList();
                  print('Saved Order List Data : $savedOrderList');
                },
                child: Text(editingIndex == -1 ? 'Add Item' : 'Update Item'),
              ),
              ///----------- Old Elevated Button
              // ElevatedButton(onPressed: (){
              //   addItemintosavedOrderList();
              //   print('Saved Order List Data : $savedOrderList');
              // }, child: Text('Add Item'),),
              // const SizedBox(height: 20,),  // Add some spacing
              // Display DataTable
              ///------------------------------ Data Table for Showing data from ------------------------///
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Item Code')),
                    DataColumn(label: Text('Item Name')),
                    DataColumn(label: Text('Total Amount')),
                    DataColumn(label: Text('Actions')),
                  ],
                  rows: savedOrderList.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final Map<String, dynamic> item = entry.value;

                    return DataRow(cells: [
                      DataCell(Text(item['itemCode'].toString())),
                      DataCell(Text(item['itemName'].toString())),
                      DataCell(Text(item['totalAmount'].toString())),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                editItem(index);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                deleteItem(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            ],
          ),
        )
    );
  }
}
