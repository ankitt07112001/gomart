// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gomart/component/backgroundcontainer.dart';
// import 'package:gomart/model/invoice.dart';
// import 'package:gomart/model/product.dart';
// import 'package:gomart/pages/mainscreen.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

// import '../component/icon.dart';
// import 'home.dart';

// class Invoicepg extends StatefulWidget {
//   final Invoice? item;

//   const Invoicepg({super.key, this.item});

//   @override
//   State<Invoicepg> createState() => _InvoicepgState();
// }

// class _InvoicepgState extends State<Invoicepg> {
  

//   List<Invoice> InvoiceList = [
//     Invoice(
//       customerName: "Sam Willson",
//       orderDate: "20 May 2023, 10:30 AM",
//       pickUpAddress: "B123 New Ford Street, Workshop Tower",
//       invoiceItems: [
//         InvoiceItem(
//             product: "Banana",
//             inUnit: "1 kg",
//             qty: "1",
//             rate: "\$24",
//             total: "\$26"),
//         InvoiceItem(
//             product: "Apple",
//             inUnit: "1 kg",
//             qty: "2",
//             rate: "\$12",
//             total: "\$24"),
//         InvoiceItem(
//             product: "banana",
//             inUnit: "1 kg",
//             qty: "2",
//             rate: "\$12",
//             total: "\$24"),
//       ],
//       totalQty: "3",
//       subTotal: "\$50",
//       discount: "-\$5",
//       tax: "+\$5",
//       payableAmount: "\$50",
//       product: 'Banana',
//       inUnit: "1 kg",
//       qty: "1",
//       rate: "\$24",
//       total: "\$26",
//       Qty: '1',
//       Inunit: '1 kg',
//       Rate: '\$12',
//       Total: '\$24',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Mybackground(
//       child: Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Column(children: [
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 20, left: 15),
//                   child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => const Mymainscreen()));
//                       },
//                       child: SvgPicture.string(arrowback)),
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 100, top: 40),
//                       child: Container(
//                           child: Text(
//                         'Order',
//                         style: TextStyle(
//                           color: Color(0xFF3F2037),
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       )),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                         padding: const EdgeInsets.only(top: 30, left: 80),
//                         child: Myicon(onTap: () {
//                           Navigator.pushNamed(context, "cart");
//                         }))
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 105),
//                   child: Container(
//                     child: Text(
//                       'Order : 12254354',
//                       style: TextStyle(
//                         color: Color(0xFF575C55),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () async {
//                     final pdf = _generatePdf(InvoiceList);
//                     final bytes = await pdf.save();
//                     await Printing.layoutPdf(onLayout: (PdfPageFormat format) {
//                       return pdf.save();
//                     });
//                   },
//                   child: Text(
//                     'Download',
//                     textAlign: TextAlign.right,
//                     style: TextStyle(
//                       color: Color(0xFF1E9DC2),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       // width: 380,
//                       // height: 200,
//                       decoration: ShapeDecoration(
//                         color: Colors.white.withOpacity(0.3),
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         shadows: [
//                           BoxShadow(
//                             color: Color(0x00000000),
//                             blurRadius: 12,
//                             offset: Offset(0, 6),
//                             spreadRadius: 0,
//                           )
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20, top: 20),
//                             child: Row(
//                               children: [
//                                 Text(
//                                   "Order List",
//                                   style: TextStyle(
//                                     color: Color(0xFF7C7C7C),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                     decoration: TextDecoration.underline,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(right: 20, left: 20),
//                                 child: Text(
//                                   "Product",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 25),
//                                 child: Text(
//                                   "In Unit",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 8),
//                                 child: Text(
//                                   "Qty",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 50),
//                                 child: Text(
//                                   "Rate",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 25),
//                                 child: Text(
//                                   "Total",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               // SizedBox(
//                               //   width: 10,
//                               // ),

//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(right: 20, left: 20),
//                                 child: Text(
//                                   "Banana",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),

//                               Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Text(
//                                   "1kg",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 8),
//                                 child: Text(
//                                   "X",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 8),
//                                 child: Text(
//                                   "1",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 58),
//                                 child: Text(
//                                   "\$24",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Text(
//                                   "\$24",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               // SizedBox(
//                               //   width: 10,
//                               // ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(right: 20, left: 20),
//                                 child: Text(
//                                   "Apple",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Text(
//                                   "1kg",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 8),
//                                 child: Text(
//                                   "X",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               // SizedBox(
//                               //   width: 5,
//                               // ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 8),
//                                 child: Text(
//                                   "2",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 58),
//                                 child: Text(
//                                   "\$24",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),

//                               Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Text(
//                                   "\$24",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(right: 20, left: 20),
//                                 child: Text(
//                                   "Banana",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Text(
//                                   "1kg",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 8),
//                                 child: Text(
//                                   "X",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 8),
//                                 child: Text(
//                                   "1",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 58),
//                                 child: Text(
//                                   "\$24",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 30),
//                                 child: Text(
//                                   "\$24",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 80, top: 200),
//                                 child: Text(
//                                   "Total Qty",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 18,
//                                       fontFamily: 'Open Sans',
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 15.0, top: 200),
//                                 child: Text(
//                                   "04",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 18,
//                                       fontFamily: 'Open Sans',
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 30, top: 200),
//                                 child: Text(
//                                   "Sub Total",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 18,
//                                       fontFamily: 'Open Sans',
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 10.0, top: 200),
//                                 child: Text(
//                                   "\$104",
//                                   style: TextStyle(
//                                       color: Color(0xFF7C7C7C),
//                                       fontSize: 18,
//                                       fontFamily: 'Open Sans',
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       decoration: ShapeDecoration(
//                         color: Colors.white.withOpacity(0.5),
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         shadows: [
//                           BoxShadow(
//                             color: Color(0x00000000),
//                             blurRadius: 12,
//                             offset: Offset(1, 6),
//                             spreadRadius: 0,
//                           )
//                         ],
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 15, top: 5),
//                                 child: Text('Customer Name',
//                                     style: TextStyle(
//                                       color: Color(0xFF828282),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w600,
//                                     )),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 135, top: 5),
//                                 child: Text("Order on",
//                                     style: 