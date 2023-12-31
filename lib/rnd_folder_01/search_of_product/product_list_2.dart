import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Search Popup Example',
//       home: MyHomePage(),
//     );
//   }
// }

class ProductListScreenTwo extends StatefulWidget {
  @override
  _ProductListScreenTwoState createState() => _ProductListScreenTwoState();
}

class _ProductListScreenTwoState extends State<ProductListScreenTwo> {
  TextEditingController _searchController = TextEditingController();
  TextEditingController _selectedItemController = TextEditingController();
  List<Map<String, String>> _originalData = [
    {"xitem": "10001", "xdesc": "LPG Alu", "xstdprice": "110.83", "xunitsel": "Kg"},
    {"xitem": "10002", "xdesc": "LPG Ata", "xstdprice": "684.83", "xunitsel": "Pcs"},
    {"xitem": "10003", "xdesc": "LPG Moyda", "xstdprice": "712.83", "xunitsel": "Kg"},
    {"xitem": "10004", "xdesc": "LPG Mas", "xstdprice": "954.83", "xunitsel": "Pcs"},
    {"xitem": "10005", "xdesc": "LPG Chal", "xstdprice": "765.83", "xunitsel": "Kg"},
    // Add the rest of your data here
  ];
  List<Map<String, String>> _filteredData = [];

  void _showSearchPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Search Items'),
          content: Column(
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Implement your search logic here
                  // For simplicity, this example filters items based on xdesc
                  _filterData(value);
                },
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _filteredData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('${_filteredData[index]["xdesc"]} (${_filteredData[index]["xitem"]})'),
                      onTap: () {
                        // Set the selected item and close the dialog
                        _selectItem(_filteredData[index]);
                        Navigator.of(context).pop();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _filterData(String query) {
    setState(() {
      _filteredData = _originalData
          .where((item) => item['xdesc']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _selectItem(Map<String, String> item) {
    setState(() {
      _selectedItemController.text = '${item["xdesc"]} (${item["xitem"]})';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Popup Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _showSearchPopup();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Selected Item',
              ),
              controller: _selectedItemController,
              readOnly: true,
              onTap: () {
                // Open the search popup again if needed
                _showSearchPopup();
              },
            ),
          ],
        ),
      ),
    );
  }
}
