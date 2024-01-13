import 'package:flutter/material.dart';

class ListAsSharedPreference extends StatefulWidget {
  const ListAsSharedPreference({super.key});

  @override
  State<ListAsSharedPreference> createState() => _ListAsSharedPreferenceState();
}

class _ListAsSharedPreferenceState extends State<ListAsSharedPreference> {

  ///======================================== All Variables ================================================================================///
  List<Map<String, dynamic>> savedOrderList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List as shared preference'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        children: [
          ///------------------------------ Item Code  ------------------------------------------///
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  //color: Colors.green,
                  child: const Text(
                    'Item Code',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  //color: Colors.redAccent,
                  child: const Text(
                    ' : ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: TextFormField(
                    //controller: _pcsPerUnitTEController,
                    //controller: pcsPerUnitTEController,
                    // print('')
                    keyboardType: TextInputType. number,
                    decoration: InputDecoration(
                      hintText: 'Pcs Per Unit',
                    ),
                    // validator: ( String? value){
                    //   if (value?.trim().isEmpty ?? true){
                    //     return 'Enter Pcs Per Unit';
                    //   }
                    //   return null;
                    // },
                  ),

                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          ///------------------------------ Item Name  ------------------------------------------///
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  //color: Colors.green,
                  child: const Text(
                    'Item Name',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  //color: Colors.redAccent,
                  child: const Text(
                    ' : ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: TextFormField(
                    //controller: _pcsPerUnitTEController,
                    //controller: pcsPerUnitTEController,
                    // print('')
                    keyboardType: TextInputType. number,
                    decoration: InputDecoration(
                      hintText: 'Pcs Per Unit',
                    ),
                    // validator: ( String? value){
                    //   if (value?.trim().isEmpty ?? true){
                    //     return 'Enter Pcs Per Unit';
                    //   }
                    //   return null;
                    // },
                  ),

                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          ///------------------------------ Item Name  ------------------------------------------///
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  //color: Colors.green,
                  child: const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerRight,
                  //color: Colors.redAccent,
                  child: const Text(
                    ' : ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: TextFormField(
                    //controller: _pcsPerUnitTEController,
                    //controller: pcsPerUnitTEController,
                    // print('')
                    keyboardType: TextInputType. number,
                    decoration: InputDecoration(
                      hintText: 'Pcs Per Unit',
                    ),
                    // validator: ( String? value){
                    //   if (value?.trim().isEmpty ?? true){
                    //     return 'Enter Pcs Per Unit';
                    //   }
                    //   return null;
                    // },
                  ),

                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          ///------------------------------ Add Item Button  ------------------------------------------///
          ElevatedButton(onPressed: (){}, child: Text('Add Item'),),
        ],
      )
    );
  }
}
