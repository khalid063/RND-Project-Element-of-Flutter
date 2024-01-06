import 'package:flutter/material.dart';

import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:rnd_project_element_of_flutter/rnd_folder_01/print_pdf/pdf_example_1/preview_screen.dart';
import 'package:flutter/services.dart';

class PrintPdfThree extends StatefulWidget {
  const PrintPdfThree({super.key});

  @override
  State<PrintPdfThree> createState() => _PrintPdfThreeState();
}

class _PrintPdfThreeState extends State<PrintPdfThree> {

  ///---------- Create PDF new
  void _createPdf() async {
    final doc = pw.Document();

    // Sample product list
    List<String> productList = [
      'Product 1',
      'Product 2',
      'Product 3',
      'Product 4',
      'Product 5',
      'Product 6',
      'Product 7',
      'Product 8',
      'Product 9',
      'Product 10',
      'Product 11',
      'Product 12',
      'Product13',
      'Product 14',
      'Product 15',
      'Product 16',
      'Product 17',
      'Product 18',
      'Product 19',
      'Product 20',
      'Product 21',
      'Product 22',
      'Product 23',
      'Product 24',
      'Product 25',
      'Product 26',
      'Product 27',
      'Product 28',
      'Product 29',
      'Product 30',
      'Product 31',
      // ... Add more products
    ];

    // Define the maximum number of products per page
    final int productsPerPage = 10;

    // Calculate the total number of pages required
    int totalPages = (productList.length / productsPerPage).ceil();

    // Fixed header content
    final pw.Widget header = pw.Container(
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text('BULKCOR TRADING LLC'),
          pw.Text('DELIVERY VAN 1543'),
          pw.Text('WH N0 6, JIODAH STREET, AL JURF IND AREA 3'),
          pw.Text('AJMAN - UAE'),
          pw.Text('+88 01955209050'),
          pw.Text('TRN : 1009654328765'),
          pw.Text('TAX INVOICE'),
        ],
      ),
    );

    // Fixed footer content
    final pw.Widget footer = pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Payment Mode: CREDIT', style: pw.TextStyle(fontSize: 12)),
        pw.SizedBox(height: 5),
        pw.Text('Balance: 144.01', style: pw.TextStyle(fontSize: 12)),
        pw.Text('Party Balance: 144.01', style: pw.TextStyle(fontSize: 12)),
        pw.Text('Salse Man: SUHEL MIA', style: pw.TextStyle(fontSize: 12)),
        pw.Text('Bank Details', style: pw.TextStyle(fontSize: 12)),
        pw.Text('Bank: DDBL', style: pw.TextStyle(fontSize: 12)),
        pw.Text('Acc No: 1015755784701', style: pw.TextStyle(fontSize: 12)),
        pw.Text('IFSC:', style: pw.TextStyle(fontSize: 12)),
      ],
    );

    // Loop through each page
    for (int currentPage = 0; currentPage < totalPages; currentPage++) {
      doc.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            // Calculate the start and end indices for the current page
            int startIndex = currentPage * productsPerPage;
            int endIndex = (currentPage + 1) * productsPerPage;

            // Ensure endIndex does not exceed the total number of products
            if (endIndex > productList.length) {
              endIndex = productList.length;
            }

            // Extract the products for the current page
            List<String> productsOnPage = productList.sublist(startIndex, endIndex);

            // Build the content for the current page
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                header,  // Fixed header
                for (String product in productsOnPage)
                  pw.Text(product),
                footer,  // Fixed footer
              ],
            );
          },
        ),
      );
    }

    // Print the document using the iOS or Android print service
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => doc.save());
  }



  // void _createPdf() async{
  //   final doc = pw.Document();
  //
  //   /// for using an image from assets
  //   //final image = await imageFromAssetBundle('assets/image.png');
  //
  //   doc.addPage(
  //     pw.Page(
  //       pageFormat: PdfPageFormat.a4,
  //       build: (pw.Context context) {
  //         return pw.Center(
  //           //child: pw.Text('Hello Delta Group'),
  //           child: pw.Container(
  //             child: pw.Column(
  //               children: [
  //                 pw.Text('BULKCOR TRADING LLC'),
  //                 pw.Text('DELIVERY VAN 1543'),
  //                 pw.Text('WH N0 6, JIODAH STREET, AL JURF IND AREA 3'),
  //                 pw.Text('AJMAN - UAE'),
  //                 pw.Text('+88 01955209050'),
  //                 pw.Text('TRN : 1009654328765'),
  //                 pw.Text('TAX INVOICE'),
  //               ]
  //             ),
  //           ),
  //         );
  //       }
  //     )
  //   );
  //
  //   /// print the document using the iOs or Android print service:
  //   await Printing.layoutPdf(onLayout: (PdfPageFormat formate) async => doc.save());
  //
  //   /// share the document to other applications:
  //   //await Printing.sharePdf(bytes: await doc.save(), filename: 'my-document.pdf');
  //
  //   /// save PDF with Flutter library "path_provider"
  //   /// need to see path provider tutorial
  //   //final output = await getTemporaryDirectory();
  //   // final file = File('${output.path}/example.pdf');
  //   // await file.writeAsBytest(await doc.save());
  //
  // }

  /// display a pdf document
  void _displayPdf() {
    final doc = pw.Document();

    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {

          return pw.Center(
            //child: pw.Text('Hello Delta Group'),
            child: pw.Container(
              child: pw.Column(
                  children: [
                    ///---------------------------------------- Head Information ----------------------------------------------------------------------///
                    pw.Text('BULKCOR TRADING LLC', style: pw.TextStyle(fontSize: 18,)),
                    pw.Text('DELIVERY VAN 1543', style: pw.TextStyle(fontSize: 15)),
                    pw.Text('WH N0 6, JIODAH STREET, AL JURF IND AREA 3', style: pw.TextStyle(fontSize: 15)),
                    pw.Text('AJMAN - UAE', style: pw.TextStyle(fontSize: 15)),
                    pw.Text('+88 01955209050', style: pw.TextStyle(fontSize: 15)),
                    pw.Text('TRN : 1009654328765', style: pw.TextStyle(fontSize: 15)),
                    pw.Text('TAX INVOICE', style: pw.TextStyle(fontSize: 15)),
                    pw.SizedBox(height: 20),
                    ///---------------------------------------- Invoice Number & Date -----------------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Text("Inv.No:", style: pw.TextStyle(fontSize: 10)),
                          pw.Text("A/6754", style: pw.TextStyle(fontSize: 10)),
                          pw.Spacer(),
                          pw.Text('Date:', style: pw.TextStyle(fontSize: 10)),
                          pw.Text('26/02/2023', style: pw.TextStyle(fontSize: 10)),
                        ]
                    ),
                    pw.SizedBox(height: 10),
                    ///---------------------------------------- Customer Name --------------------------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Text('Customer', style: pw.TextStyle(fontSize: 10)),
                          pw.Text('ALMA SUPERMARKET BR 1', style: pw.TextStyle(fontSize: 10)),
                        ]
                    ),
                    ///---------------------------------------- Customer Details Info -----------------------------------------------------------------///
                    pw.Container(
                        width: double.infinity,
                        child: pw.Column(
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text('SHARJAH', style: pw.TextStyle(fontSize: 10)),
                              pw.Text('Ph: 01955208765', style: pw.TextStyle(fontSize: 10)),
                              pw.Text('TRN: 1009765487654', style: pw.TextStyle(fontSize: 10)),
                            ]
                        )
                    ),
                    //pw.Divider(height: 2, color: PdfColor.fromHex(#FFFF5733 as String)),
                    pw.Divider(height: 2),
                    ///---------------------------------------- Table Head (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                child: pw.Text('VAT', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                child: pw.Text('QTY', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                child: pw.Text('PRICE', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                child: pw.Text('AMOUNT', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    pw.Divider(height: 2),
                    ///---------------------------------------- Item Show 1 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    //pw.Divider(height: 1),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),                    ///---------------------------------------- Item Show 2 (Table Field Name) -----------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    //pw.Divider(height: 1),
                    ///---------------------------------------- Item Show 3 (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    pw.Divider(height: 1),
                    ///---------------------------------------- Total (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('Total', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 2,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('144.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('138.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    pw.Divider(height: 2),
                    ///---------------------------------------- Discount (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 4,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('Discount:', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('8.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- VAT (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 4,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('VAT:', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('85.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    pw.Divider(height: 2),
                    ///---------------------------------------- Total Before VAT (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 9,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 5,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('Total Before VAT:', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('85.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- VAT Amount (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 4,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('VAT Amount:', style: pw.TextStyle(fontSize: 12,)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('8.80', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- VAT Inclusive Amount (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 8,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 6,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('VAT Inclusive Amount:', style: pw.TextStyle(fontSize: 12,)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('144.80', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Bill Discount (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 4,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('Bill Discount:', style: pw.TextStyle(fontSize: 12,)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('0.00', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Bill Amount (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 4,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('Bill Amount:', style: pw.TextStyle(fontSize: 12,)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('144.00', style: pw.TextStyle(fontSize: 14,)),
                              )
                          ),

                        ]
                    ),
                    ///---------------------------------------- Footer Info (Table Field Name) ---------------------------------------------------------///
                    pw.Row(
                        children: [
                          pw.Expanded(
                              flex: 10,
                              child: pw.Container(
                                //height: 20,
                                  margin: pw.EdgeInsets.only(top: 5),
                                  //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                  ///---------- Item Name ----------///
                                  child: pw.Column(
                                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                                      children: [
                                        pw.Text('Payment Mode: CREDIT', style: pw.TextStyle(fontSize: 12)),
                                        pw.SizedBox(height: 5),
                                        pw.Text('Balance: 144.01', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Party Balance: 144.01', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Salse Man: SUHEL MIA', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Bank Details', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Bank: DDBL', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('Acc No: 1015755784701', style: pw.TextStyle(fontSize: 12)),
                                        pw.Text('IFSC:', style: pw.TextStyle(fontSize: 12)),
                                      ]
                                  )
                                //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- VAT ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 4,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- QTY (quentity) ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12,)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
                                ///---------- Price ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
                              )
                          ),
                          pw.Expanded(
                              flex: 3,
                              child: pw.Container(
                                //height: 20,
                                margin: pw.EdgeInsets.only(top: 5),
                                //color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
                                ///---------- Total Amount ----------///
                                child: pw.Text('', style: pw.TextStyle(fontSize: 14,)),
                              )
                          ),

                        ]
                    ),

                  ]
              ),
            ),
          );


          // return pw.Center(
          //   //child: pw.Text('Hello Delta Group'),
          //   child: pw.Container(
          //     child: pw.Column(
          //         children: [
          //           ///---------------------------------------- Head Information ----------------------------------------------------------------------///
          //           pw.Text('BULKCOR TRADING LLC', style: pw.TextStyle(fontSize: 18,)),
          //           pw.Text('DELIVERY VAN 1543', style: pw.TextStyle(fontSize: 15)),
          //           pw.Text('WH N0 6, JIODAH STREET, AL JURF IND AREA 3', style: pw.TextStyle(fontSize: 15)),
          //           pw.Text('AJMAN - UAE', style: pw.TextStyle(fontSize: 15)),
          //           pw.Text('+88 01955209050', style: pw.TextStyle(fontSize: 15)),
          //           pw.Text('TRN : 1009654328765', style: pw.TextStyle(fontSize: 15)),
          //           pw.Text('TAX INVOICE', style: pw.TextStyle(fontSize: 15)),
          //           pw.SizedBox(height: 20),
          //           ///---------------------------------------- Invoice Number & Date -----------------------------------------------------------------///
          //           pw.Row(
          //             children: [
          //               pw.Text("Inv.No:", style: pw.TextStyle(fontSize: 10)),
          //               pw.Text("A/6754", style: pw.TextStyle(fontSize: 10)),
          //               pw.Spacer(),
          //               pw.Text('Date:', style: pw.TextStyle(fontSize: 10)),
          //               pw.Text('26/02/2023', style: pw.TextStyle(fontSize: 10)),
          //             ]
          //           ),
          //           pw.SizedBox(height: 10),
          //           ///---------------------------------------- Customer Name --------------------------------------------------------------------------///
          //           pw.Row(
          //             children: [
          //               pw.Text('Customer', style: pw.TextStyle(fontSize: 10)),
          //               pw.Text('ALMA SUPERMARKET BR 1', style: pw.TextStyle(fontSize: 10)),
          //             ]
          //           ),
          //           ///---------------------------------------- Customer Details Info -----------------------------------------------------------------///
          //           pw.Container(
          //             width: double.infinity,
          //             child: pw.Column(
          //               mainAxisAlignment: pw.MainAxisAlignment.start,
          //               crossAxisAlignment: pw.CrossAxisAlignment.start,
          //               children: [
          //                 pw.Text('SHARJAH', style: pw.TextStyle(fontSize: 10)),
          //                 pw.Text('Ph: 098654326', style: pw.TextStyle(fontSize: 10)),
          //                 pw.Text('TRN: 1009765487654', style: pw.TextStyle(fontSize: 10)),
          //               ]
          //             )
          //           ),
          //           //pw.Divider(height: 2, color: PdfColor.fromHex(#FFFF5733 as String)),
          //           pw.Divider(height: 2),
          //           ///---------------------------------------- Table Head (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //             children: [
          //               pw.Expanded(
          //                 flex: 10,
          //                 child: pw.Container(
          //                   height: 20,
          //                   margin: pw.EdgeInsets.only(top: 5),
          //                   color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                   child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                 )
          //               ),
          //               pw.Expanded(
          //                   flex: 3,
          //                   child: pw.Container(
          //                     height: 20,
          //                     margin: pw.EdgeInsets.only(top: 5),
          //                     color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                     child: pw.Text('VAT', style: pw.TextStyle(fontSize: 12)),
          //                   )
          //               ),
          //               pw.Expanded(
          //                   flex: 2,
          //                   child: pw.Container(
          //                     height: 20,
          //                     margin: pw.EdgeInsets.only(top: 5),
          //                     color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                     child: pw.Text('QTY', style: pw.TextStyle(fontSize: 12)),
          //                   )
          //               ),
          //               pw.Expanded(
          //                   flex: 3,
          //                   child: pw.Container(
          //                     height: 20,
          //                     margin: pw.EdgeInsets.only(top: 5),
          //                     color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                     child: pw.Text('PRICE', style: pw.TextStyle(fontSize: 12)),
          //                   )
          //               ),
          //               pw.Expanded(
          //                   flex: 3,
          //                   child: pw.Container(
          //                     height: 20,
          //                     margin: pw.EdgeInsets.only(top: 5),
          //                     color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                     child: pw.Text('AMOUNT', style: pw.TextStyle(fontSize: 12)),
          //                   )
          //               ),
          //
          //             ]
          //           ),
          //           pw.Divider(height: 2),
          //           ///---------------------------------------- Item Show 1 (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 2,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           pw.Divider(height: 1),
          //           ///---------------------------------------- Item Show 2 (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 2,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           pw.Divider(height: 1),
          //           ///---------------------------------------- Item Show 3 (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('DAL BHAJA', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('Code: 2008', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('5.0%', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 2,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('12.0', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('5.95', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('72.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           pw.Divider(height: 1),
          //           ///---------------------------------------- Total (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('Total', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 2,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('144.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('138.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           pw.Divider(height: 2),
          //           ///---------------------------------------- Discount (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 4,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('Discount:', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('8.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           ///---------------------------------------- VAT (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 4,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('VAT:', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('85.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           pw.Divider(height: 2),
          //           ///---------------------------------------- Total Before VAT (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 9,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 5,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('Total Before VAT:', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('85.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           ///---------------------------------------- VAT Amount (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 4,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('VAT Amount:', style: pw.TextStyle(fontSize: 12,)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('8.80', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           ///---------------------------------------- VAT Inclusive Amount (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 8,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 6,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('VAT Inclusive Amount:', style: pw.TextStyle(fontSize: 12,)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('144.80', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           ///---------------------------------------- Bill Discount (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 4,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('Bill Discount:', style: pw.TextStyle(fontSize: 12,)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('0.00', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           ///---------------------------------------- Bill Amount (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 4,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('Bill Amount:', style: pw.TextStyle(fontSize: 12,)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('144.00', style: pw.TextStyle(fontSize: 14,)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //           ///---------------------------------------- Footer Info (Table Field Name) ---------------------------------------------------------///
          //           pw.Row(
          //               children: [
          //                 pw.Expanded(
          //                     flex: 10,
          //                     child: pw.Container(
          //                       //height: 20,
          //                         margin: pw.EdgeInsets.only(top: 5),
          //                         color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                         ///---------- Item Name ----------///
          //                         child: pw.Column(
          //                             crossAxisAlignment: pw.CrossAxisAlignment.start,
          //                             children: [
          //                               pw.Text('Payment Mode: CREDIT', style: pw.TextStyle(fontSize: 12)),
          //                               pw.SizedBox(height: 5),
          //                               pw.Text('Balance: 144.01', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('Party Balance: 144.01', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('Salse Man: SUHEL MIA', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('Bank Details', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('Bank: DDBL', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('Acc No: 1015755784701', style: pw.TextStyle(fontSize: 12)),
          //                               pw.Text('IFSC:', style: pw.TextStyle(fontSize: 12)),
          //                             ]
          //                         )
          //                       //child: pw.Text('ITEM', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- VAT ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 4,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- QTY (quentity) ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12,)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFF7EDC76.toRadixString(16)),
          //                       ///---------- Price ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 12)),
          //                     )
          //                 ),
          //                 pw.Expanded(
          //                     flex: 3,
          //                     child: pw.Container(
          //                       //height: 20,
          //                       margin: pw.EdgeInsets.only(top: 5),
          //                       color: PdfColor.fromHex(0xFFAD381E.toRadixString(16)),
          //                       ///---------- Total Amount ----------///
          //                       child: pw.Text('', style: pw.TextStyle(fontSize: 14,)),
          //                     )
          //                 ),
          //
          //               ]
          //           ),
          //
          //         ]
          //     ),
          //   ),
          // );

          ///---------- old 1 ----------///
          // return pw.Center(
          //   child: pw.Text(
          //     'Hellow Delta Group 2',
          //     style: pw.TextStyle(fontSize: 30),
          //   )
          // );
        }
      )
    );

    /// open preview screen
    Navigator.push(context, MaterialPageRoute(builder: (context) => PreviewScreen(doc: doc),),);

  }

  /// Convert a Pdf to images, one image per page, get only pages 1 and 2 at 72 dpi
  void _convertPdfToImage(pw.Document doc) async {
    await for (var page in Printing.raster(await doc.save(), pages: [0, 1], dpi: 72)) {
      final image = page.toImage(); // ...or page.toPng();
      print(image);
    }
  }

  /// print an existing Pdf file from a Flutter Asset
  void _printExistingPdf() async {
    // import 'package:flutter/services.dart';
    final pdf = await rootBundle.load('assets/document.pdf');
    await Printing.layoutPdf(onLayout: (_) => pdf.buffer.asUint8List());
  }

  /// more advance PDF styling
  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
     pw.Page(
       pageFormat: format,
         build: (context) {
         return pw.Column(
           children: [
             pw.SizedBox(
               width: double.infinity,
               child: pw.FittedBox(
                 child: pw.Text(title, style: pw.TextStyle(font: font)),
               ),
             ),
             pw.SizedBox(height: 20),
             pw.Flexible(child: pw.FlutterLogo()),
           ]
         );
         }
     )
    );
    return pdf.save();
  }

  void generatePdf() async {
    const title = 'Flutter Demo';
    await Printing.layoutPdf(onLayout: (format) => _generatePdf(format, title));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Print PDF'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _createPdf, child: Text('Create & Print PDF'),),
            // ElevatedButton(onPressed: (){
            //   _createPdf,
            // }, child: Text('Create & Print PDF'),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              _displayPdf();
            }, child: Text('Display PDF'),),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              generatePdf();
            }, child: Text('Generate Advance PDF'),),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}


