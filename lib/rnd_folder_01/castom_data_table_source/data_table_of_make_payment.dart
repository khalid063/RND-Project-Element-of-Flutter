import 'package:flutter/material.dart';

class DataTabelOfMakePayment extends StatefulWidget {
  const DataTabelOfMakePayment({super.key});

  @override
  State<DataTabelOfMakePayment> createState() => _DataTabelOfMakePaymentState();
}

class _DataTabelOfMakePaymentState extends State<DataTabelOfMakePayment> {

  // Initially, showFirstBox and showSubmitButton are false
  bool showFirstBox = true;
  bool showSubmitButton = false;
  bool showSecondContainer = false;

  ///=============================================== DataTable List =====================================///
  final List<Map<String, dynamic>> _rowData = [
    {'ID': 'Item 1', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 2', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 3', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 4', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 5', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 6', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 7', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 8', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 9', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 10', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 11', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 12', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 13', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 14', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 15', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 16', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 17', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 18', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 19', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 20', 'Name': 'Cash', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    // Add more rows as needed
  ];
  /// DataTable delete code
  void _deleteRow(int rowIndex) {
    setState(() {
      _rowData.removeAt(rowIndex);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item delete is Successfull !')));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Visibility(
            visible: showFirstBox,
            child: Expanded(
              child: Container(
                  width: double.infinity,
                  //height: 800,
                  color: Colors.lightBlueAccent,
                  child: Column(
                    children: [
                      PaginatedDataTable(
                        header: const Text('DataTable with Delete Buttons'),
                        rowsPerPage: 5,
                        columnSpacing: 15,
                        horizontalMargin: 5,
                        columns: const [
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Date', style: TextStyle(fontWeight: FontWeight.bold)),
                                //Text('', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Mode', style: TextStyle(fontWeight: FontWeight.bold)),
                                //Text('(Second Part)', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Bank &', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Account', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Branch', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Name', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Account', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('Number', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Amount', style: TextStyle(fontWeight: FontWeight.bold)),
                                //Text('(Second Part)', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Remark', style: TextStyle(fontWeight: FontWeight.bold)),
                                //Text('Amount', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                          DataColumn(
                            label: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Delete', style: TextStyle(fontWeight: FontWeight.bold)),
                                //Text('(Second Part)', style: TextStyle(fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                        source: CustomDataTableSource(rowData: _rowData, onDelete: _deleteRow),
                      ),


                      // PaginatedDataTable(
                      //   source: _data,
                      //   columns: [
                      //     //DataColumn(label: Text('Row')),         // 999
                      //     //DataColumn(label: Text('Item Code')),
                      //     DataColumn(label: Text('Item Name')),
                      //     DataColumn(label: Text('FOC')),
                      //     DataColumn(label: Text('Selling Unit')),
                      //     DataColumn(label: Text('Pcs Per Unit')),
                      //     DataColumn(label: Text('Qty in Pcs')),
                      //     DataColumn(label: Text('Rate')),
                      //     DataColumn(label: Text('Total Amount')),
                      //   ],
                      //   header: const Center(child: Text('My Product'),),
                      //   rowsPerPage: 5,
                      //   columnSpacing: 20,
                      //   //horizontalMargin: 60,
                      // ),
                    ],
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}


///========================================================= Custom DataTableSource Class for Showing the Orderd Data ========================///
class CustomDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> rowData;
  final Function(int) onDelete;

  CustomDataTableSource({required this.rowData, required this.onDelete});

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(rowData[index]['ID'].toString())),
        DataCell(Text(rowData[index]['Name'].toString())),
        DataCell(Text(rowData[index]['Column3'].toString())), // Add data for Column 3
        DataCell(Text(rowData[index]['Column4'].toString())), // Add data for Column 4
        DataCell(Text(rowData[index]['Column5'].toString())), // Add data for Column 5
        DataCell(Text(rowData[index]['Column6'].toString())), // Add data for Column 6
        DataCell(Text(rowData[index]['Column7'].toString())), // Add data for Column 7
        DataCell(
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              onDelete(index);
            },
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => rowData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  bool getRowSelectable(int index) => false;
}
