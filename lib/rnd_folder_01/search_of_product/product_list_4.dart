import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Search Bar Example'),
//         ),
//         body: SearchableList(),
//       ),
//     );
//   }
//}

class ProductListScreenFour extends StatefulWidget {
  @override
  _ProductListScreenFourState createState() => _ProductListScreenFourState();
}

class _ProductListScreenFourState extends State<ProductListScreenFour> {
  List<Map<String, String>> _originalData = [
    {"xitem": "10001", "xdesc": "LPG Alu", "xstdprice": "110.83", "xunitsel": "Kg"},
    {"xitem": "10002", "xdesc": "LPG Ata", "xstdprice": "684.83", "xunitsel": "Pcs"},
    {"xitem": "10003", "xdesc": "LPG Moyda", "xstdprice": "712.83", "xunitsel": "Kg"},
    {"xitem": "10004", "xdesc": "LPG Mas", "xstdprice": "954.83", "xunitsel": "Pcs"},
    {"xitem": "10005", "xdesc": "LPG Chal", "xstdprice": "765.83", "xunitsel": "Kg"},
    // Add the rest of your data here
  ];

  List<Map<String, String>> _filteredData = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredData.addAll(_originalData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  filterData(value);
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'Enter search term',
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredData[index]['xdesc'] ?? ''),
                    subtitle: Text('Price: ${_filteredData[index]['xstdprice']}'),
                    onTap: () {
                      // Handle item selection, for example, show in Text widget
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Selected Item'),
                            content: Text('Item: ${_filteredData[index]['xdesc']}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterData(String searchTerm) {
    _filteredData.clear();

    if (searchTerm.isEmpty) {
      // If search term is empty, show all items
      _filteredData.addAll(_originalData);
    } else {
      // Filter items based on search term
      _filteredData.addAll(_originalData.where((item) =>
          item['xdesc']!.toLowerCase().contains(searchTerm.toLowerCase())));
    }

    setState(() {});
  }


}
