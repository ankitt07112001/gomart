import 'package:flutter/painting.dart';

class Invoice{
  final String product;
  final String Inunit;
  final String Qty;
  final String Rate;
  final String Total;
  final  subTotal;
  final  TotalQty;

  Invoice(
      {
    required this.product,
        required this.Inunit,
      required this.Qty,
      required this.Rate,
     required this.Total,
        this.subTotal,
      this.TotalQty,
}
      );
  String get _product => product;
  String get _Inunit => Inunit;
  String get _Qty => Qty;
  String get _Rate => Rate;
  String get _Total => Total;
  get _subTotal => subTotal;
  get _TotalQty => Total;

}