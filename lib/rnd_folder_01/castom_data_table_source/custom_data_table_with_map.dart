import 'package:flutter/material.dart';

class CustomDataTableWithMap extends StatefulWidget {
  const CustomDataTableWithMap({super.key});

  @override
  State<CustomDataTableWithMap> createState() => _CustomDataTableWithMapState();
}

class _CustomDataTableWithMapState extends State<CustomDataTableWithMap> {

  List<Map<String, dynamic>> _rowData = [
    {'ID': '1', 'Name': 'John Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '2', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '3', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '4', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '5', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '6', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '7', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '8', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '9', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '10', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '11', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '12', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '13', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '14', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '15', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '16', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '17', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '18', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '19', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': '20', 'Name': 'Jane Doe', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    // Add more rows as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Data Table with Map'),
      ),
      body: PaginatedDataTable(
        header: Text('DataTable with Delete Buttons'),
        rowsPerPage: 5,
        columns: [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Column 3')),
          DataColumn(label: Text('Column 4')),
          DataColumn(label: Text('Column 5')),
          DataColumn(label: Text('Column 6')),
          DataColumn(label: Text('Column 7')),
          DataColumn(label: Text('Actions')),
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
