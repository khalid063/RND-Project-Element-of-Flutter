import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class OrderScVesibilityTable extends StatefulWidget {
  const OrderScVesibilityTable({super.key});

  @override
  State<OrderScVesibilityTable> createState() => _OrderScVesibilityTableState();
}

class _OrderScVesibilityTableState extends State<OrderScVesibilityTable> {

  ///========================== vesible/unvesible ordrer form code =======================///
  bool isContentVisible = true;
  bool showFirstText = true;
  bool isFirstIcon = true;

  void toggleContent() {
    setState(() {
      isContentVisible = !isContentVisible;
      showFirstText = !showFirstText;
      isFirstIcon = !isFirstIcon;
    });
  }

  // data table object create
  //final DataTableSource _data = MyData();

  // Initially, showFirstBox and showSubmitButton are false
  bool showFirstBox = false;
  bool showSubmitButton = false;
  bool showSecondContainer = false;


  List<Map<String, dynamic>> _rowData = [
    {'ID': 'Item 1', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 2', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 3', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 4', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 5', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 6', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 7', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 8', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 9', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 10', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 11', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 12', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 13', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 14', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 15', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 16', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 17', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 18', 'Name': 'No', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 19', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    {'ID': 'Item 20', 'Name': 'Yes', 'Column3': 'Data1', 'Column4': 'Data2', 'Column5': 'Data3', 'Column6': 'Data4', 'Column7': 'Data5'},
    // Add more rows as needed
  ];




  ///====================================== List of Salse Type Dropdown Button =====================================///
  String? salseTypeselectedItem = 'Cash';
  List <String> listItem = ["Cash", "Card", "Both",];

  String selectedOption = ''; /// Store the selected option for yes and no Radiobutton

  ///====================================== List of Salse Type Dropdown Button =====================================///
  String? saleingUnitTypeSelectedItem = 'Cartoon';
  List<String> saleingUnitTypeListItem = ["Cartoon", "Pcs", "Outer"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [





              ///=================================== Second SizeBox (Initially Green) ==============================///
              Container(
                width: double.infinity,
                //height: double.infinity,
                color: Colors.white,

                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:  EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'Sales order',
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
                                  child: Text(
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
                                  //color: Colors.redAccent,
                                  child: Text(
                                    '1246',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'Date',
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
                                  child: Text(
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
                                  //color: Colors.redAccent,
                                  child: Text(
                                    '23-10-2023',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'Customer No.',
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
                                  child: Text(
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
                                  //color: Colors.redAccent,
                                  child: Text(
                                    'CUS-0065',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'Customer Name.',
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
                                  child: Text(
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
                                  //color: Colors.redAccent,
                                  child: Text(
                                    'Al Hossain Grosary',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'warehouse/VAN',
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
                                  child: Text(
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
                                  //color: Colors.redAccent,
                                  child: Text(
                                    'DM-GA-43-5663',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ///================================================= Salse Type ===========================================///
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'Sales Type',
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
                                  child: Text(
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
                                child: Center(
                                  child: Container(
                                    width: 100,
                                    //color: Colors.redAccent,
                                    child: Center(
                                      child: DropdownButton<String>(
                                        value: salseTypeselectedItem,
                                        onChanged: (newValue){
                                          setState(() {
                                            salseTypeselectedItem = newValue;
                                          });
                                        },
                                        items: listItem.map((valueItem) {
                                          return DropdownMenuItem(
                                            value: valueItem,
                                            child: Text(valueItem),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'Total Amount',
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
                                  child: Text(
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
                                  //color: Colors.redAccent,
                                  child: Text(
                                    '18543.00',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'Paid Amount',
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
                                  child: Text(
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
                                  height: 30,
                                  //color: Colors.redAccent,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Paid Amount',
                                      // border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                      //contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          ///======================================== Remark ================================================///
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  //color: Colors.green,
                                  child: Text(
                                    'Remark',
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
                                  child: Text(
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
                                  height: 30,
                                  //color: Colors.redAccent,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Remark',
                                      // border: InputBorder.none,
                                      contentPadding: EdgeInsets.only(left: 10),
                                      //contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      filled: true,
                                      fillColor: Colors.white70,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Divider(color: Colors.redAccent, height: 3,),
                          SizedBox(height: 5,),

                          ///========================================== vesible/unvesible order form ============================///
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 35,
                                //color: Colors.green,
                                child: SizedBox(
                                  height: 35,
                                  width: 100,
                                  child: Row(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(height: 0,),
                                          if (showFirstText)
                                            const Text(
                                              'Hide The Order Form',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                            ),
                                          if (!showFirstText)
                                            const Text(
                                              'Open The Order Form',
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                            ),
                                          SizedBox(height: 0),
                                        ],
                                      ),
                                      Spacer(),
                                      SizedBox(
                                        child: IconButton(
                                          icon: isFirstIcon ? SvgPicture.asset('assets/images/eye_hide_icon.svg', fit: BoxFit.fitHeight,) : SvgPicture.asset('assets/images/eye_visible_icon.svg', fit: BoxFit.fitHeight,),
                                          onPressed: (){
                                            toggleContent();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isContentVisible,
                                child: Container(
                                  // padding: EdgeInsets.all(10),
                                  // margin: EdgeInsets.all(10),
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(color: Colors.grey),
                                  // ),
                                  child: Column(
                                    children: [
                                      //Text('This is the content of the container.'),

                                      ///======================================== Search Area Start ========================================///
                                      SizedBox(height: 5,),
                                      Container(
                                        height: 40,
                                        //color: Colors.redAccent,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Search your Item',
                                            prefixIcon: Icon(Icons.search),
                                            // border: InputBorder.none,
                                            contentPadding: EdgeInsets.only(left: 10),
                                            //contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),

                                      ///============================================ Quantity Form Start  ==================================///
                                      const SizedBox(height: 10,),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 4,
                                      //       child: Container(
                                      //         //color: Colors.green,
                                      //         child: Text(
                                      //           'Item Code',
                                      //           style: TextStyle(
                                      //             fontSize: 17,
                                      //             fontWeight: FontWeight.w500,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Container(
                                      //         alignment: Alignment.centerRight,
                                      //         //color: Colors.redAccent,
                                      //         child: Text(
                                      //           ' : ',
                                      //           style: TextStyle(
                                      //             fontSize: 17,
                                      //             fontWeight: FontWeight.w500,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       flex: 5,
                                      //       child: Container(
                                      //         //color: Colors.redAccent,
                                      //         child: Text(
                                      //           'FS0065',
                                      //           style: TextStyle(
                                      //             fontSize: 17,
                                      //             fontWeight: FontWeight.w500,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      const SizedBox(height: 0,),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              //color: Colors.green,
                                              child: Text(
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
                                              child: Text(
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
                                              //color: Colors.redAccent,
                                              child: Text(
                                                'LPG Gas',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5,),

                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       flex: 4,
                                      //       child: Container(
                                      //         //color: Colors.green,
                                      //         child: Text(
                                      //           'Description',
                                      //           style: TextStyle(
                                      //             fontSize: 17,
                                      //             fontWeight: FontWeight.w500,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       flex: 1,
                                      //       child: Container(
                                      //         alignment: Alignment.centerRight,
                                      //         //color: Colors.redAccent,
                                      //         child: Text(
                                      //           ' : ',
                                      //           style: TextStyle(
                                      //             fontSize: 17,
                                      //             fontWeight: FontWeight.w500,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Expanded(
                                      //       flex: 5,
                                      //       child: Container(
                                      //         height: 60,
                                      //         //color: Colors.redAccent,
                                      //         child: TextFormField(
                                      //           maxLines: 4,
                                      //           decoration: InputDecoration(
                                      //             hintText: 'Description',
                                      //             // border: InputBorder.none,
                                      //             contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 2, right: 5),
                                      //             //contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      //             filled: true,
                                      //             fillColor: Colors.white70,
                                      //             border: OutlineInputBorder(),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //
                                      //
                                      //
                                      //
                                      //
                                      //     // Expanded(
                                      //     //   flex: 5,
                                      //     //   child: Container(
                                      //     //     height: 30,
                                      //     //     //color: Colors.redAccent,
                                      //     //     child: TextFormField(
                                      //     //       //minLines: 4,
                                      //     //       decoration: InputDecoration(
                                      //     //         hintText: 'Remark',
                                      //     //         // border: InputBorder.none,
                                      //     //         contentPadding: EdgeInsets.only(left: 10),
                                      //     //         //contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                      //     //         filled: true,
                                      //     //         fillColor: Colors.white70,
                                      //     //         border: OutlineInputBorder(),
                                      //     //       ),
                                      //     //     ),
                                      //     //   ),
                                      //     // ),
                                      //   ],
                                      // ),
                                      // const SizedBox(height: 5,),

                                      ///============================================ Saleing Units =====================================///
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              //color: Colors.green,
                                              child: Text(
                                                'Saleing Unit',
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
                                              child: Text(
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
                                            child: Center(
                                              child: Container(
                                                width: 100,
                                                //color: Colors.redAccent,
                                                child: Center(
                                                  child : DropdownButton<String>(
                                                    value: saleingUnitTypeSelectedItem,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        saleingUnitTypeSelectedItem = newValue;
                                                      });
                                                    },
                                                    items: saleingUnitTypeListItem.map((valueItem) {
                                                      return DropdownMenuItem(
                                                        value: valueItem,
                                                        child: Text(valueItem),
                                                      );
                                                    }).toList(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              //color: Colors.green,
                                              child: Text(
                                                'Product Quantity',
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
                                              child: Text(
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
                                              height: 30,
                                              //color: Colors.redAccent,
                                              child: TextFormField(
                                                //maxLines: 4,
                                                //keyboardType: TextInputType.number,
                                                keyboardType: TextInputType. number,
                                                decoration: InputDecoration(
                                                  hintText: 'Product Quentity',
                                                  // border: InputBorder.none,
                                                  contentPadding: EdgeInsets.only(left: 10, top: 10, bottom: 2, right: 5),
                                                  //contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                                  filled: true,
                                                  fillColor: Colors.white70,
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                            ),
                                          ),





                                          // Expanded(
                                          //   flex: 5,
                                          //   child: Container(
                                          //     height: 30,
                                          //     //color: Colors.redAccent,
                                          //     child: TextFormField(
                                          //       //minLines: 4,
                                          //       decoration: InputDecoration(
                                          //         hintText: 'Remark',
                                          //         // border: InputBorder.none,
                                          //         contentPadding: EdgeInsets.only(left: 10),
                                          //         //contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                          //         filled: true,
                                          //         fillColor: Colors.white70,
                                          //         border: OutlineInputBorder(),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      /// ============================================ FOC ================================================///
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              //color: Colors.green,
                                              child: Text(
                                                'FOC',
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
                                              child: Text(
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
                                            child: Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Radio(
                                                      value: 'yes',
                                                      groupValue: selectedOption,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedOption = value as String;
                                                        });
                                                      },
                                                    ),
                                                    Text('Yes'),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Radio(
                                                      value: 'no',
                                                      groupValue: selectedOption,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          selectedOption = value as String;
                                                        });
                                                      },
                                                    ),
                                                    Text('No'),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),





                                          // Expanded(
                                          //   flex: 5,
                                          //   child: Container(
                                          //     height: 30,
                                          //     //color: Colors.redAccent,
                                          //     child: TextFormField(
                                          //       //minLines: 4,
                                          //       decoration: InputDecoration(
                                          //         hintText: 'Remark',
                                          //         // border: InputBorder.none,
                                          //         contentPadding: EdgeInsets.only(left: 10),
                                          //         //contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                                          //         filled: true,
                                          //         fillColor: Colors.white70,
                                          //         border: OutlineInputBorder(),
                                          //       ),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              //color: Colors.green,
                                              child: Text(
                                                'Quantity Per Pce',
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
                                              child: Text(
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
                                              //color: Colors.redAccent,
                                              child: Text(
                                                '300 BDT',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              //color: Colors.green,
                                              child: const Text(
                                                'Quantity in Pce',
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
                                              //color: Colors.redAccent,
                                              child: const Text(
                                                '100 BDT',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Container(
                                              //color: Colors.green,
                                              child: Text(
                                                'Price Per Unit',
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
                                              //color: Colors.redAccent,
                                              child: Text(
                                                '50 BDT',
                                                style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Add your container content here
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),


                          /// ============================================ Old Order form Start ================================================///v

                          ///======================================== Search Area Start ========================================///

                          ///============================================ Quantity Form Start ==================================///

                          /// ============================================ Old Order form end ================================================///



                          ///============================================= submit button with visibility 2 option ========================================///



                          ///============================= old button =====================///
                          // const SizedBox(height: 20,),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: ElevatedButton(
                          //     onPressed: () {},
                          //     child: Text('Add to Cart'),
                          //   ),
                          // ),


                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Row containing Preview and Submit buttons


              ///==================================== First SizeBox (Initially Hidden, Red background) =====================================///

              Center(
                child: Visibility(
                  visible: showFirstBox,
                  child: Expanded(
                    child: Container(
                        width: double.infinity,
                        //height: 800,
                        color: Colors.lightBlueAccent,
                        child: Column(
                          children: [
                            PaginatedDataTable(
                              header: Text('DataTable with Delete Buttons'),
                              rowsPerPage: 5,
                              columnSpacing: 15,
                              horizontalMargin: 5,
                              columns: const [
                                DataColumn(
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Item', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Name', style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                DataColumn(
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('FOC', style: TextStyle(fontWeight: FontWeight.bold)),
                                      //Text('(Second Part)', style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                DataColumn(
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Selling', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Unit', style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                DataColumn(
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Pcs Per', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Unit', style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                DataColumn(
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Qty Per', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Pcs', style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                DataColumn(
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Rate', style: TextStyle(fontWeight: FontWeight.bold)),
                                      //Text('(Second Part)', style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                DataColumn(
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                                      Text('Amount', style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                                DataColumn(
                                  label: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text('Delete', style: TextStyle(fontWeight: FontWeight.bold)),
                                      //Text('(Second Part)', style: TextStyle(fontSize: 12)),
                                    ],
                                  ),
                                ),
                              ],
                              source: CustomDataTableSource(rowData: _rowData, onDelete: _deleteRow),
                            ),


                            // PaginatedDataTable(
                            //   source: _data,
                            //   columns: [
                            //     //DataColumn(label: Text('Row')),         // 999
                            //     //DataColumn(label: Text('Item Code')),
                            //     DataColumn(label: Text('Item Name')),
                            //     DataColumn(label: Text('FOC')),
                            //     DataColumn(label: Text('Selling Unit')),
                            //     DataColumn(label: Text('Pcs Per Unit')),
                            //     DataColumn(label: Text('Qty in Pcs')),
                            //     DataColumn(label: Text('Rate')),
                            //     DataColumn(label: Text('Total Amount')),
                            //   ],
                            //   header: const Center(child: Text('My Product'),),
                            //   rowsPerPage: 5,
                            //   columnSpacing: 20,
                            //   //horizontalMargin: 60,
                            // ),
                          ],
                        )
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              ///============================================= submit button with visibility 2 option ========================================///

              SizedBox(height: 5,),
              Column(
                children: [
                  Visibility(
                    visible: !showSecondContainer,

                    child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.white,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Show the second container
                            setState(() {
                              showSecondContainer = true;
                              showFirstBox = true;
                            });
                          },
                          child: Text('Preview', style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    ),
                  ),

                  // Second Container with Preview and Submit Buttons (Initially Hidden)
                  Visibility(
                    visible: showSecondContainer,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        width: 400,
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Preview Button
                            ElevatedButton(
                              onPressed: () {
                                // Handle preview button press
                                print('Preview button pressed');
                              },
                              child: Text('Edit', style: TextStyle(color: Colors.black),),
                            ),

                            // Submit Button
                            ElevatedButton(
                              onPressed: () {
                                // Handle submit button press
                                print('Submit button pressed');
                              },
                              child: Text('Submit',  style: TextStyle(color: Colors.black)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),


              // Center(
              //   child: Visibility(
              //     visible: showFirstBox,
              //     child: Container(
              //       width: 200,
              //       height: 100,
              //       color: Colors.red,
              //       child: Center(
              //         child: Text('First SizeBox'),
              //       ),
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10,),




              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // Preview Button
              //     TextButton(
              //       onPressed: () {
              //         // Show the first SizeBox and the Submit button
              //         setState(() {
              //           showFirstBox = true;
              //           showSubmitButton = true;
              //         });
              //       },
              //       child: Text('Preview'),
              //     ),
              //
              //     // Submit Button (Initially Hidden)
              //     Visibility(
              //       visible: showSubmitButton,
              //       child: TextButton(
              //         onPressed: () {
              //           // Handle submit button press
              //           print('Submit button pressed');
              //         },
              //         child: Text('Submit'),
              //       ),
              //     ),
              //   ],
              // ),



            ],
          ),
        ),
      ),
    );
  }
  /// dable data delete code
  void _deleteRow(int rowIndex) {
    setState(() {
      _rowData.removeAt(rowIndex);
    });
  }

}

class CustomDataTableSource extends DataTableSource {
  final List<Map<String, dynamic>> rowData;
  final Function(int) onDelete;

  CustomDataTableSource({required this.rowData, required this.onDelete});

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




// class MyData extends DataTableSource {
//
//   final List<Map<String, dynamic>> _data = List.generate(
//       20,
//           (index) => {
//             //"id": index,
//             //"title": "Item $index",
//             "title": "Item $index",
//             "total_price": Random().nextInt(10000),
//             "total_Quantity": Random().nextInt(10000),
//             "total_payment_pay": Random().nextInt(10000),
//             "description": Random().nextInt(10000),
//             "que_per_pcs": Random().nextInt(10000),
//             "rate": Random().nextInt(10000),
//             "tatal_amount": Random().nextInt(10000),
//
//
//         // "id": index,
//         // "title": "Item $index",
//         // "price": Random().nextInt(10000),
//         // "total_price": Random().nextInt(10000),
//         // "total_Quantity": Random().nextInt(10000),
//         // "total_payment_pay": Random().nextInt(10000),
//         // "description": Random().nextInt(10000),
//         // "que_per_pcs": Random().nextInt(10000),
//         // "rate": Random().nextInt(10000),
//         // "tatal_amount": Random().nextInt(10000),
//       });
//
//
//   @override
//   DataRow? getRow(int index) {
//     return DataRow(cells: [
//       //DataCell(Text(_data[index]['title'].toString())),
//       //DataCell(Text(_data[index]['title'])),
//       DataCell(Text(_data[index]['price'].toString())),
//       DataCell(Text(_data[index]['total_price'].toString())),
//       DataCell(Text(_data[index]['total_Quantity'].toString())),
//       DataCell(Text(_data[index]['description'].toString())),
//       DataCell(Text(_data[index]['que_per_pcs'].toString())),
//       DataCell(Text(_data[index]['rate'].toString())),
//       DataCell(Text(_data[index]['tatal_amount'].toString())),
//
//
//
//       // DataCell(Text(_data[index]['id'].toString())),
//       // DataCell(Text(_data[index]['title'])),
//       // DataCell(Text(_data[index]['price'].toString())),
//       // DataCell(Text(_data[index]['total_price'].toString())),
//       // DataCell(Text(_data[index]['total_Quantity'].toString())),
//       // DataCell(Text(_data[index]['description'].toString())),
//       // DataCell(Text(_data[index]['que_per_pcs'].toString())),
//       // DataCell(Text(_data[index]['rate'].toString())),
//       // DataCell(Text(_data[index]['tatal_amount'].toString())),
//     ]);
//   }
//
//   @override
//   // TODO: implement isRowCountApproximate
//   bool get isRowCountApproximate => false;
//
//   @override
//   // TODO: implement rowCount
//   int get rowCount => _data.length;
//
//   @override
//   // TODO: implement selectedRowCount
//   int get selectedRowCount => 0;
//
// }
