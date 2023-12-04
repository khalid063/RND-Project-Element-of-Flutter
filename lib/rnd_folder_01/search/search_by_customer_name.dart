import 'package:flutter/material.dart';

class SearchByCustomerName extends StatefulWidget {
  const SearchByCustomerName({super.key});

  @override
  State<SearchByCustomerName> createState() => _SearchByCustomerNameState();
}

class _SearchByCustomerNameState extends State<SearchByCustomerName> {

  List<Map<String, dynamic>> customerListModel = [
    {"cusname": "XYZ TRADING", "phone": "0567726404", "division": "Rajshahi"},
    {"cusname": "SHAHIN TRADING", "phone": "0567726404", "division": "Rajshahi"},
    {"cusname": "MOHAMMED ABU BAKAR TRADING", "phone": "0567726404", "division": "Dhaka"},
    {"cusname": "BAKAR TRADING", "phone": "0567726404", "division": "Dhaka"},
    {"cusname": "ABC TRADING", "phone": "0567726404", "division": "Rajshahi"},
  ];

  ///======================================== data filter with Customer Name ========================================///
  List<Map<String, dynamic>> filteredCustomers = [];
  @override
  void initState() {
    filteredCustomers = customerListModel;
    super.initState();
  }
  void filterCustomers(String keyword) {
    List<Map<String, dynamic>> result = [];
    if (keyword.isEmpty) {
      // If the search box is empty, show all data
      result = customerListModel;
    } else {
      // If there is a search term, filter data based on that term
      result = customerListModel
          .where((customer) =>
          customer['cusname']!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      filteredCustomers = result;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {                    ///*** New add  set length of new List with Map
                  filterCustomers(value);               ///*** New add  set length of new List with Map
                },                                      ///*** New add  set length of new List with Map
                decoration: InputDecoration(
                  labelText: 'Search by cusname',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCustomers.length,                            ///*** New add  set length of new List with Map
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredCustomers[index]['cusname'] ?? ''),     ///*** New add  set length of new List with Map
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(filteredCustomers[index]['phone'] ?? ''),          ///***  New add set length of new List with Map
                        Text(filteredCustomers[index]['division'] ?? ''),        ///***  New add set length of new List with Map
                      ],
                    ),
                    onTap: () {
                      // Handle item click if needed
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




}
