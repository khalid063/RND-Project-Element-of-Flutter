import 'package:flutter/material.dart';

class CustomDataTableWithMapStaticHeader extends StatefulWidget {
  const CustomDataTableWithMapStaticHeader({super.key});

  @override
  State<CustomDataTableWithMapStaticHeader> createState() => _CustomDataTableWithMapStaticHeaderState();
}

class _CustomDataTableWithMapStaticHeaderState extends State<CustomDataTableWithMapStaticHeader> {

  List<Map<String, dynamic>> _rowData = [
    {'ID': 'Item 1', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 2', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 3', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 4', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 5', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 6', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 7', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 8', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 9', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 10', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 11', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 12', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 13', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 14', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 15', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 16', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 17', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 18', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 19', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 20', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    // Add more rows as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PaginatedDataTable(
        header: Text('DataTable with Delete Buttons'),
        rowsPerPage: 5,
        columnSpacing: 15,
        horizontalMargin: 5,
        columns: const [
          DataColumn(
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Item', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Name', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          DataColumn(
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('FOC', style: TextStyle(fontWeight: FontWeight.bold)),
                //Text('(Second Part)', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          DataColumn(
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Selling', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Unit', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          DataColumn(
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Pcs Per', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Unit', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          DataColumn(
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Qty Per', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Pcs', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          DataColumn(
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Rate', style: TextStyle(fontWeight: FontWeight.bold)),
                //Text('(Second Part)', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          DataColumn(
            label: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Amount', style: TextStyle(fontSize: 12)),
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
        source: CustomDataTableSource2(rowData: _rowData, onDelete: _deleteRow),
      ),
    );
  }

  void _deleteRow(int rowIndex) {
    setState(() {
      _rowData.removeAt(rowIndex);
    });
  }

}

class CustomDataTableSource2 extends DataTableSource {
  final List<Map<String, dynamic>> rowData;
  final Function(int) onDelete;

  CustomDataTableSource2({required this.rowData, required this.onDelete});

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
