import 'package:flutter/material.dart';

class ListAsSharedPreference extends StatefulWidget {
  const ListAsSharedPreference({super.key});

  @override
  State<ListAsSharedPreference> createState() => _ListAsSharedPreferenceState();
}

class _ListAsSharedPreferenceState extends State<ListAsSharedPreference> {

  ///======================================== All Variable ================================================================================///
  List<Map<String, dynamic>> savedOrderList = [];

  ///---------- Text Controller for taking data from TextFormField ----------///
  final TextEditingController _itemCodeTEditingController = TextEditingController();
  final TextEditingController _itemNameTEditingController = TextEditingController();
  final TextEditingController _totalAmountTEditingController = TextEditingController();

  ///---------- Function for adding item into "savedOrderList" ----------///
  void addItemintosavedOrderList() {
    // Get values from text controllers
    String itemCode = _itemCodeTEditingController.text;
    String itemName = _itemNameTEditingController.text;
    double totalAmount = double.tryParse(_totalAmountTEditingController.text) ?? 0.0;

    // Check if any of the fields is empty
    if (itemCode.isEmpty || itemName.isEmpty || totalAmount <= 0.0) {
      // You can add some error handling or show a message to the user
      return;
    }

    // Create a map with the item details
    Map<String, dynamic> newItem = {
      'itemCode': itemCode,
      'itemName': itemName,
      'totalAmount': totalAmount,
    };

    // Add the map to the savedOrderList
    setState(() {
      savedOrderList.add(newItem);
    });

    // Optionally, you can clear the text controllers after adding the item
    _itemCodeTEditingController.clear();
    _itemNameTEditingController.clear();
    _totalAmountTEditingController.clear();
  }



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
            ElevatedButton(onPressed: (){
              addItemintosavedOrderList();
              print('Saved Order List Data : $savedOrderList');
            }, child: Text('Add Item'),),
            const SizedBox(height: 20,),  // Add some spacing
            // Display DataTable
            ///------------------------------ Data Table for Showing data from ------------------------///
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('Item Code')),
                  DataColumn(label: Text('Item Name')),
                  DataColumn(label: Text('Total Amount')),
                ],
                rows: savedOrderList.map((item) {
                  return DataRow(cells: [
                    DataCell(Text(item['itemCode'].toString())),
                    DataCell(Text(item['itemName'].toString())),
                    DataCell(Text(item['totalAmount'].toString())),
                  ]);
                }).toList(),
              ),
            )
          ],
        ),
      )
    );
  }
}
