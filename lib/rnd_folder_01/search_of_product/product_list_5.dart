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

class ProductListScreenFive extends StatefulWidget {
  @override
  _ProductListScreenFiveState createState() => _ProductListScreenFiveState();
}

class _ProductListScreenFiveState extends State<ProductListScreenFive> {
  String _selectedItem = 'Select an item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.search),
            onSelected: (value) {
              _openSearchScreen(context);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'search',
                  child: Text('Search'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text(_selectedItem),
      ),
    );
  }

  _openSearchScreen(BuildContext context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SearchableList()),
    );

    if (result != null && result is String) {
      setState(() {
        _selectedItem = result;
      });
    }
  }
}

class SearchableList extends StatefulWidget {
  @override
  _SearchableListState createState() => _SearchableListState();
}

class _SearchableListState extends State<SearchableList> {
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
      appBar: AppBar(
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
      body: ListView.builder(
        itemCount: _filteredData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_filteredData[index]['xdesc'] ?? ''),
            subtitle: Text('Price: ${_filteredData[index]['xstdprice']}'),
            onTap: () {
              // Pass the selected item back to the home screen
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
