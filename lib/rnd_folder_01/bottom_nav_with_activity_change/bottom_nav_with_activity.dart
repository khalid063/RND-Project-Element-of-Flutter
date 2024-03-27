import 'package:flutter/material.dart';



import 'package:flutter/material.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/bottom_nav_with_activity_change/order_placement.dart';
import 'package:rnd_project_element_of_flutter/rnd_folder_01/bottom_nav_with_activity_change/pre_order_list.dart';

import 'order_list.dart';

// class OrderListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order List Screen'),
//       ),
//       body: Center(
//         child: Text('Order List Screen'),
//       ),
//     );
//   }
// }

// class PreOrderList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pre Order List Screen'),
//       ),
//       body: Center(
//         child: Text('Pre Order List Screen'),
//       ),
//     );
//   }
// }

class BottomNavWithActivity extends StatefulWidget {
  @override
  _BottomNavWithActivityState createState() => _BottomNavWithActivityState();
}

class _BottomNavWithActivityState extends State<BottomNavWithActivity> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    OrderPlacementScreen(),
    OrderListScreen(),
    PreOrderList(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Example'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  CustomBottomNavigationBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(30), // Adjust height as needed
      child: BottomAppBar(
        elevation: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomNavigationItem(
              icon: Icon(Icons.list_alt),
              label: 'Order Placement',
              isSelected: selectedIndex == 0,
              onTap: () => onItemTapped(0),
            ),
            BottomNavigationDivider(),
            BottomNavigationItem(
              icon: Icon(Icons.list_alt),
              label: 'Order List',
              isSelected: selectedIndex == 1,
              onTap: () => onItemTapped(1),
            ),
            BottomNavigationDivider(),
            BottomNavigationItem(
              icon: Icon(Icons.list_alt),
              label: 'Pre Order List',
              isSelected: selectedIndex == 2,
              onTap: () => onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final Icon icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  BottomNavigationItem({required this.icon, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          Text(
            label,
            style: TextStyle(color: isSelected ? Colors.blue : Colors.black),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1,
      height: 24, // Adjust height as needed
      child: VerticalDivider(
        color: Colors.red,
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: BottomNavWithActivity(),
//   ));
// }

































///-----------------------------------------------------------------
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }

// class BottomNavWithActivity extends StatefulWidget {
//   @override
//   _BottomNavWithActivityState createState() => _BottomNavWithActivityState();
// }
//
// class _BottomNavWithActivityState extends State<BottomNavWithActivity> {
//   int _selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bottom Navigation Example'),
//       ),
//       body: Center(
//         child: Text('Selected Index: $_selectedIndex'),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
//
// class CustomBottomNavigationBar extends StatelessWidget {
//   final int selectedIndex;
//   final ValueChanged<int> onItemTapped;
//
//   CustomBottomNavigationBar({required this.selectedIndex, required this.onItemTapped});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       elevation: 4,
//       child: Container(
//         height: 56, // Adjust height as needed
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             BottomNavigationItem(
//               icon: Icon(Icons.list_alt),
//               label: 'Ordered List',
//               isSelected: selectedIndex == 0,
//               onTap: () => onItemTapped(0),
//             ),
//             BottomNavigationDivider(),
//             BottomNavigationItem(
//               icon: Icon(Icons.list_alt),
//               label: 'Pre Order List',
//               isSelected: selectedIndex == 1,
//               onTap: () => onItemTapped(1),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class BottomNavigationItem extends StatelessWidget {
//   final Icon icon;
//   final String label;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   BottomNavigationItem({required this.icon, required this.label, required this.isSelected, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           icon,
//           Text(
//             label,
//             style: TextStyle(color: isSelected ? Colors.blue : Colors.black),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BottomNavigationDivider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 1,
//       height: 24, // Adjust height as needed
//       child: VerticalDivider(
//         color: Colors.grey,
//       ),
//     );
//   }
// }
