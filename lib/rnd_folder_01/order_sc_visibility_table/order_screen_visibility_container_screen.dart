import 'package:flutter/material.dart';

class OrderScreenVisibilityContainer extends StatefulWidget {
  const OrderScreenVisibilityContainer({super.key});

  @override
  State<OrderScreenVisibilityContainer> createState() => _OrderScreenVisibilityContainerState();
}

class _OrderScreenVisibilityContainerState extends State<OrderScreenVisibilityContainer> {

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///=========================================== First Container ==================================///
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.green,
                child: Center(
                  child: Text('First Container'),
                ),
              ),
              const SizedBox(height: 20,),

              ///==================================== Second  Container (Initially Hidden, Red background) =====================================///
              Container(
                width: double.infinity,
                child: Visibility(
                  visible: showFirstBox,
                  child: Expanded(
                    child: Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.lightBlueAccent,
                        child: Center(child: Text('Second Container'),),
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

            ],
          ),
        ),
      )
    );
  }
}
