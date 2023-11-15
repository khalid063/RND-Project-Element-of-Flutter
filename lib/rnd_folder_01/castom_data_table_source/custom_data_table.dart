import 'package:flutter/material.dart';

class CustomDataTableSource extends StatefulWidget {
  const CustomDataTableSource({super.key});

  @override
  State<CustomDataTableSource> createState() => _CustomDataTableSourceState();
}

class _CustomDataTableSourceState extends State<CustomDataTableSource> {

  // List<DataRow> _rows = [
  //   DataRow(cells: [DataCell(Text('1')), DataCell(Text('John Doe')), DataCell(Container()), DataCell(Container()), DataCell(Container()), DataCell(Container()), DataCell(Container())]),
  //   DataRow(cells: [DataCell(Text('2')), DataCell(Text('Jane Doe')), DataCell(Container()), DataCell(Container()), DataCell(Container()), DataCell(Container()), DataCell(Container())]),
  //   // Add more rows as needed
  // ];
  List<List<String>> _rowsData = [
    ['1', 'John Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['2', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['3', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['4', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['5', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['6', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['7', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['8', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['9', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['10', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['11', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['12', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['13', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['14', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['15', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['16', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['17', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['18', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['19', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    ['20', 'Jane Doe', 'Data1', 'Data2', 'Data3', 'Data4', 'Data5'],
    // Add more rows as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Data Table'),
        centerTitle: true,
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
        source: CustomDataTableSource2(rowsData: _rowsData, onDelete: _deleteRow),
      ),
    );
  }

  void _deleteRow(int rowIndex) {
    setState(() {
      _rowsData.removeAt(rowIndex);
    });
  }

}

class CustomDataTableSource2 extends DataTableSource {
  final List<List<String>> rowsData;
  final Function(int) onDelete;

  CustomDataTableSource2({required this.rowsData, required this.onDelete});

  @override
  DataRow getRow(int index) {
    return DataRow(
      cells: [
        DataCell(Text(rowsData[index][0])),
        DataCell(Text(rowsData[index][1])),
        DataCell(Text(rowsData[index][2])), // Add data for Column 3
        DataCell(Text(rowsData[index][3])), // Add data for Column 4
        DataCell(Text(rowsData[index][4])), // Add data for Column 5
        DataCell(Text(rowsData[index][5])), // Add data for Column 6
        DataCell(Text(rowsData[index][6])), // Add data for Column 7
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
  int get rowCount => rowsData.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;

  @override
  bool getRowSelectable(int index) => false;
}
