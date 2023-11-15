import 'package:flutter/material.dart';

class ExpandableContainerScreen extends StatefulWidget {
  const ExpandableContainerScreen({super.key});

  @override
  State<ExpandableContainerScreen> createState() => _ExpandableContainerScreenState();
}

class _ExpandableContainerScreenState extends State<ExpandableContainerScreen> {

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              child: SizedBox(
                  height: 50,
                  width: 100,
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 10,),
                          if (showFirstText)
                            const Text(
                              'Hide The Order Form',
                              style: TextStyle(fontSize: 18),
                            ),
                          if (!showFirstText)
                            const Text(
                              'Open The Order Form',
                              style: TextStyle(fontSize: 18),
                            ),
                          SizedBox(height: 20),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: SizedBox(
                          child: IconButton(
                            icon: isFirstIcon ? Icon(Icons.account_circle) : Icon(Icons.hide_image),
                            onPressed: (){
                              toggleContent();
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
            ),
            Visibility(
              visible: isContentVisible,
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: const Column(
                  children: [
                    Text('This is the content of the container.'),
                    // Add your container content here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
