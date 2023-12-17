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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedItem = '';

  List<Map<String, String>> _data = [
    {"xitem": "10001", "xdesc": "LPG MIXTURE", "xstdprice": "110.83", "xunitsel": "Kg"},
    {"xitem": "10002", "xdesc": "LPG Item2", "xstdprice": "684.83", "xunitsel": "Pcs"},
    {"xitem": "10003", "xdesc": "LPG Item3", "xstdprice": "712.83", "xunitsel": "Kg"},
    {"xitem": "10004", "xdesc": "LPG Item4", "xstdprice": "954.83", "xunitsel": "Pcs"},
    {"xitem": "10005", "xdesc": "LPG Item5", "xstdprice": "765.83", "xunitsel": "Kg"},
    // Add the rest of your data here
  ];

  // List<Map<String, String>> _data = [
  //   {"xitem": "10001", "xdesc": "LPG Alu", "xstdprice": "110.83", "xunitsel": "Kg"},
  //   {"xitem": "10002", "xdesc": "LPG Ata", "xstdprice": "684.83", "xunitsel": "Pcs"},
  //   {"xitem": "10003", "xdesc": "LPG Moyda", "xstdprice": "712.83", "xunitsel": "Kg"},
  //   {"xitem": "10004", "xdesc": "LPG Mas", "xstdprice": "954.83", "xunitsel": "Pcs"},
  //   {"xitem": "10005", "xdesc": "LPG Chal", "xstdprice": "765.83", "xunitsel": "Kg"},
  //   // Add the rest of your data here
  // ];

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
                  setState(() {
                    _data = _data.where((item) => item['xdesc']!.contains(value)).toList();
                  });
                },
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('${_data[index]["xdesc"]} (${_data[index]["xitem"]})'),
                      onTap: () {
                        // Set the selected item and close the dialog
                        setState(() {
                          _selectedItem = '${_data[index]["xdesc"]} (${_data[index]["xitem"]})';
                        });
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
              controller: TextEditingController(text: _selectedItem),
              readOnly: true,
              onTap: () {
                // Open the search popup again if needed
                _showSearchPopup();
              },
            ),
            SizedBox(height: 20,),
            Text('Item Name : ${_selectedItem}')
          ],
        ),
      ),
    );
  }
}
