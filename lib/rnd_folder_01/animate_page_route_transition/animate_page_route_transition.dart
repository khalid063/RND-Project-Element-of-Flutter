import 'package:flutter/material.dart';

class AnimatedPageRouteScreen extends StatefulWidget {
  const AnimatedPageRouteScreen({super.key});

  @override
  State<AnimatedPageRouteScreen> createState() => _AnimatedPageRouteScreenState();
}

class _AnimatedPageRouteScreenState extends State<AnimatedPageRouteScreen> {

  // Instantiate a variable for later use
  //MaterialPageRoute myMaterialPageRoute = createMaterialPageRoute();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {

            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2()));

            // Navigator.of(context).push(
            //   customRouteBuilder(
            //     MaterialPageRoute(
            //       builder: (context) => const Page2(),
            //       // Other parameters as needed
            //     ),
            //   ),
            // );

            Navigator.of(context).push(CustomRouteBuilder(MaterialPageRoute(builder: (context) => Page2(),),),);

          },
          child: const Text('Go!'),
        ),
      ),
    );
  }
}

PageRouteBuilder CustomRouteBuilder(MaterialPageRoute materialPageRoute) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return materialPageRoute.builder!(context);
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0); // Start from the right
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}



/// code work 1
// PageRouteBuilder customPageRouteBuilder(MaterialPageRoute materialPageRoute) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) {
//       return materialPageRoute.builder!(context);
//     },
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.5, 1.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;
//
//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
//
//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

/// Navigator calling code
////Navigator.of(context).push(MaterialPageRoute(builder: (context) => Page2()));



class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2'),
      ),
    );
  }
}
