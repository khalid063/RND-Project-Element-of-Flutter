
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:rnd_project_element_of_flutter/rnd_folder_01/print_pdf/pdf_example_1/preview_screen.dart';

import 'package:flutter/material.dart';


class PreviewScreenThree extends StatelessWidget {

  final pw.Document doc;
  const PreviewScreenThree({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Preview Screen'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_outlined),
        ),
        centerTitle: true,
        title: Text('Preview'),
      ),
      body: PdfPreview(
        build: (format) => doc.save(),
        allowSharing: true,
        allowPrinting: true,
        initialPageFormat: PdfPageFormat.a4,
        pdfFileName: "mydoc.pdf",
      ),
    );
  }
}





// class PreviewScreen extends StatefulWidget {
//
//   final pw.Document doc;
//
//   const PreviewScreen({super.key, required this.doc,});
//
//   @override
//   State<PreviewScreen> createState() => _PreviewScreenState();
// }
//
// class _PreviewScreenState extends State<PreviewScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         //title: Text('Preview Screen'),
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: Icon(Icons.arrow_back_outlined),
//         ),
//         centerTitle: true,
//         title: Text('Preview'),
//       ),
//       body: PdfPreview(
//         build: (format) => doc.save(),
//         allowSharing: true,
//         allowPrinting: true,
//         initialPageFormat: PdfPageFormat.a4,
//         pdfFileName: "mycoc.pdf",
//       ),
//     );
//   }
// }
