import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }

class ProductListScreenSix extends StatefulWidget {
  @override
  _ProductListScreenSixState createState() => _ProductListScreenSixState();
}

class _ProductListScreenSixState extends State<ProductListScreenSix> {
  String _selectedItem = 'Select an item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              productSearchPopUp(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(_selectedItem),
      ),
    );
  }

  Future<void> productSearchPopUp(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SearchableListScreen();
      },
    );

    if (result != null && result is String) {
      setState(() {
        _selectedItem = result;
      });
    }
  }

}

class SearchableListScreen extends StatefulWidget {
  @override
  _SearchableListScreenState createState() => _SearchableListScreenState();
}

class _SearchableListScreenState extends State<SearchableListScreen> {
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
    return AlertDialog(
      title: AppBar(
        title: TextField(
          controller: _searchController,
          onChanged: (value) {
            filterData(value);
          },
          decoration: InputDecoration(
            hintText: 'Search',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              filterData('');
            },
          ),
        ],
      ),
      content: ListView.builder(
        itemCount: _filteredData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredData[index]['xdesc'] ?? ''),
            subtitle: Text('Price: ${_filteredData[index]['xstdprice']}'),
            onTap: () {
              // Pass the selected item back to the calling screen
              Navigator.of(context).pop(_filteredData[index]['xdesc']);
            },
          );
        },
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
