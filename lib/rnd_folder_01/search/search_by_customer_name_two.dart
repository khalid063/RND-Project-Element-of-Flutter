import 'package:flutter/material.dart';

import '../../services/network_caller.dart';
import '../../services/network_response.dart';
import '../../services/urls.dart';
import 'customer_list_model.dart';

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  bool _getCustomerListInProgress = false;
  CustomerListModel _customerListModel = CustomerListModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCustomerList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer List'),
      ),
      body: _getCustomerListInProgress
          ? Center(
        child: CircularProgressIndicator(),
      )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns you want
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _customerListModel.data?.length ?? 0,
        itemBuilder: (context, index) {
          return buildCustomerCard(_customerListModel.data![index]);
        },
      ),
    );
  }

  Widget buildCustomerCard(Data customer) {
    return Card(
      // Customize the card as needed
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Name: ${customer.cusname}'),
          Text('Phone: ${customer.phone}'),
          // Add other fields you want to display
        ],
      ),
    );
  }

  Future<void> getCustomerList() async {
    _getCustomerListInProgress = true;
    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.customerList);

    if (response.isSuccess) {
      _customerListModel = CustomerListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Summary Data get Failed!'),
          ),
        );
      }
    }

    _getCustomerListInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }
}
