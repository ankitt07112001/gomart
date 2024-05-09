class Order{
  final String Onum;
  final String Anum;
  final String Oonnum;
  final String Ostnum;
  final String Rsnum;
  Order(
  {
    required this.Onum,
    required this.Anum,
    required this.Oonnum,
    required this.Ostnum,
    required this.Rsnum,
}
      );
  String get _Onum => Onum;
  String get _Anum => Anum;
  String get _Oonnum => Oonnum;
  String get _Ostnum => Ostnum;
  String get _Rsnum => Rsnum;
}